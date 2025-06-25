import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/export_package.dart';


class TitleRow extends ConsumerWidget {
  const TitleRow({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final appWidth = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${ref.month}월 ${ref.day}일 등록',
          textScaler: TextScaler.noScaling,
          style: TextStyle(
              fontSize: appWidth > 450 ? 18 : appWidth > 410 ? 16 : 15,
              fontWeight: FontWeight.bold),
        ),
        Spacer(),
        decimalContainer1(appWidth),

      ],
    );
  }
}

Widget  decimalContainer1(double width) => Container(
      height: width > 410 ? 24 : 23,
      width: width > 410 ? 80 : 75,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          '휴무는 0처리',
          textScaler: TextScaler.noScaling,
          style: TextStyle(
              color: Colors.grey.shade900,
              fontSize: width > 410 ? 12 : 11,
              fontWeight: FontWeight.w900),
        ),
      ),
    );




class MomoDecimalBox extends StatelessWidget {
  final Widget decimalTextField;
  final String decimalErrorText;
  final Widget memoTextField;
  final String memoErrorText;

  const MomoDecimalBox(
      {super.key,
        required this.decimalTextField,
        required this.decimalErrorText,
        required this.memoTextField,
        required this.memoErrorText,

      });

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 7),
        TitleRow(),
        SizedBox(height: 15),
        decimalTextField,
        SizedBox(height: 7.5),
        Row(
          children: [
            Text(decimalErrorText,
              textScaler: TextScaler.noScaling,
              style: TextStyle(fontSize: appWidth > 450 ? 11 : 10,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey.shade800),
            ),
          ],
        ),
        SizedBox(height: 20),
        memoTextField,
        SizedBox(height: 7.5),
        Row(
          children: [
            Text(memoErrorText,
              textScaler: TextScaler.noScaling,
              style: TextStyle(fontSize: appWidth > 450 ? 11 : 10,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey.shade800),
            ),
          ],
        ),
        SizedBox(height: 15),


      ],
    );
  }
}
