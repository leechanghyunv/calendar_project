import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'tax_rates.dart';

part 'tax_repository.g.dart';

/// UI에서 영수증처럼 보여줄 정밀 원 단위 세금 결과 데이터 구조
class TaxReceiptState {
  final int nationalPension;
  final int healthInsurance;
  final int longTermCare;
  final int employmentInsurance;
  final int incomeTax;
  final int localIncomeTax;
  final int totalDeduction;
  final int realReceipts;
  final double strictRawRate;

  const TaxReceiptState({
    this.nationalPension = 0,
    this.healthInsurance = 0,
    this.longTermCare = 0,
    this.employmentInsurance = 0,
    this.incomeTax = 0,
    this.localIncomeTax = 0,
    this.totalDeduction = 0,
    this.realReceipts = 0,
    this.strictRawRate = 0.0,
  });
}

/// 단순 pay를 받아 실시간으로 4대보험 및 법정 정석 세금을 계산해 주는 Repository 프로바이더
@riverpod
TaxReceiptState taxRepository(ref, {required int pay}) {
  return calculateTaxFromPay(pay);
}

/// DB 마이그레이션 및 프로바이더 없이도 호출할 수 있는 공용 4대보험 세금 계산 순수 함수
TaxReceiptState calculateTaxFromPay(int pay) {
  if (pay <= 0) return const TaxReceiptState();

  // 4대 보험 및 법정 정석 세금 연산 (일용근로자 기준)
  final int nationalPension = (pay * TaxRates.nationalPension).floor();
  final int healthInsurance = (pay * TaxRates.healthInsurance).floor();
  final int longTermCare = (healthInsurance * TaxRates.longTermCareFactor).floor();
  final int employmentInsurance = (pay * TaxRates.employmentInsurance).floor();

  // 15만 원 비과세 적용
  final int overWage = pay - TaxRates.dailyTaxFreeLimit;
  final int incomeTax = overWage <= 0 ? 0 : (overWage * TaxRates.incomeTax).floor();
  final int localIncomeTax = (incomeTax * TaxRates.localIncomeTaxFactor).floor();

  final int totalDeduction = nationalPension +
      healthInsurance +
      longTermCare +
      employmentInsurance +
      incomeTax +
      localIncomeTax;

  final double strictRawRate = (totalDeduction / pay) * 100;

  return TaxReceiptState(
    nationalPension: nationalPension,
    healthInsurance: healthInsurance,
    longTermCare: longTermCare,
    employmentInsurance: employmentInsurance,
    incomeTax: incomeTax,
    localIncomeTax: localIncomeTax,
    totalDeduction: totalDeduction,
    realReceipts: pay - totalDeduction,
    strictRawRate: double.parse(strictRawRate.toStringAsFixed(2)),
  );
}
