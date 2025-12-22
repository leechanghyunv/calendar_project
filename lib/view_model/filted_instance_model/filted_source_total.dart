
import '../../core/utils/converter.dart';
import '../../model/combined_data_model.dart';
import '../../repository/repository_import.dart';

part 'filted_source_total.g.dart';

@riverpod
class WorkRecord extends _$WorkRecord {

  @override
  Future<LaborStatsModel> build() async {
    final contract = ref.watch(viewContractProvider).valueOrNull ?? [];
    final history = ref.watch(viewHistoryProvider).valueOrNull ?? [];

    if (contract.isEmpty || history.isEmpty) {
      return const LaborStatsModel();
    }

    return await _calculateStats(
      CombinedDataModel(contract: contract, history: history),
    );
  }
}

   LaborStatsModel _calculateStats(CombinedDataModel data){

     final subsidyWorkDay = data.history.where((e) => e.record >= 1.0).length;
     final workDay = data.history.where((e) => e.record != 0.0).length;

     final totalPay = data.history.fold(0, (p, e) => p + e.pay);

     final workRecord = data.history.fold(0.0, (p, e) => p + e.record);

     // 정상 근무
     final normalRecords = data.history.where((e) => e.record == 1.0);
     final normalValue = normalRecords.fold(0.0, (p, e) => p + e.record);
     final normalDay = normalRecords.length;

     // 연장 근무
     final extendRecords = data.history.where((e) => e.record == 1.5);
     final extendValue = extendRecords.fold(0.0, (p, e) => p + e.record);
     final extendDay = extendRecords.length;

     // 야간 근무
     final nightRecords = data.history.where((e) => e.record == 2.0);
     final nightValue = nightRecords.fold(0.0, (p, e) => p + e.record);
     final nightDay = nightRecords.length;

     final extraRecords = data.history.where(
             (e) => ![1.0, 1.5, 2.0, 0.0].contains(e.record));

     final extraValue = extraRecords.fold(0.0, (p, e) => p + e.record);
     final extraDay = extraRecords.length;

     // 휴무일
     final offDay = data.history.where((e) => e.record == 0.0).length;

     // contract 관련 계산
     final totalSubsidy = subsidyWorkDay * (data.contract.last.subsidy);
     final totalPayAnd = totalPay + totalSubsidy;

     // 목표 달성률 계산
     final goal = data.contract.last.goal; // 0으로 나누는 것을 방지
     final tax = (data.contract.last.tax) / 100;

     final goalRate = ((totalPay/goal) * 100);
     final goalRateAnd = ((totalPayAnd/goal) * 100);

     final afterTaxAmount = totalPay - (totalPay * tax);
     final afterTaxAmountAnd = afterTaxAmount + totalSubsidy;

     final goalRateAfterTax = ((afterTaxAmount/goal) * 100);
     final goalRateAndAfterTax = ((afterTaxAmountAnd/goal) * 100);
     ///

     final double afterTaxTotal =
     totalPay <= 0 ? 0.0 :
     double.parse((totalPay * (1 - (tax))).toStringAsFixed(1));

     final int remainingAfterTax = goal - afterTaxTotal.toInt();

     final String remainingGoalAfterTax = (() {
       final normalPay = data.contract.last.normal;
       return (remainingAfterTax / (normalPay * (1 - tax)))
           .toStringAsFixed(0);
     })();

     return LaborStatsModel(
       subsidyWorkDay: subsidyWorkDay,
       totalSubsidy: totalSubsidy,
       workDay: workDay,
       totalPay: formatAmount(totalPay),
       totalPayAnd: formatAmount(totalPayAnd),
       workRecord: workRecord,
       normalValue: normalValue,
       normalDay: normalDay,
       extendValue: extendValue,
       extendDay: extendDay,
       nightValue: nightValue,
       nightDay: nightDay,
       extraValue: extraValue,
       extraDay: extraDay,
       offDay: offDay,
       goalRate: '${double.parse(goalRate.toStringAsFixed(2))}%',
       goalRateAnd: '${double.parse(goalRateAnd.toStringAsFixed(2))}%',
       goalRateAfterTax: '${double.parse(goalRateAfterTax.toStringAsFixed(2))}%',
       goalRateAndAfterTax: '${double.parse(goalRateAndAfterTax.toStringAsFixed(2))}%',

       afterTaxTotal: formatAmount(afterTaxTotal.toInt()),
       remainingAfterTax: formatAmount(remainingAfterTax.toInt()),

       remainingGoalAfterTax: '${remainingGoalAfterTax}공수',
     );
   }








