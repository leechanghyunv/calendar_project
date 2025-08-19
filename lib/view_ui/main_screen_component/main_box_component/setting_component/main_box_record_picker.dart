import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/view_ui/main_screen_component/main_box_component/setting_component/record_inkwell_button.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/component/function_chip.dart';
import '../../../../core/export_package.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../../model/formz_decimal_model.dart';
import '../../../../repository/formz/formz_decimal.dart';
import '../../../../view_model/sqlite_model/contract_model.dart';
import '../../../../view_model/sqlite_model/history_model.dart';
import '../../../dialog/basic_setting_dialog/displayNumber_textfield.dart';
import '../../../screen/calendar_screen/provider/show_memo_provider.dart';
import '../../../screen/calendar_screen/provider/show_range_provider.dart';
import '../../../screen/statistic_screen/component/data_range_dialog/data_range_input_field.dart';
import '../component/memo_component.dart';
import '../component/quickSelectChip_component.dart';

class RecordPickerModalSheet extends HookConsumerWidget {
  const RecordPickerModalSheet({super.key});

  static const double _step = 0.05;
  static const double _minValue = 0.0;
  static const double _maxValue = 5.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final contract = ref.watch(viewContractProvider);
    final history = ref.watch(viewHistoryProvider);
    final  showRange = ref.watch(showRangeStateProvider);
    final dateRange = useState<List<DateTime>?>(null);

    int initial = 20;
    final quickSelectValues = [0.5, 0.75, 1.25, 1.75, 2.25,2.75];

    if (contract.hasValue && contract.hasValue) {
      final contracts = contract.value!; // List<LabourCondition>
      final histories = history.value!; // List<WorkHistory>
      if (contracts.isNotEmpty && histories.isNotEmpty) {
        initial = (histories.last.record * 20).toInt();

      }
    }

    final appWidth = context.width;
    final appHeight = context.height;

    final currentIndex = useState(initial);
    final currentValue = currentIndex.value * _step;

    final currentContract = (contract.hasValue && contract.value!.isNotEmpty)
        ? contract.value!.last
        : null;

    final calculatedPay = currentContract != null
        ? (currentContract.normal * currentValue).toInt()
        : 0;

    final formattedPay = '${(calculatedPay/10000).toStringAsFixed(1)}만원';

    final memoController = useTextEditingController();
    final decimalController = useTextEditingController();
    final decimalFocus = useFocusNode();
    final rangeFocus = useFocusNode();
    final memoFocus = useFocusNode();


    ref.watch(formzDecimalValidatorProvider);
    ref.formzMemoWatch;
    ref.decimalWatch;

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

    void increment() {
      if (currentValue < _maxValue) {
        currentIndex.value++;
      }
    }

    void decrement() {
      if (currentValue > _minValue) {
        currentIndex.value--;
      }
    }

    void selectValue(double value) {
      final newIndex = (value / _step).round();
      currentIndex.value = newIndex;
    }

    Decoration infoBoxDeco = BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: Colors.grey.shade900,
        width: 0.55,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 4,
          offset: const Offset(0, 4),
        ),
      ],
    );


    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 12.0, horizontal: 18.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(
                        '${ref.monthString}월 ${ref.dayString}일 공수등록',
                        16.5, appWidth),
                    Spacer(),
                    FunctionChip(
                        label: '@나가기',
                        color: Colors.grey.shade200,
                        borderColor: Colors.grey.shade700,
                        textColor: Colors.grey.shade900,
                        onTap: (){
                          Navigator.pop(context);
                        }),
                    
        
                  ],
                ),
                SizedBox(height: 20),
                appHeight > 750 ?  Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            height: context.height > 900 ? 50 : 45, // 칩 높이에 맞춰 조정
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2.0),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: quickSelectValues.length,
                                itemBuilder: (context, index) {
                                  final value = quickSelectValues[index];
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      top: 9.5,
                                      right: index < quickSelectValues.length - 1 ? 10 : 0,
                                      bottom: 9.5,
                                    ),
                                    child: QuickSelectChip(
                                      value: value,
                                      currentValue: currentValue,
                                      onTap: () => selectValue(value),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ) : SizedBox.shrink(),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 3,
                            child: Container(
                              height: context.height > 900 ? 40 : 35,
                              decoration: infoBoxDeco,
                              alignment: Alignment.center,
                              child: DisplayNumberTextField(
                                controller: decimalController,
                                focusNode: decimalFocus,
                                hintText: ' ${currentValue.toStringAsFixed(2)} 공수 / $formattedPay',
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Flexible(
                            flex: 2,
                            child: Container(
                              height: context.height > 900 ? 40 : 35,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RecordButton(
                                    onTap: () => decrement(),
                                    icon: Icon(Icons.remove),
                                  ),
                                  RecordButton(
                                    onTap: (){
                                      decimalFocus.requestFocus();
                                      customMsg('공수를 직접 입력합니다');
                                    },
                                    icon: Icon(Icons.abc),
                                  ),
                                  RecordButton(
                                    onTap: () => increment(),
                                    icon: Icon(Icons.add),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Flexible(
                            flex: 3,
                            child: RecordButton(
                              width: 300,
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
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Flexible(
                            flex: 2,
                            child: RecordButton(
                              onTap: (){
                                if (!showRange) {
                                  Future.microtask(() => rangeFocus.requestFocus());
                                }
                                ref.read(showRangeStateProvider.notifier).rangeState();
                              },
                              icon: TextWidget(showRange ? '돌아가기': '날짜범위설정', 14,
                                  appWidth,color: Colors.grey.shade700),
                              width: 300,
                            ),
                          ),
                        ],
                      ),
                      context.height > 900 ? SizedBox(height: 25) : SizedBox(height: 15),
                      MemoComponent(
                        memoFocus,
                        memoController,
                        ref.formzMemoRead.onChangeMemo,
                            (_){
                          ref.read(showMemoStateProvider.notifier).memoState(false);
                          ref.formzMemoRead.onSubmit(ref);
                        },
                      ),
                      /// /// /// /// /// /// /// ///
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade100,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.5),
                  ),
                  elevation: 2,
                ),
                onPressed: (){
                  ref.decimalRead.onChangeDecimal(0.0);
                  ref.decimalRead.onSubmit(decimal: 0.0);
                },
                child: TextWidget('휴일등록', 15, appWidth, color: Colors.black),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade700,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.5),
                    ),
                    elevation: 1,
                  ),
                  onPressed: ()  {
                    ref.decimalRead.onChangeDecimal(currentValue.toDouble());
                    if (showRange) {
                      ref.decimalRead.onSubmitMonthAll(
                        dateRange.value![0],dateRange.value![1],
                      );
                    } else {
                      ref.decimalRead.onSubmit(decimal: currentValue.toDouble());
                    }
                  },
                  child: TextWidget('설정완료', 16, appWidth,color: Colors.white)),
            ),

          ],
        ),
      ),
    );
  }
}
