import 'package:dartx/dartx.dart';
import '../../core/utils/converter.dart';
import '../../model/combined_data_model.dart';
import '../../model/contract_model.dart';
import '../../repository/repository_import.dart';
import '../../repository/time/calendar_time_controll.dart';
import '../view_provider/selected_companise_model.dart';

part 'monthly_filter_model.g.dart';

class CombinedDataModel {
  final List<LabourCondition> contract;
  final List<WorkHistory> history;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime prevStartDate;
  final DateTime prevEndDate;
  final DateTime timeManagerDay;

  CombinedDataModel({
    required this.contract,
    required this.history,
    required this.startDate,
    required this.endDate,
    required this.prevStartDate,
    required this.prevEndDate,
    required this.timeManagerDay,
  });

}


@riverpod
class MonthRecord extends _$MonthRecord {

  @override
  Future<LaborSummaryModel> build(DateTime time) async {

    final startDate = DateTime.utc(time.year, time.month, 1);
    final endDate = DateTime.utc(time.year, time.month + 1, 1).subtract(const Duration(seconds: 1));

    final prevStartDate = DateTime.utc(time.year, time.month - 1, 1);
    final prevEndDate = DateTime.utc(time.year, time.month, 1).subtract(const Duration(seconds: 1));

    final workSiteList = ref.watch(selectedCompaniesModelProvider);


    final timeManagerDay = ref.read(timeManagerProvider.notifier).DaySelected;

    try {
      final contract = await ref.watch(viewContractProvider.future);
      final history = await ref.watch(viewRangeHistoryProvider(prevStartDate,endDate).future);

      // 빈 데이터 체크
      if (history.isEmpty || contract.isEmpty) {

        return const LaborSummaryModel();

      }

      final result =  _calculateStats(
          CombinedDataModel(
            contract: contract,
            history: history,
            startDate: startDate,
            endDate: endDate,
            prevStartDate: prevStartDate,
            prevEndDate: prevEndDate,
            timeManagerDay: timeManagerDay,
          )
          ,workSiteList
      );

      return result;


    } catch (e) {
      return const LaborSummaryModel();
    }

  }
}

LaborSummaryModel _calculateStats(CombinedDataModel data,List<String> siteList){

  final contract = data.contract;
  final history = data.history;
  final startDate = data.startDate;
  final endDate = data.endDate;
  final prevStartDate = data.prevStartDate;
  final prevEndDate = data.prevEndDate;
  final timeManagerDay = data.timeManagerDay;

  final currentContract = contract.isNotEmpty
      ? contract.last
      : LabourCondition(date: timeManagerDay);

  final taxString = '세율 ${currentContract.tax}%';
  final tax = (data.contract.last.tax) / 100;

// 날짜 범위로 히스토리 필터링
  final filteredHistory = _filterHistoryByDateRange(history, startDate, endDate, workSites: siteList);
      final prevHistory = _filterHistoryByDateRange(history, prevStartDate, prevEndDate,workSites: siteList);
      final filterWorkSites = _filterHistoryByDateOnly(history, startDate, endDate);

  final subsidyDay = filteredHistory.count((e) => e.record >= 1.0);
  final workDay = filteredHistory.count((e) => e.record != 0.0);
  final normalDay = filteredHistory.count((e) => e.record == 1.0);
  final extendDay = filteredHistory.count((e) => e.record == 1.5);
  final nightDay = filteredHistory.count((e) => e.record == 2.0);

  final extraDay = filteredHistory.count(
          (e) => e.record != 0.0 && ![1.0, 1.5, 2.0].contains(e.record)
  );

  final workSites = filterWorkSites.map((e) => e.workSite.trim())
      .where((site) => site.isNotEmpty).toSet().toList();

  // 휴일 계산
  final offDay = filteredHistory.count((e) => e.record == 0.0);
  // 금액 계산
  final totalPay = filteredHistory.sumBy((e) => e.pay);


  final newSubsidy = filteredHistory.where((e) => e.record >= 1.0).sumBy((e) => e.subsidy);


  final afterTax = totalPay <= 0 ? 0.0 : (totalPay * (1 - tax)).roundToDouble() + newSubsidy;

  final prevPay = prevHistory.sumBy((e) => e.pay);

  final totalPayAnd = totalPay + newSubsidy;

  final normalPay = normalDay * currentContract.normal;
  final extendPay = extendDay * currentContract.extend;
  final nightPay = nightDay * currentContract.night;

  final workRecord = filteredHistory.sumBy((e) => e.record);

  return LaborSummaryModel(
    subsidyDay: subsidyDay,
    totalSubsidy: formatAmount(newSubsidy),
    workDay: workDay,
    totalPay: totalPayAnd,
    tax: taxString,
    afterTax: formatAmount(afterTax.toInt()),

    prevPay: prevPay,
    totalPayString: formatAmount(totalPayAnd),
    prevPayString: formatAmount(prevPay),

    totalPayAnd: formatAmount(totalPayAnd),
    record: workRecord,
    workRecord: '${workRecord.toStringAsFixed(1)}공수',
    normalDay: normalDay,
    normalPay: formatAmount(normalPay),
    extendDay: extendDay,
    extendPay: formatAmount(extendPay),
    nightDay: nightDay,
    nightPay: formatAmount(nightPay),
    extraDay: extraDay,
    offDay: offDay,
    workSites: workSites,
  );
}

List<WorkHistory> _filterHistoryByDateRange(
    List<WorkHistory> history,
    DateTime start,
    DateTime end,
    {List<String> workSites = const []}
    ) {
  try {

    final filteredList = history.where((item) {
      final isInDateRange =
          (item.date.isAtSameMomentAs(start) || item.date.isAfter(start)) &&
              (item.date.isAtSameMomentAs(end) || item.date.isBefore(end));

      // 🆕 작업현장 제외 조건
      final isNotExcluded = workSites.isEmpty ||
          !workSites.contains(item.workSite);

      return isInDateRange && isNotExcluded;
    }).toList();


    return filteredList;
  } catch (e) {
    print('날짜 필터링 중 오류 발생: $e');
    return []; // 오류 발생 시 빈 리스트 반환
  }
}

List<WorkHistory> _filterHistoryByDateOnly(
    List<WorkHistory> history,
    DateTime start,
    DateTime end,
    ) {
  try {
    return history.where((item) {
      return (item.date.isAtSameMomentAs(start) || item.date.isAfter(start)) &&
          (item.date.isAtSameMomentAs(end) || item.date.isBefore(end));
    }).toList();
  } catch (e) {
    print('날짜 필터링 중 오류 발생: $e');
    return [];
  }
}