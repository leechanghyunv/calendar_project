import 'package:calendar_project_240727/view_model/contract_model.dart';
import 'package:calendar_project_240727/view_model/history_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/combined_data_model.dart';
import '../model/work_history_model.dart';

part 'filted_source_model.g.dart';

@riverpod
class NumericSourceModel extends _$NumericSourceModel {

  late DateTime startDate;
  late DateTime endDate;

   /// item.date.isAfter(startDate) && item.date.isBefore(endDate)
   List<WorkHistory> filteredHistory = [];

  int get goal => state.value?.contract.last.goal ?? 0;
  double get tax => state.value?.contract.last.tax ?? 0.0; /// %를 제외한 숫자로 나오기때문에 필터링

  int get contractNormal {
    // 상태 확인 및 기본값 반환
    if (state.value == null || state.value!.contract.isEmpty) {
      return 0; // 기본값 0 반환
    }
    return state.value!.contract.last.normal; // non-null assertion 사용
  }

  int get contractExtend {
    // 상태 확인 및 기본값 반환
    if (state.value == null || state.value!.contract.isEmpty) {
      return 0; // 기본값 0 반환
    }
    return state.value!.contract.last.extend; // non-null assertion 사용
  }

  int get contractNight {
    // 상태 확인 및 기본값 반환
    if (state.value == null || state.value!.contract.isEmpty) {
      return 0; // 기본값 0 반환
    }
    return state.value!.contract.last.night; // non-null assertion 사용
  }

  int get subsidy {
    if (state.value?.contract.isEmpty ?? true) {
      return 0; // contract가 비어 있으면 0 반환
    }
    return state.value?.contract.last.subsidy ?? 0;
  }

  int get subsidyworkDay => state.value?.history.where((e) => e.record >= 1.0).length ?? 0;
  int get subsidyworkDaynMonth => filteredHistory.where((e) => e.record >= 1.0).length;

  int get totolSubsidy => subsidy * subsidyworkDay;


  int get totolSubsidyDaynMonth => subsidy * subsidyworkDaynMonth;


  double get filtedTax => tax/100; /// ex 0.2 -> 20%
 /// map((e) => e.record != 0.0)
  int get workDay => state.value?.history.where((e) => e.record != 0.0).length ?? 0;
  int get workDaynMonth => filteredHistory.where((e) => e.record != 0.0).length;

  int get totalPay => state.value?.history.fold(0,(p,e) => p + e.pay).toInt() ?? 0;
  int get totalPaynMonth => filteredHistory.fold(0,(p,e) => p + e.pay);
/// 일비 추가시 사용
  int get totalPayAnd => totalPay + totolSubsidy;
  int get totalPaynMonthAnd => totalPaynMonth + totolSubsidyDaynMonth;

  double get workRecode => state.value?.history.fold(0.0,(p,e) => p! + e.record) ?? 0.0;
  double get workRecodenMonth => filteredHistory.fold(0.0,(p,e) => p + e.record);

  double get normalValue => filteredHistory.where((e) => e.record == 1.0).
  map((e) => e.record).fold(0.0, (value, element) => value + element);

  int get normalPay => normalDay * contractNormal;

  int get normalDay => filteredHistory.where((e) => e.record == 1.0).map((e) => e.record).length;
  /// 이번달의 정상근무 금액 총합 ex)15 공수 20공수


  double get extendValue => filteredHistory.where((e) => e.record == 1.5).
  map((e) => e.record).fold(0.0, (value, element) => value + element);

  int get extendPay => extendDay * contractExtend.toInt();

  int get extendDay => filteredHistory.where((e) => e.record == 1.5).map((e) => e.record).length;
  /// 이번달의 정상근무 금액 총합 ex)15 공수 20공수

  double get nightValue => filteredHistory.where((e) => e.record == 2.0).
  map((e) => e.record).fold(0.0, (value, element) => value + element);

  int get nightPay => nightDay * contractNight;

  int get nightDay => filteredHistory.where((e) => e.record == 2.0).map((e) => e.record).length;


  double get extraPay => filteredHistory.where((e) => e.record != 1.0 && e.record != 1.5 && e.record != 2.0).
      map((e) => e.record).fold(0.0, (value, element) => value + element);
  int get extraDay => filteredHistory.where((e) => e.record != 1.0 && e.record != 1.5 && e.record != 2.0 && e.record != 0.0).length;

  int get offDay => filteredHistory.where((e) => e.record == 0.0).length;


  double get goalRate => double.parse(((totalPay/goal) * 100).toStringAsFixed(2));
  double get goalRateAnd => double.parse(((totalPayAnd/goal) * 100).toStringAsFixed(2));

  double get goalRateAfterTax => double.parse(((afterTaxTotal/goal) * 100).toStringAsFixed(2));
  double get goalRateAndAfterTax => double.parse(((afterTaxTotalAnd/goal) * 100).toStringAsFixed(2));

  /// 총 세후 금액

