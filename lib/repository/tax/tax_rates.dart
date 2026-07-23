/// 한국 법정 세율 상수 클래스
/// 일용근로자 기준 4대 보험 + 소득세 요율 (본인 부담분)
class TaxRates {

  /// 일용근로자 하루 비과세(근로소득공제) 기준선: 150,000원
  static const int dailyTaxFreeLimit = 150000;

  /// 국세청 소액부징수 한도: 1,000원
  static const int minimumTaxCollection = 1000;

  /// 4대 보험(국민연금/건강보험) 의무 가입 출역일수 기준: 8일
  static const int insuranceWorkingDaysLimit = 8;

  // ── 법정 고정 요율 (본인 부담분 기준) ──
  static const double nationalPension = 0.0475;        // 국민연금 (4.75%)
  static const double healthInsurance = 0.03595;       // 건강보험 (3.595%)
  static const double longTermCareFactor = 0.1314;     // 장기요양 (건보료의 13.14%)
  static const double employmentInsurance = 0.009;     // 고용보험 (0.9%)
  static const double incomeTax = 0.027;               // 일용직 실질 소득세 (2.7%)
  static const double localIncomeTaxFactor = 0.1;      // 지방소득세 (소득세의 10%)

  // ── 프리랜서 (3.3%) ──
  static const double freelancerIncomeTax = 0.03;      // 소득세 3%
  static const double freelancerLocalTaxFactor = 0.1;  // 지방소득세 (소득세의 10%)
}
