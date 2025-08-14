import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/view_ui/screen/calendar_screen/provider/show_range_provider.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/component/function_chip.dart';
import 'package:intl/intl.dart';
import '../../../core/export_package.dart';
import '../../../model/formz_decimal_model.dart';
import '../../../repository/formz/formz_decimal.dart';
import '../../../view_model/sqlite_model/contract_model.dart';
import '../../../view_model/sqlite_model/history_model.dart';
import '../../screen/calendar_screen/provider/show_memo_provider.dart';
import '../../screen/statistic_screen/component/data_range_dialog/data_range_input_field.dart';
import 'component/memo_component.dart';
import 'component/number_picker_record_component.dart';
import 'component/quickSelectChip_component.dart';

class NumberPickerModalSheet extends HookConsumerWidget {
  const NumberPickerModalSheet({super.key});

  static const double _step = 0.05;
  static const double _minValue = 0.0;
  static const double _maxValue = 5.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final contract = ref.watch(viewContractProvider);
    final history = ref.watch(viewHistoryProvider);
    final  showRange = ref.watch(showRangeStateProvider);

    final dateRange = useState<List<DateTime>?>(null);

    final memoController = useTextEditingController();
    final memoFocus = useFocusNode();
    final rangeFocus = useFocusNode();
    int initial = 20;

    if (contract.hasValue && contract.hasValue) {
      final contracts = contract.value!; // List<LabourCondition>
      final histories = history.value!; // List<WorkHistory>
      if (contracts.isNotEmpty && histories.isNotEmpty) {
        initial = (histories.last.record * 20).toInt();

      }
    }

    final appWidth = MediaQuery.of(context).size.width;

    final currentIndex = useState(initial);

    final currentValue = currentIndex.value * _step;

    final currentContract = (contract.hasValue && contract.value!.isNotEmpty)
        ? contract.value!.last
        : null;

    final calculatedPay = currentContract != null
        ? (currentContract.normal * currentValue).toInt()
        : 0;

    final formattedPay = NumberFormat('#,###').format(calculatedPay);

    final previousValue = usePrevious(currentValue) ?? currentValue;

    final quickSelectValues = [0.5, 0.75, 1.25, 1.75, 2.25];

    final formzMemoRefNot = ref.formzMemoWatch;
    final formzMemoRefread = ref.formzMemoRead;
    ref.watch(formzDecimalValidatorProvider);
    final formzRefNot = ref.decimalWatch;
    final formzRefread = ref.decimalRead;

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    showRange ? DateRangeInputField(
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
                    TextWidget(
                        '${ref.monthString}월 ${ref.dayString}일 공수등록',
                        17.5, appWidth),

                    Spacer(),
                    FunctionChip(label: showRange ? '@돌아가기': '@등록범위설정',
                        color: Colors.grey.shade200,
                        borderColor: Colors.grey.shade600,
                        textColor: Colors.grey.shade900,
                        onTap: (){
                          if (!showRange) {
                            Future.microtask(() => rangeFocus.requestFocus());
                          }
                          ref.read(showRangeStateProvider.notifier).rangeState();
                    }),
                  ],
                ),
              ),
              showRange ? SizedBox(height: 13) : SizedBox(height: 15),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      recordPickerAnimatedWidget(
                        previousValue: previousValue,
                        currentValue: currentValue,
                        formattedPay: formattedPay,
                        currentIndex: currentIndex.value,
                        onDecrement: decrement,
                        onIncrement: increment,
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: [
                          Flexible(
                            child: Container(
                              height: 45, // 칩 높이에 맞춰 조정
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                // color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),

                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                                child: ListView.builder(
                                  // shrinkWrap: true,
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
                      MemoComponent(
                        memoFocus,
                        memoController,
                        formzMemoRefread.onChangeMemo,
                          (_){
                            ref.read(showMemoStateProvider.notifier).memoState(false);
                            formzMemoRefread.onSubmit(ref);
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Row(
          children: [

            TextButton(onPressed: (){
              formzRefread.onChangeDecimal(0.0);
              formzRefread.onSubmit(decimal: 0.0);
            },
                child: TextWidget('휴일등록', 16.5, appWidth)),

            Spacer(),

            TextButton(onPressed: (){
              formzRefread.onChangeDecimal(currentValue.toDouble());
              if (showRange) {
                formzRefread.onSubmitMonthAll(
                  dateRange.value![0],dateRange.value![1],
                );
              } else {
                formzRefread.onSubmit(decimal: currentValue.toDouble());
              }
            },
              child: TextWidget('공수등록', 16.5, appWidth,
                color: showRange ? Colors.blue.shade800 : Colors.black,
              ),
            ),
          ],
        )
      ),
    );
  }
}