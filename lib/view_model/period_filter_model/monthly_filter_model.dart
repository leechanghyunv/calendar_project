import 'package:dartx/dartx.dart';
import '../../core/utils/converter.dart';
import '../../model/combined_data_model.dart';
import '../../model/contract_model.dart';
import '../../repository/repository_import.dart';
import '../../repository/time/calendar_time_controll.dart';
import '../../view_ui/screen/app_setting_screen/provider/payment_cycle_provider.dart';
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
    ref.keepAlive();

    final cycleData = ref.watch(paymentCycleSwitchProvider).valueOrNull;
    final cycle = (cycleData?.cycle ?? 0) - 1;
    final isActive = cycleData?.isActive ?? false;

    final DateTime startDate;
    final DateTime endDate;
    final DateTime prevStartDate;
    final DateTime prevEndDate;

    if (isActive && cycle > 0) {
      startDate = DateTime.utc(time.year, time.month - 1, cycle + 1);
      endDate = DateTime.utc(time.year, time.month, cycle);
      prevStartDate = DateTime.utc(time.year, time.month - 2, cycle + 1);
      prevEndDate = DateTime.utc(time.year, time.month - 1, cycle);
    } else {
      startDate = DateTime.utc(time.year, time.month, 1);
      endDate = DateTime.utc(time.year, time.month + 1, 1).subtract(const Duration(seconds: 1));
      prevStartDate = DateTime.utc(time.year, time.month - 1, 1);
      prevEndDate = DateTime.utc(time.year, time.month, 1).subtract(const Duration(seconds: 1));
    }


    final workSiteList = ref.watch(selectedCompaniesModelProvider);
    final timeManagerDay = ref.read(timeManagerProvider.notifier).DaySelected;

    // ref.watch는 await 이전에 호출해 Future를 미리 캡처해야 함
    final contractFuture = ref.watch(viewContractProvider.future);
    final historyFuture = ref.watch(viewRangeHistoryProvider(prevStartDate, endDate).future);

    try {
      
      final contract = await contractFuture;
      final history = await historyFuture;
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
   /// 1.0 즉 정상근무 이상으로 출결기록이 있다면 일비 기록을 모두 합한다

  /// /// /// 세후금액의 새로운 정산방식 
  final hasLegacyData = filteredHistory.any((e) => e.pay > 0 && e.afterTax == 0);

  final afterTax = hasLegacyData
      ? totalPay <= 0 ? 0.0 : (totalPay * (1 - tax)).roundToDouble() + newSubsidy
  /// 만약 e.pay랑 afterTax랑 비교해서 9~10%이상 차이가 난다면 pay에
      : filteredHistory.sumBy((e) => e.afterTax).toDouble() + newSubsidy;





/// /// ///
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