import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/view_ui/screen/auth_screen/provider/condition_list_provider.dart';
import 'package:calendar_project_240727/view_ui/screen/auth_screen/provider/digit_color_provider.dart';
import 'package:calendar_project_240727/view_ui/screen/auth_screen/provider/pay_list_provider.dart';
import 'package:intl/intl.dart';

import '../../../core/export_package.dart';
import '../../../core/utils/formatter.dart';
import '../../../firebase_analytics.dart';
import '../../../model/formz_model.dart';
import '../../../repository/formz/formz_model.dart';
import '../../../view_model/view_provider/main_button_index_provider.dart';
import 'auth_default_screen.dart';
import 'component/auth_elevatedButton.dart';
import 'component/pay_input_button.dart';
import 'component/pay_numberField.dart';
import 'component/tax_numberField.dart';
import 'const_widget.dart';
import 'new_component/pay_chip_list_widget.dart';
import 'new_component/tax_button.dart';
import 'new_component/tax_button_listView.dart';

class ExSurveyAuthScreen extends HookConsumerWidget {
  const ExSurveyAuthScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;

    final _formKey = useMemoized(() => GlobalKey<FormBuilderState>());

    final normalPay = useState(150000);
    final taxRate = useState(3.3);
    final sliderValue = useState(10.0);
    final selectedTaxRate = useState<double?>(3.3);

    final wageFocusNodeA = useFocusNode();
    final wageFocusNodeB = useFocusNode();
    final wageFocusNodeC = useFocusNode();
    final taxFocusNode = useFocusNode();
    final dayPayFocusNode = useFocusNode();

    final _scrollController = useScrollController();

    final _scrollToTop = useCallback(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_scrollController.hasClients) return;

