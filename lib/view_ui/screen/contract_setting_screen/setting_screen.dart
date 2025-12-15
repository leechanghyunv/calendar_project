import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/view_ui/screen/contract_setting_screen/component/setting_component.dart';
import 'package:calendar_project_240727/view_ui/screen/contract_setting_screen/workSite/workSiteRegistration.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/component/function_chip.dart';
import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';
import '../../../model/formz/formz_decimal_model.dart';
import '../../../repository/formz/formz_decimal.dart';
import '../../../view_model/sqlite_model/contract_model.dart';
import '../../../view_model/sqlite_model/history_model.dart';
import '../app_setting_screen/component/additional_pay_component.dart';
import '../app_setting_screen/component/additional_textField.dart';
import 'component/quickSelectChip_component.dart';
import '../app_setting_screen/component/record_inkwell_button.dart';
import 'component/setting_memo_textfield.dart';
import '../app_setting_screen/provider/additional_pay_provider.dart';
import '../calendar_screen/provider/show_range_provider.dart';
import '../statistic_screen/component/data_range_dialog/data_range_input_field.dart';
import '../user_statistics_screen/component/auth_modal_component.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/left_eleveted_button.dart';

class SettingScreen extends HookConsumerWidget {
  const SettingScreen({super.key});

  static const double _step = 0.05;
  static const double _minValue = 0.0;
  static const double _maxValue = 5.0;

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final quickSelectValues = [0.5, 0.75, 1.25, 1.75, 2.25];

    final nestedScrollController = useScrollController();

    final  showRange = ref.watch(showRangeStateProvider);
    final dateRange = useState<List<DateTime>?>(null);
    final contract = ref.watch(viewContractProvider);
    final history = ref.watch(viewHistoryProvider);
    final openBox = ref.watch(additionalPayProvider);

    ref.watch(formzDecimalValidatorProvider);
    ref.formzMemoWatch;
    ref.decimalWatch;

    final memoController = useTextEditingController();
    final decimalController = useTextEditingController();

    final decimalFocus = useFocusNode();
    final rangeFocus = useFocusNode();
    final memoFocus = useFocusNode();
    final additionalFocus = useFocusNode();

    useListenable(memoFocus);

    int initial = 20;

    useEffect(() {
      if (openBox) {
        Future.delayed(const Duration(milliseconds: 200), () {
          additionalFocus.requestFocus();
        });
      }
      return null; // cleanup 불필요
    }, [openBox]);

    if (contract.hasValue && contract.hasValue) {
      final contracts = contract.value!; // List<LabourCondition>
      final histories = history.value!; // List<WorkHistory>
      if (contracts.isNotEmpty && histories.isNotEmpty) {
        initial = (histories.last.record * 20).toInt();

      }
    }

    final currentIndex = useState(initial);
    final customValue = useState<double?>(null); // 직접 입력값 저장
    final customMemo = useState<String?>(null); // 직접 입력값 저장
    final currentValue = customValue.value ?? (currentIndex.value * _step);


    useEffect(() {
      decimalController.text = currentValue.toStringAsFixed(2);
      return null;
    }, []);

    void selectValue(double value) {
      customValue.value = null; // 커스텀 값 초기화
      final newIndex = (value / _step).round();
      currentIndex.value = newIndex;
      decimalController.text = value.toStringAsFixed(2);
    }

    useEffect(() {
      void scrollToBottom() {
        if ((memoFocus.hasFocus || decimalFocus.hasFocus || additionalFocus.hasFocus) && nestedScrollController.hasClients) {
          Future.delayed(const Duration(milliseconds: 100), () {
            if (nestedScrollController.hasClients) {
              nestedScrollController.animateTo(
                nestedScrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
              );
            }
          });
        }
      }
      // 포커스 리스너 추가
      memoFocus.addListener(scrollToBottom);
      decimalFocus.addListener(scrollToBottom);
      additionalFocus.addListener(scrollToBottom);
      // cleanup 함수
      return () {
        memoFocus.removeListener(scrollToBottom);
        decimalFocus.removeListener(scrollToBottom);
        additionalFocus.removeListener(scrollToBottom);
      };
    }, [memoFocus.hasFocus,decimalFocus.hasFocus,additionalFocus.hasFocus]); // memoFocus.hasFocus가 변경될 때마다 실행



    useEffect(() {
      final sub = ref.listenManual(
        formzDecimalValidatorProvider,
            (prev, next) {
          if (next.status == DecimalFormzStatus.submissionSuccess) {
            ref.refreshState(context);
            Navigator.pop(context);
          }
        },
      );
      return sub.close;
    }, []);


