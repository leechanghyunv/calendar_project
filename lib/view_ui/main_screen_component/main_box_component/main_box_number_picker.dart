import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/component/function_chip.dart';
import '../../../core/export_package.dart';

class NumberPickerModalSheet extends HookConsumerWidget {
  const NumberPickerModalSheet({super.key});

  static const double _step = 0.05;
  static const double _minValue = 0.0;
  static const double _maxValue = 5.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appWidth = MediaQuery.of(context).size.width;
    final currentIndex = useState(10);
    final currentValue = currentIndex.value * _step;

    final quickSelectValues = [0.5, 0.75, 1.25, 1.75, 2.25];

    final formattedValue = currentValue.toStringAsFixed(2); // "1.000"

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

    Widget quickSelectChip(double value) {
      final isSelected = currentValue == value;
      return GestureDetector(
        onTap: () => selectValue(value),
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.green.shade800 : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 0.5,
                  color: isSelected ? Colors.green.shade800 : Colors.grey.shade900),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 5,
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            height: 25,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 10.0),
              child: Text(value.toStringAsFixed(2),
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: value == 0.0 ? 12.5 : null,
                  color: isSelected ? Colors.white : Colors.black87,
                ),),
            ),
          ),
      );
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    TextWidget('08월 08일 공수등록', 16.5, appWidth),
                    Spacer(),
                    FunctionChip(label: '기본공수설정',
                        color: Colors.grey.shade200,
                        borderColor: Colors.grey.shade600,
                        textColor: Colors.grey.shade900,
                        onTap: (){

                        }),
                    SizedBox(width: 10),
                    FunctionChip(label: '나가기',
                        color: Colors.grey.shade200,
                        borderColor: Colors.grey.shade600,
                        textColor: Colors.grey.shade900,
                        onTap: (){

                        }),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    TextWidget(formattedValue, 55, appWidth),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextWidget('공수', 20, appWidth),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                  ),
                                  width: 175,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 4.0,vertical: 1.0),
                                    child: TextWidget('일당은 150,000원 입니다.', 13.5, appWidth),
                                  ),
                                ),
                              ],
                            ),
                          ),


                          Spacer(),
                          IconButton(onPressed: () => decrement(),
                            icon: Icon(Icons.remove,size: 40,
                            color: Colors.grey.shade700,
                          ),
                          ),
                          SizedBox(width: 5),
                          IconButton(onPressed: () => increment(),
                            icon: Icon(Icons.add,size: 40,
                              color: Colors.grey.shade700,
                          ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Flexible(
                            flex: 10,
                            child: Container(
                              height: 45, // 칩 높이에 맞춰 조정
                              alignment: Alignment.center,
                              // color: Colors.grey.shade200,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: quickSelectValues.length,
                                itemBuilder: (context, index) {
                                  final value = quickSelectValues[index];
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      top: 10,
                                      right: index < quickSelectValues.length - 1 ? 10 : 0,
                                      bottom: 10,
                                    ),
                                    child: quickSelectChip(value),
                                  );
                                },
                              ),
                            ),
                          ),

                        ],
                      ),

                      SizedBox(height: 20),

                      Row(
                        children: [
                          TextWidget('08월 메모기록(0)', 14, appWidth),
                          Spacer(),
                          TextWidget('+ 메모추가', 14, appWidth),
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 0.8,
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 190,
                        decoration: infoBoxDeco,
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
            Spacer(),
            TextButton(onPressed: (){

            }, child: TextWidget('휴일등록', 15, appWidth)),
            SizedBox(width: 10),
            TextButton(onPressed: (){

            }, child: TextWidget('공수등록', 15, appWidth)),
          ],
        )
      ),
    );
  }
}