        _scrollController.animateTo(
          0, // 맨 위로 스크롤
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
        );
      });
    }, []);

    final _scrollToBottom = useCallback(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_scrollController.hasClients) return;

        final currentOffset = _scrollController.offset;
        final targetOffset = currentOffset + 100;

        _scrollController.animateTo(
          targetOffset,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
        );
      });
    }, []);



    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            0,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
      return null;
    }, []);


    useEffect(() {
      void listener() {
        if (taxFocusNode.hasFocus) {
          ref.read(digitColorProvider.notifier).colorProvider(null);
          _scrollToBottom();
        }
      }
      taxFocusNode.addListener(listener);
      return () => taxFocusNode.removeListener(listener);
    }, [taxFocusNode]);

    final normalFieldValue = useState<String>('');

    ref.contractForm;

    final formzRefNot = ref.formzWatch;
    final formzRefRead = ref.formzRead;
    ref.watch(digitColorProvider);

    ref.listen(formzValidatorProvider, (pre, cur) {
      if (cur.status == FormzStatus.submissionSuccess) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            ref.read(selectedIndexProvider.notifier).setIndex(1);
            context.go('/calendar');
          }
        });

      }
    });

    final height = MediaQuery.of(context).size.height;
    final bgColor = ref.watch(digitColorProvider);
    final dateNow = DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day);

    return AuthDefaultScreen(
   scrollController: _scrollController,
   authKey: _formKey,
   widget: Column(
     mainAxisAlignment: MainAxisAlignment.start,
     children: [
       Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           InfoRow(
             title: '일당을 입력해주세요 ',
             subtitle: '일당 버튼 탭만으로 간편하게 일당 설정하기',
           ),
           Spacer(),


         ],
       ),
       SizedBox(height: 15),
       PayChips(
         selectedValue: normalPay.value,
         onSelected: (value) {
           normalFieldValue.value = value.toString();
           normalPay.value = value;
           formzRefRead.onChangePay1(value.toString());
           final formatter = NumberFormat('#,###');
           final formatted = formatter.format(value);
           _formKey.currentState?.fields['normal']?.didChange(formatted);
         },
       ),
       SizedBox(height: 20),
       Container(
         child: Column(
           children: [
             PayNumberField(
               name: 'normal',
               hintText: '150,000',
               focusNode: wageFocusNodeA,
               inputFormatters: [
                 CommaInputFormatter6Digits(),
               ],
               onChanged: (val) {
                 normalFieldValue.value = val ?? '';
                 ref.read(digitColorProvider.notifier).colorProvider(val);
                 if (val != null && val.isNotEmpty) {
                   final cleanedValue = val.replaceAll(',', '');
                   formzRefRead.onChangePay1(cleanedValue);
                 }
               },
               onSubmitted: (val) {
                 wageFocusNodeB.requestFocus(); // ✅ 다음 텍스트필드로 포커스 이동
                 ref.read(payListProvider.notifier).update(0, val);
               },
               suffixIcon: GestureDetector(
                 onTap: () async {
                   final normalStr = _formKey.currentState?.fields['normal']?.value ?? '0';
                   final normal = int.tryParse(normalStr.replaceAll(',', '')) ?? 0;
                   String formatWithComma(int value) {
                     final formatter = NumberFormat('#,###');
                     return formatter.format(value);
                   }

                   final extended = formatWithComma((normal * 1.5).round());
                   final night = formatWithComma((normal * 2).round());

                   formzRefRead.onChangePay1(normal.toString());
                   formzRefRead.onChangePay2(extended);
                   formzRefRead.onChangePay3(night);

                   ref.read(payListProvider.notifier).update(0, normalStr);
                   ref.read(payListProvider.notifier).update(1, extended);
                   ref.read(payListProvider.notifier).update(2, night);

                   _formKey.currentState?.fields['extended']?.didChange(extended);
                   _formKey.currentState?.fields['night']?.didChange(night);
                   ref.read(firebaseAnalyticsClassProvider.notifier).autoCopyEvent();
                   WidgetsBinding.instance.addPostFrameCallback((_) {
                     taxFocusNode.requestFocus();
                   });
                 },
                 child: Padding(
                   padding: const EdgeInsets.all(12.0),
                   child: Container(
                     child: Text(
                       '# 자동완성',
                       textScaler: TextScaler.noScaling,
                       style: TextStyle(
                         fontSize: height > 750 ? 13.5 : 13,
                         fontWeight: Platform.isAndroid ? FontWeight.w600 :  FontWeight.w900,
                         color: bgColor,
                       ),
                     ),
                   ),
                 ),
               ),
             ),
             ValidationText(text: formzRefNot.pay1Error),
             PayNumberField(
               name: 'extended',
               hintText: '225,000',
               focusNode: wageFocusNodeB,
               inputFormatters: [
                 CommaInputFormatter6Digits(),
               ],
               onSubmitted: (val) {
                 wageFocusNodeC.requestFocus(); // ✅ 다음 텍스트필드로 포커스 이동
                 ref.read(payListProvider.notifier).update(1, val);
               },
               onChanged: (val) {
                 if (val != null && val.isNotEmpty) {
                   final cleanedValue = val.replaceAll(',', '');
                   formzRefRead.onChangePay2(cleanedValue);
                 }
               },
               suffixIcon: GestureDetector(
                 onTap: () => FocusScope.of(context).unfocus(),
                 child: Padding(
                   padding: const EdgeInsets.all(12.0),
                   child: Container(
                     child: Text(
                       '# 키보드 숨기기',
                       textScaler: TextScaler.noScaling,
                       style: TextStyle(
                         fontSize: height > 750 ? 13.5 : 13,
                         fontWeight: Platform.isAndroid ? FontWeight.bold : FontWeight.w900,
                         color: Colors.grey,
                       ),
                     ),
                   ),
                 ),
               ),
             ),
             ValidationText(text: formzRefNot.pay2Error),
             PayNumberField(
               name: 'night',
               hintText: '300,000',
               focusNode: wageFocusNodeC,
               inputFormatters: [
                 CommaInputFormatter6Digits(),
               ],
               onChanged: (val) {
                 if (val != null && val.isNotEmpty) {
                   final cleanedValue = val.replaceAll(',', '');
                   formzRefRead.onChangePay3(cleanedValue);
                 }
               },
               onSubmitted: (val) {
                 taxFocusNode.requestFocus(); // ✅ 다음 텍스트필드로 포커스 이동
                 ref.read(payListProvider.notifier).update(2, val);
               },
             ),
             ValidationText(text: formzRefNot.pay3Error),
             SizedBox(height: 5),

             Container(
               height: 135,
               width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(
                 color: Colors.grey.shade50,
                 border: Border.all(width: 1,color: Colors.grey.shade700),
                 borderRadius: BorderRadius.circular(10),

               ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(
                         vertical: 12.0,
                         horizontal: 16.0),
                     child: Row(
                       children: [
                         TextWidget('세율을 설정해주세요 (기본값 ${taxRate.value}%)',
                             13.5, appWidth,color: Colors.grey.shade700),
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(right: 12.0),
                     child: Row(
                       children: [
                         Expanded(
                           child: SliderTheme(
                             data: SliderTheme.of(context).copyWith(
                               activeTrackColor: Colors.green[400],
                               inactiveTrackColor: Colors.grey[300],
                               thumbColor: Colors.white,
                               thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14),
                               overlayColor: Colors.grey.withOpacity(0.2),
                             ),
                             child: Slider(
                               value: sliderValue.value,
                               min: 7,
                               max: 15,
                               divisions: 70,
                               onChanged: (val){

                               },
                             ),
                           ),
                         ),
                         TextWidget('3.3%', 13.5, appWidth,
                             color: Colors.grey.shade700),
                       ],
                     ),
                   ),
                   TaxButtonList(
                     selectedTaxRate: selectedTaxRate.value,
                     onTaxSelected: (rate) {
                       selectedTaxRate.value = rate;
                     },
                   ),
                   Spacer(),

                 ],
               ),
             ),
             SizedBox(height: 20),
             Row(
               children: [
                 // Expanded(
                 //   flex: 2,
                 //   child: TaxNumberField(
                 //     name: 'tax',
                 //     hintText: '3.3%',
                 //     focusNode: taxFocusNode,
                 //     inputFormatters: [
                 //       PercentInputFormatter(),
                 //     ],
                 //     onSubmitted: (val) {
                 //       dayPayFocusNode.requestFocus();
                 //       ref.read(conditionListProvider.notifier).updateCondition(2, val);
                 //       _scrollToBottom();
                 //     },
                 //     onChanged: (val) {
                 //       if (val == null || val.isEmpty) {
                 //         return;
                 //       }
                 //       final double doubleValue =
                 //           double.tryParse(val) ?? 0.0;
                 //       formzRefRead.onChangeTax(doubleValue);
                 //     },
                 //     onSelected: (val) {
                 //       final formatted =
                 //       val.toStringAsFixed(2); // 예: 10.0 -> "10.0"
                 //       ref.read(conditionListProvider.notifier).updateCondition(2, val.toString());
                 //       _formKey.currentState?.fields['tax']
                 //           ?.didChange(formatted);
                 //       dayPayFocusNode.requestFocus();
                 //     },
                 //   ),
                 // ),
                 // SizedBox(width: 10),
                 Expanded(
                   flex: 3,
                   child: PayNumberField(
                     name: 'day_pay',
                     hintText: formzRefNot.subsidyError,
                     focusNode: dayPayFocusNode,
                     inputFormatters: [
                       CommaInputFormatter5Digits(),
                     ],
                     onChanged: (val) {
                       if (val == null || val.isEmpty) {
                         return;
                       }
                       formzRefRead.onChangeSubsidy(val);
                     },
                     onSubmitted: (val) {
                       ref.read(conditionListProvider.notifier).updateCondition(3, val);
                       FocusScope.of(context).unfocus();
                     },
                   ),
                 ),
               ],
             ),
             SizedBox(height: 15),
             // ValidationText(text: formzRefNot.subsidyError2),
             AuthButton(
               onPressedReset: (){
                 _formKey.currentState?.reset();
                 ref.read(digitColorProvider.notifier).resetColor();
                 wageFocusNodeA.requestFocus();
                 _scrollToTop();
               },
               onPressed: (){
                 final site = _formKey.currentState?.fields['site']?.value ?? '';
                 final workType = _formKey.currentState?.fields['work_type']?.value ?? '';
                 formzRefRead.onSubmit(
                     context, wageFocusNodeA,
                     taxFocusNode, site,
                     workType, dateNow, true);
                 Navigator.of(context, rootNavigator: true).pop();
               },
             ),

           ],
         ),
       ),
     ],
   ),


    );
  }
}
