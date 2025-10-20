import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/view_ui/screen/auth_screen/provider/pay_list_provider.dart';
import 'package:intl/intl.dart';

import '../../../core/export_package.dart';
import '../../../firebase_analytics.dart';
import '../../../model/formz_model.dart';
import '../../../repository/formz/formz_model.dart';
import '../../../view_model/view_provider/main_button_index_provider.dart';
import 'auth_default_screen.dart';
import 'component/auth_elevatedButton.dart';
import 'component/pay_numberField.dart';
import 'const_widget.dart';
import 'new_component/auth_header.dart';
import 'new_component/pay_chip_list_widget.dart';
import 'new_component/tax_component/tax_component.dart';

class ExSurveyAuthScreen extends HookConsumerWidget {
  const ExSurveyAuthScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final _formKey = useMemoized(() => GlobalKey<FormBuilderState>());

    final normalPay = useState(150000);
    final taxRate = useState(3.3);
    final sliderValue = useState(10.0);
    final _hasScrolled = useRef(false);

    final wageFocusNodeA = useFocusNode();
    final wageFocusNodeB = useFocusNode();
    final wageFocusNodeC = useFocusNode();

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
      if (_hasScrolled.value) return;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_scrollController.hasClients) return;

        final currentOffset = _scrollController.offset;
        final targetOffset = currentOffset + 100;

        _scrollController.animateTo(
          targetOffset,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
        );
        // 스크롤 완료 후 제한 활성화
        _hasScrolled.value = true;
      });
    }, []);

    useEffect(() {
      void listener() {
        if (wageFocusNodeA.hasFocus) {
          _scrollToBottom();;
        }
      }

      wageFocusNodeA.addListener(listener);
      return () => wageFocusNodeA.removeListener(listener);
    }, [wageFocusNodeA]);

    final normalFieldValue = useState<String>('');

    ref.contractForm;

    final formzRefNot = ref.formzWatch;
    final formzRefRead = ref.formzRead;

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

    final appWidth = context.width;
    final  appHeight = context.height;

    final dateNow = DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day);

    return AuthDefaultScreen(
   scrollController: _scrollController,
   authKey: _formKey,
   widget: SingleChildScrollView(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         appHeight > 750 ? SizedBox(height: 5) : SizedBox.shrink(),
         appHeight > 750 ? AuthHeader(
           value: normalPay.value,
           onChanged: (val){
             normalPay.value = val;
             formzRefRead.onChangePay1(val.toString());
             final formatter = NumberFormat('#,###');
             final formatted = formatter.format(val);
             _formKey.currentState?.fields['normal']?.didChange(formatted);
           },
         ) : SizedBox.shrink(),
         appHeight > 750 ? SizedBox(height: 20) : SizedBox.shrink(),
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
         appHeight > 750 ? SizedBox(height: 20) : SizedBox(height: 15),
         Container(
           child: Column(
             children: [
               PayNumberField(
                 name: 'normal',
                 hintText: '150,000',
                 action: PayFieldAction.autoComplete,
                 focusNode: wageFocusNodeA,
                 onChanged: (val) {
                   normalFieldValue.value = val ?? '';
                   if (val != null && val.isNotEmpty) {
                     final cleanedValue = val.replaceAll(',', '');
                     formzRefRead.onChangePay1(cleanedValue);
                   }
                 },
                 onSubmitted: (val) {
                   wageFocusNodeB.requestFocus(); // ✅ 다음 텍스트필드로 포커스 이동
                   ref.read(payListProvider.notifier).update(0, val);
                 },
                 onActionTap: (){
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
                 },
               ),

               ValidationText(text: formzRefNot.pay1Error),
               PayNumberField(
                 name: 'extended',
                 hintText: '225,000',
                 action: PayFieldAction.hideKeyboard,
                 focusNode: wageFocusNodeB,
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
               ),
               ValidationText(text: formzRefNot.pay2Error),
               Row(
                 children: [
                   Expanded(
                     flex: 3,
                     child: PayNumberField(
                       name: 'night',
                       hintText: '300,000',
                       action: PayFieldAction.closeInput,
                       focusNode: wageFocusNodeC,
                       onChanged: (val) {
                         if (val != null && val.isNotEmpty) {
                           final cleanedValue = val.replaceAll(',', '');
                           formzRefRead.onChangePay3(cleanedValue);
                         }
                       },
                       onSubmitted: (val) {
                         ref.read(payListProvider.notifier).update(2, val);
                       },
                     ),
                   ),
                   // SizedBox(width: 15),
                   // Expanded(
                   //   flex: 2,
                   //   child: PayNumberField(
                   //     name: 'day_pay',
                   //     hintText: '10,000',
                   //     focusNode: dayPayFocusNode,
                   //     inputFormatters: [
                   //       CommaInputFormatter5Digits(),
                   //     ],
                   //     onChanged: (val) {
                   //       if (val == null || val.isEmpty) {
                   //         return;
                   //       }
                   //       formzRefRead.onChangeSubsidy(val);
                   //     },
                   //     onSubmitted: (val) {
                   //       ref.read(conditionListProvider.notifier).updateCondition(3, val);
                   //       FocusScope.of(context).unfocus();
                   //     },
                   //   ),
                   // ),
                 ],
               ),
               SizedBox(height: 5),
               Row(
                 children: [
                   ErrorText(' ${formzRefNot.pay3Error}',appWidth,
                       color: context.subTextColor),
                 ],
               ),

               TaxComponent(
                 taxRate: taxRate.value,
                 sliderValue: sliderValue.value,
                 onTaxChanged: (val) {
                   _scrollToBottom();
                   taxRate.value = val;
                   formzRefRead.onChangeTax(val);
                 },
                 onSliderChanged: (val) {
                   _scrollToBottom();
                   sliderValue.value = val;
                   formzRefRead.onChangeTax(val);
                 },
                 onTaxButtonSelected: (rate) {
                   _scrollToBottom();
                   taxRate.value = rate;
                   formzRefRead.onChangeTax(rate);
                   // 3.3이 아닌 경우만 슬라이더 값 업데이트
                   if (rate >= 7 && rate <= 15) {
                     sliderValue.value = rate;
                   }
     
                   _formKey.currentState?.fields['tax']?.didChange(rate);
                 },
               ),
     
     
               AuthButton(
                 onPressedReset: (){
                   _formKey.currentState?.reset();
                   wageFocusNodeA.requestFocus();
                   _scrollToTop();
                 },
                 onPressed: (){
                   final site = _formKey.currentState?.fields['site']?.value ?? '';
                   final workType = _formKey.currentState?.fields['work_type']?.value ?? '';
                   // 🔥 세금값이 설정되지 않은 경우 기본값 적용
                   final currentTaxValue = _formKey.currentState?.fields['tax']?.value;
                   if (currentTaxValue == null) {
                     formzRefRead.onChangeTax(taxRate.value); // 기본값 3.3 적용
                   }
                   formzRefRead.onSubmit(
                       context, wageFocusNodeA, site,
                       workType, dateNow, true);
                   Navigator.of(context, rootNavigator: true).pop();
                 },
               ),
     
             ],
           ),
         ),
       ],
     ),
   ),
    );
  }
}
