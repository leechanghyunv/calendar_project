import '../../../../core/export_package.dart';
import '../../../../core/widget/text_widget.dart';

class recordPickerAnimatedWidget extends StatelessWidget {
  final double previousValue;
  final double currentValue;
  final String formattedPay;
  final int currentIndex;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const recordPickerAnimatedWidget(
      {super.key,
        required this.previousValue,
        required this.currentValue,
        required this.formattedPay,
        required this.currentIndex,
        required this.onDecrement,
        required this.onIncrement,});

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;

    return Container(

        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TweenAnimationBuilder<double>(
                            key: ValueKey(currentIndex),
                            tween: Tween(begin: previousValue, end: currentValue),
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOutCubic,
                            builder: (context, animatedValue, child) {
                              return TextWidget(
                                  animatedValue.toStringAsFixed(2), 60, appWidth);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextWidget('공수', 20, appWidth),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          // color: Colors.grey.shade50,
                        ),
                        width: 175,
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                          child: Row(
                            children: [
                              TextWidget(
                                  '일당은 ${formattedPay}원 입니다.', 13.5, appWidth),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        Positioned(
          right: 10,
          bottom: 35,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // border: Border.all(width: 1.75, color: Colors.grey.shade700),
            ),

            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                children: [

                  IconButton(
                    onPressed: onDecrement,
                    icon: Icon(
                      Icons.remove,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: onIncrement,
                    icon: Icon(
                      Icons.add,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 5),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
