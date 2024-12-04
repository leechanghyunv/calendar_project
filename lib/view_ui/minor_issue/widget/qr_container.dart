
import 'package:calendar_project_240727/core/export_package.dart';

import 'package:intl/intl.dart';

import '../../../core/widget/text_widget.dart';

class QrContainer extends StatelessWidget {

  final String msg;
  final Color textColor;

  const QrContainer({super.key, required this.msg, required this.textColor});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double screenUtilSize(double size) => Platform.isAndroid ? (size - 1.0).sp : size.sp;
    double adaptiveSize(double size) => Platform.isAndroid ? (size - 1.0) : size;

    double sizeMethod(){
      return switch (height) {
        > 900 => 18,
        > 800 => 17,
        > 700 => width < 370 ? 15.5 : 16,
        _ => 16,
      };
    }

    double letterSpacing(){
      return switch (height) {
        > 900 => 2.0,
        > 800 => Platform.isAndroid ? 1.25 : 1.50,
        > 700 => 1.0,
        _ => 1.50,
      };
    }

    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: width > 500 ? 40.sp : 80.sp,
            width: width > 500 ? 40.sp : 80.sp,
            child: QrImageView(
                data: 'https://apps.apple.com/kr/app/%EC%9B%8C%ED%81%AC%EC%BA%98%EB%A6%B0%EB%8D%94-%EA%B3%B5%EC%88%98%EB%8B%AC%EB%A0%A5/id6596813027'),
          ),
          SizedBox(width: width > 500 ? 7.5.w : 15.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat('y년 M월 dd일').
              format(DateTime.now()),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                    fontSize: width > 500 ? screenUtilSize(8.25) : screenUtilSize(16.5),
                  letterSpacing: Platform.isAndroid? 1.8 : 1.5,
                ),
              ),

              TimerBuilder.periodic(
                const Duration(seconds: 1),
                builder: (context) {
                  return Text(
                      formatDate(DateTime.now(),
                          [am,' ', hh, '시 ', nn, '분 ', ss, '초']),
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                      letterSpacing: Platform.isAndroid? 1.0 : 0.75,
                    fontSize: width > 500 ? screenUtilSize(8.25) : screenUtilSize(16.5),
                    // letterSpacing: 0.5,
                  ),
                  );
                },
              ),

              FittedBox(
                  child: Container(
                  child: Text(
                      msg,style: TextStyle(
                      fontWeight: Platform.isAndroid ? FontWeight.w600 : FontWeight.w900,
                      fontSize: adaptiveSize(
                        width > 500 ? 17 : sizeMethod(),
                      ),
                      color: Colors.black,
                      letterSpacing: letterSpacing()),
                  ),
                  ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
