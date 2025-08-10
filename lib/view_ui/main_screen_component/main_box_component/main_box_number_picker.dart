import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/component/function_chip.dart';
import '../../../core/export_package.dart';
import '../../screen/range_history_screen/component/buttom_chip_list.dart';

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

    final formattedValue = currentValue.toStringAsFixed(3); // "1.000"
    final parts = formattedValue.split('.');
    final integerPart = parts[0]; // "1"
    final decimalPart = parts[1]; // "000"

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
              color: isSelected ? Colors.grey.shade800 : Colors.grey.shade50,
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 25,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 10.0),
              child: Text(value.toStringAsFixed(2),
                style: TextStyle(
                  fontWeight: FontWeight.w800,
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
                    TextWidget('08월 08일 등록', 16.5, appWidth),
                    Spacer(),
                    FunctionChip(label: '기본공수설정',
                        color: Colors.grey.shade200,
                        borderColor: Colors.grey.shade600,
                        textColor: Colors.grey.shade900,
                        onTap: (){
                          increment();
                        }),
                    SizedBox(width: 10),
                    FunctionChip(label: '나가기',
                        color: Colors.grey.shade200,
                        borderColor: Colors.grey.shade600,
                        textColor: Colors.grey.shade900,
                        onTap: (){
                          increment();
                        }),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Divider(
                  color: Colors.grey.shade600,

                ),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Spacer(),
                                  /// currentValue의 앞자리 소수점 1자리까지
                                  Text('$integerPart.${decimalPart[0]}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 55,
                                    ),
                                  ),
                                  /// currentValue의 뒷자리 소수점 3자리까지
                                  Text(decimalPart.substring(1),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 3.5,
                                      fontSize: 55,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0,
                                        vertical: 16.0),
                                    child: Row(
                                      children: [
                                        FunctionChip(label: '이전',
                                            color: Colors.grey.shade200,
                                            borderColor: Colors.grey.shade600,
                                            textColor: Colors.grey.shade900,
                                            onTap: (){}),
                                        SizedBox(width: 10),
                                        FunctionChip(label: ' 휴일 ',
                                            color: Colors.grey.shade200,
                                            borderColor: Colors.grey.shade600,
                                            textColor: Colors.grey.shade900,
                                            onTap: (){}),
                                        Spacer(),
                                        FunctionChip(label: '  -  ',
                                            color: Colors.grey.shade200,
                                            borderColor: Colors.grey.shade600,
                                            textColor: Colors.grey.shade900,
                                            onTap: (){
                                              decrement();
                                            }),
                                        SizedBox(width: 10),
                                        FunctionChip(label: '  +  ',
                                            color: Colors.grey.shade200,
                                            borderColor: Colors.grey.shade600,
                                            textColor: Colors.grey.shade900,
                                            onTap: (){
                                              increment();
                                            }),
                                      ],
                                    ),
                                  ),
                                ),
                            ),
                          ],
                        )
                      ),
                      SizedBox(height: 5),
                      Divider(
                        color: Colors.grey.shade600,
                      ),
                      SizedBox(height: 5),
                      Wrap(
                        spacing: 8,
                        children: [
                          quickSelectChip(0.5),
                          quickSelectChip(1.0),
                          quickSelectChip(1.5),
                          quickSelectChip(2.5),
                          quickSelectChip(3.0),


                        ],
                      ),
                      SizedBox(height: 5),
                      Divider(
                        color: Colors.grey.shade600,
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 150,
                              decoration: infoBoxDeco,
                            ),
                          ),
                          SizedBox(width: 20),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 150,
                              decoration: infoBoxDeco,
                            ),
                          ),
                        ],
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
            TextButton(onPressed: (){}, child: TextWidget('취소', 15, appWidth)),
            TextButton(onPressed: (){}, child: TextWidget('등록하기', 15, appWidth)),
          ],
        )
      ),
    );
  }
}