    return Scaffold(

      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: context.height > 750 ? 16.0 : 8.0, horizontal: 24.0),
        child: NestedScrollView(
            controller: nestedScrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled){
              return [
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      WorkSiteRegistration(),

                      context.height > 750 ?  SizedBox(height: 20) : SizedBox(height: 10),

                      Row(
                        children: [
                          Flexible(
                            flex: 3,
                            child: RecordButton(
                              width: 300,
                              borderColor: showRange ? Colors.teal.shade600 : Colors.grey.shade400,
                              icon: showRange ? DateRangeInputField(
                                rangeNode: rangeFocus,
                                onDateRangeChanged: (newDateRange) {
                                  dateRange.value = newDateRange;
                                  if (newDateRange != null) {
                                    ref.rangeNot.updateStartDate(dateRange.value![0]);
                                    ref.rangeNot.updateEndDate(dateRange.value![1]);
                                  } else {
                                  }
                                },
                              ) :
                              Container(
                                height: 35,
                                alignment: Alignment.center,
                                child: TextWidget(
                                    '${ref.year}년 ${ref.monthString}월 ${ref.dayString}일 ${ref.weekdayKr}',
                                    15.5, context.width,
                                    color: context.chipTextColor),

                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Flexible(
                            flex: 2,
                            child: RecordButton(
                              backgroundColor: showRange
                                  ? context.rangeChipColor
                                  : context.bTypeChipColor,
                              borderColor: showRange
                                  ? Colors.teal.shade600
                                  : context.isDark ? Colors.teal.shade400 : Colors.grey.shade400,
                              onTap: (){
                                if (!showRange) {
                                  Future.microtask(() => rangeFocus.requestFocus());
                                }
                                ref.read(showRangeStateProvider.notifier).rangeState();
                              },
                              icon: TextWidget(
                                  showRange ? '단일 날짜': '범위 설정', 16,
                                  context.width,
                                  color: context.isDark
                                      ? Colors.tealAccent
                                      : showRange ? Colors.teal.shade700 : Colors.grey.shade900,
                              ),
                              width: 300,
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Column(
                children: [
                  context.height > 750 ?  SizedBox(height: 20) : SizedBox(height: 15),
                  SettingDisplay(
                    currentValue: currentValue,
                  ),
                  ///
                  MemoStateComponent(
                    showRange: showRange,
                    onTap: (){
                      HapticFeedback.selectionClick();
                      Navigator.pop(context);
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        showBasicModal(context);
                      });
                    },
                  ),
                  ///
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 2.5,
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 500),
                          child: additionalFocus.hasFocus
                              ? SizedBox.shrink(key: ValueKey('hidden'))
                              : QuickSelectChipList(
                            key: ValueKey('visible'),
                            values: quickSelectValues,
                            currentValue: currentValue,
                            onValueSelected: selectValue,
                          ),
                        ),
                      ),
                    ],
                  ),


                  SizedBox(height: additionalFocus.hasFocus ? 5 : 20),

                  SettingControllerComponent(
                    decimalController: decimalController,
                    decimalFocus: decimalFocus,
                    currentValue: currentValue,
                    minus: () {
                      customValue.value = null; // 🎯 커스텀 값 초기화
                      if (currentIndex.value > 0) {
                        currentIndex.value--;
                        final newValue = currentIndex.value * _step;
                        decimalController.text = newValue.toStringAsFixed(2);

                      }
                    },
                    plus: () {
                      customValue.value = null; // 🎯 커스텀 값 초기화
                      if (currentValue < _maxValue) {
                        currentIndex.value++;
                        final newValue = currentIndex.value * _step;
                        decimalController.text = newValue.toStringAsFixed(2); //

                      }
                    },
                    onValueChanged: (val){
                      if (val == null) return; // ✅ null이면 조기 종료
                      if (val >= _minValue && val <= _maxValue) {
                        customValue.value = val; // 커스텀 값 저장
                      }
                      },
                  ),
                  decimalFocus.hasFocus ? Column(
                    children: [
                      SizedBox(height: 7.5),
                      Row(
                        children: [
                          TextWidget(' 공수입력 후 설정완료를 꼭 눌러주세요', 11.5, context.width,
                          color: Colors.teal),
                        ],
                      ),
                      SizedBox(height: 15),
                    ],
                  ) : SizedBox(height: 20),

                  // AdditionalPayComponent(
                  //   AdditionalTextField(
                  //     focusNode: additionalFocus,
                  //     controller: additionalController,
                  //     onTap: () => Navigator.pop(context),
                  //   ),
                  // ),

                  SettingMemoTextField(
                    nodeMemo: memoFocus,
                    decimalMemo: decimalFocus,
                    memoController: memoController,
                    onChanged: (val) {
                      customMemo.value = val;
                      ref.formzMemoRead.onChangeMemo(val);
                    },
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: LeftElevatedButton(
                text: '휴일등록',
                onPressed: (){
                  ref.decimalRead.onChangeDecimal(0.0);
                  ref.decimalRead.onSubmit(decimal: 0.0);
                },
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: CustomElevatedButton(
                text: '설정완료',
                onPressed: (){
                  ref.decimalRead.onChangeDecimal(currentValue.toDouble());

                  /// /// /// /// ///
                  if (customMemo.value != null) {
                    ref.formzMemoRead.onSubmit(ref);
                  } else {}

                  if (showRange) {
                    ref.decimalRead.onSubmitMonthAll(
                      dateRange.value![0],dateRange.value![1],
                    );
                  } else {
                    ref.decimalRead.onSubmit(decimal: currentValue.toDouble());
                  }
                },

              ),
            ),

          ],
        ),
      ),
    );
  }
}