  double get afterTaxTotal {
    // totalPay가 null 또는 0인지 확인
    if (totalPay <= 0) {
      return 0.0; // totalPay가 유효하지 않으면 0 반환
    }
    // filtedTax가 null일 경우 0으로 처리
    double taxRate = filtedTax ?? 0;
    // 세후 총액 계산
    double afterTaxAmount = totalPay - (totalPay * taxRate);
    // 계산 결과가 유효한지 확인
    if (afterTaxAmount < 0) {
      return 0.0; // 음수가 되지 않도록 처리
    }
    // 결과를 소수점 1자리로 포맷팅
    return double.parse(afterTaxAmount.toStringAsFixed(1));
  }


  double get afterTaxTotalAnd => afterTaxTotal + totolSubsidy;
  /// 이번달 세후 금액
  double get afterTaxMonth {
    if (totalPaynMonth == 0) {
      return 0.0;
    }
    return double.parse(
        (totalPaynMonth - (totalPaynMonth * filtedTax)).toStringAsFixed(1)
    );
  }

  double get normalPercent => double.parse(((normalDay/workDaynMonth) * 100).toStringAsFixed(1));
  double get extendPercent => double.parse(((extendDay/workDaynMonth) * 100).toStringAsFixed(1));
  double get nightPercent => double.parse(((nightDay/workDaynMonth) * 100).toStringAsFixed(1));
  double get extraPercent => double.parse(((extraDay/workDaynMonth) * 100).toStringAsFixed(1));
  double get offPercent => double.parse(((offDay/workDaynMonth) * 100).toStringAsFixed(1));

  int get remaining {
    final parsedGoal = int.tryParse(goal.toString());
    if (parsedGoal == null) {
      return 0;
    }
    final difference = parsedGoal - totalPay;
    return difference.isNaN ? 0 : difference;
  }

  int get remainingAfterTax {
    final parsedGoal = int.tryParse(goal.toString());
    if (parsedGoal == null) {
      return 0;
    }
    final difference = parsedGoal - afterTaxTotal.toInt();
    return difference.isNaN ? 0 : difference;
  }
  /// /// /// /// ////// /// /// /// ////// /// /// /// ////// /// /// /// ///
  int get remainingPlus {
    final parsedGoal = int.tryParse(goal.toString());
    if (parsedGoal == null) {
      return 0;
    }
    final difference = parsedGoal - totalPayAnd;
    return difference.isNaN ? 0 : difference;
  }

  int get remainingPlusAfterTax {
    final parsedGoal = int.tryParse(goal.toString());
    if (parsedGoal == null) {
      return 0;
    }
    final difference = parsedGoal - afterTaxTotalAnd.toInt();
    return difference.isNaN ? 0 : difference;
  }

  /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// ///

  String get remainingGoal {
    final normalPay = state.value?.contract.last.normal ?? 1; // to avoid division by zero
    final remainingGoal = (remaining / normalPay).toStringAsFixed(0);
    return remainingGoal.isEmpty ? "0.0" : remainingGoal;
  }

  String get remainingGoalAfterTax {
    final normalPay = state.value?.contract.last.normal ?? 1; // to avoid division by zero
    final normalPayAfter = normalPay - (normalPay * filtedTax);
    final remainingGoal = (remainingAfterTax / normalPayAfter).toStringAsFixed(0);
    return remainingGoal.isEmpty ? "0.0" : remainingGoal;
  }

  /// 세후 남은 공수가 몇인가
  String get remainingGoalPlus {
    final normalPay = state.value?.contract.last.normal ?? 1; // to avoid division by zero
    final normalPayPlus = normalPay + subsidy;
    final remainingGoal = (remainingPlus / normalPayPlus).toStringAsFixed(0);
    return remainingGoal.isEmpty ? "0.0" : remainingGoal;
  }


  /// 일비 포함 세후 남는 공수
  String get remainingGoalPlusAfterTax {
    final normalPay = state.value?.contract.last.normal ?? 1; // to avoid division by zero
    final normalPayAfter = normalPay - (normalPay * filtedTax);
    final normalPayPlusAfter = normalPayAfter + subsidy;
    final remainingGoal = (remainingPlusAfterTax / normalPayPlusAfter).toStringAsFixed(0);
    return remainingGoal.isEmpty ? "0.0" : remainingGoal;
  }

 /// numericSourceModelProvider
  @override
  Future<CombinedDataModel> build(DateTime time) async {
    return refreshData(time);
  }

  Future<CombinedDataModel> refreshData(DateTime time) async {
    final contract = await ref.watch(viewContractProvider.future);
    final history = await ref.watch(viewHistoryProvider.future);

    startDate = DateTime(time.year, time.month, 1);
    endDate = DateTime(time.year, time.month + 1, 1).subtract(const Duration(seconds: 1));

    filteredHistory = history.where((item) {
      return item.date.isAfter(startDate) && item.date.isBefore(endDate);
    }).toList();
    return CombinedDataModel(contract: contract, history: history);
  }


}
