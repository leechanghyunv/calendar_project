import '../../../../core/export_package.dart';
import '../../../../core/extentions/modal_extension.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../widgets/info_row.dart';

void TaxSettingModal(BuildContext context){
  context.showModal(
    heightRatio: 0.7,
    child: TaxSettingScreen(),
  );
}

/// 국민연금,건강보험,장기요양,고용보험,순수소득세,지방소득세,공제총액,최종실수령액

// class TaxRates {
//
//   /// 일용근로자 하루 비과세(근로소득공제) 기준선: 150,000원
//   /// - 일당이 이 금액 이하이면 국세청 소득세는 무조건 0원(전액 면제)이 됩니다.
//   static const int dailyTaxFreeLimit = 150000;
//
//   /// 국세청 소액부징수 한도: 1,000원
//   /// - 하루 단위로 계산된 소득세가 1,000원 미만(즉, 999원 이하)이면 세금을 징수하지 않고 소멸시킵니다.
//   static const int minimumTaxCollection = 1000;
//
//   /// 4대 보험(국민연금/건강보험) 의무 가입 출역일수 기준: 8일
//   /// - 한 달에 8일 이상 출근 도장을 찍는 순간부터 연금과 건강보험료가 가입(공제)됩니다.
//   static const int insuranceWorkingDaysLimit = 8;
// // -------------------------------------------------------------------------
// // [법정 고정 요율 (본인 부담분 기준)]
// // -------------------------------------------------------------------------
//   static const double nationalPension = 0.0475;      // 국민연금 (4.75%)
//   static const double healthInsurance = 0.03595;     // 건강보험 (3.595%)
//   static const double longTermCareFactor = 0.1314;   // 장기요양 (건보료의 13.14%)
//   static const double employmentInsurance = 0.009;   // 고용보험 (0.9%)
//   static const double incomeTax = 0.027;             // 일용직 실질 소득세 (2.7%)
//   static const double localIncomeTaxFactor = 0.1;    // 지방소득세 (소득세의 10%)
// }
//
// int calculateDailyIncomeTax(int pay) {
//   // 1. 일당에서 15만 원 비과세 기준선을 뺍니다.
//   int overWage = pay - TaxRates.dailyTaxFreeLimit;
//   // 15만 원 이하이면 세금은 무조건 0원 (방패 가동)
//   if (overWage <= 0) return 0;
//   // 2. 15만 원 초과분에 대해서만 2.7% 실질 소득세를 때립니다.
//   return (overWage * TaxRates.incomeTax).floor();
// }

class TaxSettingScreen extends HookConsumerWidget {
  const TaxSettingScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 25),
                Row(
                  children: [
                    InfoRow(
                      title: '세율 상세 설정하기',
                      subtitle: '유저의 상황에 따라 세율 변경이 가능합니다',
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: InkWell(
                        onTap: (){
                          HapticFeedback.selectionClick();
                          Navigator.pop(context);
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Icon(Icons.keyboard_arrow_down,
                            color: context.isDark ? Colors.white : Colors.grey.shade700,
                            size: 25),
                      ),
                    ),
                    SizedBox(height: 20),




                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}
