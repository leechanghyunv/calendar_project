

import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/view_ui/main_screen_component/main_box_component/setting_component/quickSelectChip_component.dart';
import 'package:calendar_project_240727/view_ui/main_screen_component/main_box_component/setting_component/record_inkwell_button.dart';

import '../../../../core/export_package.dart';
import '../../../../core/widget/text_widget.dart';
import '../../../screen/calendar_screen/provider/show_range_provider.dart';
import '../../../screen/statistic_screen/component/data_range_dialog/data_range_input_field.dart';

class SettingScreen extends HookConsumerWidget {
  const SettingScreen({super.key});

  static const double _step = 0.05;
  static const double _minValue = 0.0;
  static const double _maxValue = 5.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final  showRange = ref.watch(showRangeStateProvider);
    final dateRange = useState<List<DateTime>?>(null);

    final memoController = useTextEditingController();
    final decimalController = useTextEditingController();
    final decimalFocus = useFocusNode();
    final rangeFocus = useFocusNode();
    final memoFocus = useFocusNode();

    int initial = 20;

    final currentIndex = useState(initial);
    final currentValue = currentIndex.value * _step;

    void selectValue(double value) {
      final newIndex = (value / _step).round();
      currentIndex.value = newIndex;
    }

    final quickSelectValues = [0.5, 0.75, 1.25, 1.75, 2.25];

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
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 16.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget(
                    showRange ? '공수 범위 등록' : '${ref.monthString}월 ${ref.dayString}일 등록',
                    20, context.width),
                Spacer(),
                CircleAvatar(
                    radius: 17.5,
                    backgroundColor: Colors.grey.shade200,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        size: 17.5,
                        Icons.close_outlined,
                        color: Colors.grey.shade800,
                      ),
                    ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: RecordButton(
                    width: 300,
                    icon: showRange ? DateRangeInputField(
                      rangeNode: rangeFocus,
                      onDateRangeChanged: (newDateRange) {
                      },
                    ) :
                    Container(
                      height: 35,
                      alignment: Alignment.center,
                      child: TextWidget(
                          '${ref.year}년 ${ref.monthString}월 ${ref.dayString}일 화요일',
                          15.5, context.width),

                    ),
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  flex: 2,
                  child: RecordButton(
                    backgroundColor: showRange ? Colors.teal.shade600 : Colors.grey.shade100,
                    borderColor: showRange ? Colors.teal.shade600 : Colors.grey.shade400,
                    onTap: (){
                      if (!showRange) {
                        // Future.microtask(() => rangeFocus.requestFocus());
                      }
                      ref.read(showRangeStateProvider.notifier).rangeState();
                    },
                    icon: TextWidget(showRange ? '단일 날짜': '범위 설정', 16,
                        context.width,color: showRange ? Colors.grey.shade100 : Colors.grey.shade800),
                    width: 300,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            AnimatedContainer(
              height: 100,
              alignment: Alignment.center,
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF10B981), // #10b981
                    Colors.teal, // #059669
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 2.5),
                        Text(
                          '설정 공수',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 2.5),
                        Text(
                          '1.25',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: 2.5),
                        Text(
                          '예상 일당',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 2.5),
                        Text(
                          '15.2만원',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 5),
                TextWidget('빠른선택', 16, context.width),
                Spacer(),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 120,
                  height: 30,
                  child: TextWidget('${ref.monthString}월 메모 보기', 14, context.width,
                  color: Colors.grey.shade600),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Flexible(
                  child: Container(
                    height: context.height > 900 ? 35 : 35, // 칩 높이에 맞춰 조정
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: quickSelectValues.length,
                        itemBuilder: (context, index) {
                          final value = quickSelectValues[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              // top: 9.5,
                              right: index < quickSelectValues.length - 1 ? 8.0 : 0,
                              // bottom: 9.5,
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
            SizedBox(height: 20),
            Container(
              height: 75,
              decoration: infoBoxDeco,
            ),
            SizedBox(height: 20),
            Container(
              height: 75,
              decoration: infoBoxDeco,
              child: TextFormField(
                focusNode: memoFocus,
                controller: memoController,
                onChanged: (val){},
                onFieldSubmitted: (val){},
                maxLines: null, // 자동으로 여러 줄 입력 가능
                cursorColor: Colors.grey.shade500,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 6.0,
                  ),
                  hintText: ' 메모내용을 입력해주세요',
                  hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      overflow: TextOverflow.ellipsis),
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),


          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
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
                  // ref.decimalRead.onChangeDecimal(0.0);
                  // ref.decimalRead.onSubmit(decimal: 0.0);
                },
                child: TextWidget('휴일등록', 15, context.width, color: Colors.black),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.5),
                    ),
                    elevation: 1,
                  ),
                  onPressed: ()  {
                    // ref.decimalRead.onChangeDecimal(currentValue.toDouble());
                    // if (showRange) {
                    //   ref.decimalRead.onSubmitMonthAll(
                    //     dateRange.value![0],dateRange.value![1],
                    //   );
                    // } else {
                    //   ref.decimalRead.onSubmit(decimal: currentValue.toDouble());
                    // }
                  },
                  child: TextWidget('설정완료', 16, context.width,color: Colors.white)),
            ),

          ],
        ),
      ),
    );
  }
}
