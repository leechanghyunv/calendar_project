// import 'package:calendar_project_240727/base_app_size.dart';
// import 'package:calendar_project_240727/base_consumer.dart';
// import 'package:calendar_project_240727/firebase_analytics.dart';
// import 'package:calendar_project_240727/view_ui/screen/auth_screen/component/tax_numberField.dart';
// import 'package:calendar_project_240727/view_ui/screen/auth_screen/provider/digit_color_provider.dart';
// import 'package:calendar_project_240727/view_ui/screen/user_statistics_screen/provider/construction_survey_provider.dart';
// import 'package:intl/intl.dart';
// import 'package:path/path.dart' as go;
// import '../../../core/export_package.dart';
// import '../../../core/utils/formatter.dart';
// import '../../../model/formz_model.dart';
// import '../../../repository/formz/formz_model.dart';
// import '../../../view_model/view_provider/main_button_index_provider.dart';
// import 'auth_default_screen.dart';
// import 'component/auth_elevatedButton.dart';
// import 'component/pay_input_button.dart';
// import 'const_widget.dart';
// import 'provider/condition_list_provider.dart';
// import 'provider/pay_list_provider.dart';
// import 'component/box_comonent.dart';
// import 'component/job_list_chip.dart';
// import 'component/list_component.dart';
// import 'component/pay_numberField.dart';
//
// class SettingScreen extends HookConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final _formKey = useMemoized(() => GlobalKey<FormBuilderState>());
//
//     final  surveyList = ref.read(constructionSurveyProvider.notifier);
//     final wageFocusNodeA = useFocusNode();
//     final wageFocusNodeB = useFocusNode();
//     final wageFocusNodeC = useFocusNode();
//     final taxFocusNode = useFocusNode();
//     final dayPayFocusNode = useFocusNode();
//
//     final _scrollController = useScrollController();
//
//     final _scrollToTop = useCallback(() {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         if (!_scrollController.hasClients) return;
//
//         _scrollController.animateTo(
//           0, // 맨 위로 스크롤
//           duration: const Duration(milliseconds: 400),
//           curve: Curves.easeOut,
//         );
//       });
//     }, []);
//
//     final _scrollToBottom = useCallback(() {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         if (!_scrollController.hasClients) return;
//         _scrollController.animateTo(
//           _scrollController.position.maxScrollExtent,
//           duration: const Duration(milliseconds: 400),
//           curve: Curves.easeOut,
//         );
//       });
//     }, []);
//
//     useEffect(() {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         if (_scrollController.hasClients) {
//           _scrollController.animateTo(
//             0,
//             duration: Duration(milliseconds: 300),
//             curve: Curves.easeOut,
//           );
//         }
//       });
//       return null;
//     }, []);
//
//     useEffect(() {
//       void listener() {
//         if (taxFocusNode.hasFocus) {
//           ref.read(digitColorProvider.notifier).colorProvider(null);
//           _scrollToBottom();
//         }
//       }
//       taxFocusNode.addListener(listener);
//       return () => taxFocusNode.removeListener(listener);
//     }, [taxFocusNode]);
//
//     final height = context.height;
//     final width =  context.width;
//     final bgColor = ref.watch(digitColorProvider);
//     final dateNow = DateTime.utc(
//         DateTime.now().year, DateTime.now().month, DateTime.now().day);
//
//
//     final normalFieldValue = useState<String>('');
//
//     final hasNormalValue = normalFieldValue.value.isNotEmpty;
//
//     ref.contractForm;
//
//     final formzRefNot = ref.formzWatch;
//     final formzRefRead = ref.formzRead;
//
//
//     ref.listen(formzValidatorProvider, (pre, cur) {
//       if (cur.status == FormzStatus.submissionSuccess) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           if (context.mounted) {
//             ref.read(selectedIndexProvider.notifier).setIndex(1);
//             context.go('/calendar');
//           }
//         });
//       }
//     });
//
//     return AuthDefaultScreen(
//       scrollController: _scrollController,
//       authKey: _formKey,
//       widget: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           InfoRow(
//             title: '근무장소를 선택해주세요 ',
//             subtitle: '초기설정은 유저통계에 반영되고 있습니다.',
//           ),
//           SizedBox(height: 20),
//           FormBuilderField<String>(
//             name: 'site',
//             builder: (FormFieldState<String?> field) {
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: sites.map((site) {
//                   final isSelected = field.value == site['name'];
//                   return GestureDetector(
//                     onTap: () {
//                       field.didChange(site['name']);
//                       ref.read(conditionListProvider.notifier)
//                           .updateCondition(0, site['name']);
//                       surveyList.selectConstructionType(site['name']);
//
//                     },
//
//                     child: siteBox(
//                       context,
//                       site['name'],
//                       site['icon'],
//                       isSelected: isSelected,
//                     ),
//                   );
//                 }).toList(),
//               );
//             },
//           ),
//           SizedBox(height: height > 750 ? (width > 400 ? 40 : 35) : 30),
//           WorkTypeWrap(
//             nodeFocus: wageFocusNodeA,
//             onSubmitted: (val) => _scrollToBottom(),
//             onPressed: () => _scrollToBottom(),
//             onTapSub: () => _scrollToBottom(),
//             onTapMain: (String type) => _scrollToBottom(),
//           ),
//           SizedBox(height: 40),
//
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   InfoRow(
//                     title: '일당을 입력해주세요 ',
//                     subtitle: '일당과 세율 정보는 통계자료에 활용됩니다.',
//                   ),
//                   Spacer(),
//                   PayInputButton(
//                       onSelected: (value) {
//                         normalFieldValue.value = value.toString();
//                         ref.read(digitColorProvider.notifier).colorProvider(
//                             value.toString());
//                         formzRefRead.onChangePay1(value.toString());
//                         final formatter = NumberFormat('#,###');
//                         final formatted = formatter.format(value);
//                         _formKey.currentState?.fields['normal']?.didChange(formatted);
//                       }
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Container(
//                 child: Column(
//                   children: [
//                     PayNumberField(
//                       name: 'normal',
//                       hintText: '150,000',
//                       focusNode: wageFocusNodeA,
//                       inputFormatters: [
//                         CommaInputFormatter6Digits(),
//                       ],
//                       onChanged: (val) {
//                         normalFieldValue.value = val ?? '';
//                         ref.read(digitColorProvider.notifier).colorProvider(val);
//                         if (val != null && val.isNotEmpty) {
//                           _scrollToBottom(); // 📜 입력 시 스크롤 실행
//                           final cleanedValue = val.replaceAll(',', '');
//                           formzRefRead.onChangePay1(cleanedValue);
//                         }
//                       },
//                       onSubmitted: (val) {
//                         _scrollToBottom(); // 📜 입력 시 스크롤 실행
//                         wageFocusNodeB.requestFocus(); // ✅ 다음 텍스트필드로 포커스 이동
//                         ref.read(payListProvider.notifier).update(0, val);
//                       },
//                       suffixIcon: GestureDetector(
//                         onTap: () async {
//                           final normalStr = _formKey.currentState?.fields['normal']?.value ?? '0';
//                           final normal = int.tryParse(normalStr.replaceAll(',', '')) ?? 0;
//                           String formatWithComma(int value) {
//                             final formatter = NumberFormat('#,###');
//                             return formatter.format(value);
//                           }
//
//                           final extended = formatWithComma((normal * 1.5).round());
//                           final night = formatWithComma((normal * 2).round());
//
//                           formzRefRead.onChangePay1(normal.toString());
//                           formzRefRead.onChangePay2(extended);
//                           formzRefRead.onChangePay3(night);
//
//                           ref.read(payListProvider.notifier).update(0, normalStr);
//                           ref.read(payListProvider.notifier).update(1, extended);
//                           ref.read(payListProvider.notifier).update(2, night);
//
//                           _formKey.currentState?.fields['extended']?.didChange(extended);
//                           _formKey.currentState?.fields['night']?.didChange(night);
//                           ref.read(firebaseAnalyticsClassProvider.notifier).autoCopyEvent();
//                           WidgetsBinding.instance.addPostFrameCallback((_) {
//                             taxFocusNode.requestFocus();
//                             _scrollToBottom();
//                           });
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: Container(
//                             child: Text(
//                               '# 자동완성',
//                               textScaler: TextScaler.noScaling,
//                               style: TextStyle(
//                                 fontSize: height > 750 ? 13.5 : 13,
//                                 fontWeight: Platform.isAndroid ? FontWeight.w600 :  FontWeight.w900,
//                                 color: bgColor,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//
//
//
//                     ValidationText(text: formzRefNot.pay1Error),
//
//
//
//                     PayNumberField(
//                       name: 'extended',
//                       hintText: '225,000',
//                       focusNode: wageFocusNodeB,
//                       inputFormatters: [
//                         CommaInputFormatter6Digits(),
//                       ],
//                       onSubmitted: (val) {
//                         wageFocusNodeC.requestFocus(); // ✅ 다음 텍스트필드로 포커스 이동
//                         ref.read(payListProvider.notifier).update(1, val);
//                       },
//                       onChanged: (val) {
//                         if (val != null && val.isNotEmpty) {
//                           final cleanedValue = val.replaceAll(',', '');
//                           formzRefRead.onChangePay2(cleanedValue);
//                         }
//                       },
//                       suffixIcon: GestureDetector(
//                         onTap: () => FocusScope.of(context).unfocus(),
//                         child: Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: Container(
//                             child: Text(
//                               '# 키보드 숨기기',
//                               textScaler: TextScaler.noScaling,
//                               style: TextStyle(
//                                 fontSize: height > 750 ? 13.5 : 13,
//                                 fontWeight: Platform.isAndroid ? FontWeight.bold : FontWeight.w900,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     ValidationText(text: formzRefNot.pay2Error),
//
//                     PayNumberField(
//                       name: 'night',
//                       hintText: '300,000',
//                       focusNode: wageFocusNodeC,
//                       inputFormatters: [
//                         CommaInputFormatter6Digits(),
//                       ],
//                       onChanged: (val) {
//                         if (val != null && val.isNotEmpty) {
//                           final cleanedValue = val.replaceAll(',', '');
//                           formzRefRead.onChangePay3(cleanedValue);
//                         }
//                       },
//                       onSubmitted: (val) {
//                         taxFocusNode.requestFocus(); // ✅ 다음 텍스트필드로 포커스 이동
//                         ref.read(payListProvider.notifier).update(2, val);
//                       },
//                       suffixIcon: GestureDetector(
//                         onTap: () =>  Navigator.of(context, rootNavigator: true).pop(),
//                         child: Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: Container(
//                             child: Text(
//                               '# 일단 나가기',
//                               textScaler: TextScaler.noScaling,
//                               style: TextStyle(
//                                 fontSize: height > 750 ? 13.5 : 13,
//                                 fontWeight: Platform.isAndroid ? FontWeight.bold : FontWeight.w900,
//                                 color: Colors.grey.shade700,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//
//                     ),
//                     ValidationText(text: formzRefNot.pay3Error),
//                     Row(
//                       children: [
//                         Expanded(
//                           flex: 2,
//                           child: TaxNumberField(
//                             name: 'tax',
//                             hintText: '3.3%',
//                             focusNode: taxFocusNode,
//                             inputFormatters: [
//                               PercentInputFormatter(),
//                             ],
//                             onSubmitted: (val) {
//                               dayPayFocusNode.requestFocus();
//                               ref.read(conditionListProvider.notifier).updateCondition(2, val);
//                             },
//                             onChanged: (val) {
//                               if (val == null || val.isEmpty) {
//                                 return;
//                               }
//                               final double doubleValue =
//                                   double.tryParse(val) ?? 0.0;
//                               formzRefRead.onChangeTax(doubleValue);
//                             },
//                             onSelected: (val) {
//                               final formatted =
//                               val.toStringAsFixed(2); // 예: 10.0 -> "10.0"
//                               ref.read(conditionListProvider.notifier).updateCondition(2, val.toString());
//                               _formKey.currentState?.fields['tax']
//                                   ?.didChange(formatted);
//
//                               dayPayFocusNode.requestFocus();
//                             },
//                           ),
//                         ),
//                         SizedBox(width: 10),
//                         Expanded(
//                           flex: 3,
//                           child: PayNumberField(
//                             name: 'day_pay',
//                             hintText: '10,000',
//                             focusNode: dayPayFocusNode,
//                             inputFormatters: [
//                               CommaInputFormatter5Digits(),
//                             ],
//                             onChanged: (val) {
//                               if (val == null || val.isEmpty) {
//                                 return;
//                               }
//                               formzRefRead.onChangeSubsidy(val);
//                             },
//                             onSubmitted: (val) {
//                               ref.read(conditionListProvider.notifier).updateCondition(3, val);
//                               FocusScope.of(context).unfocus();
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 5),
//                     ValidationTextRow(
//                       right: formzRefNot.taxError,
//                       left: formzRefNot.subsidyError,
//                     ),
//                     if (hasNormalValue)
//                       ...[
//                         SizedBox(height: 20),
//                         AuthButton(
//                           onPressedReset: (){
//                             _formKey.currentState?.reset();
//                             ref.read(digitColorProvider.notifier).resetColor();
//                             wageFocusNodeA.requestFocus();
//                             _scrollToTop();
//                           },
//                           onPressed: (){
//                             final site = _formKey.currentState?.fields['site']?.value ?? '';
//                             final workType = _formKey.currentState?.fields['work_type']?.value ?? '';
//                             formzRefRead.onSubmit(
//                                 context, wageFocusNodeA, site,
//                                 workType, dateNow, true);
//                             Navigator.of(context, rootNavigator: true).pop();
//                           },
//                         ),
//                       ]
//
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
