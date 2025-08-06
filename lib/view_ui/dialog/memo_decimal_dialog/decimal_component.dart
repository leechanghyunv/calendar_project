import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';

import '../../../theme_color.dart';


class TitleRow extends ConsumerWidget {
  const TitleRow({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final appWidth = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextWidget('${ref.month}월 ${ref.day}일 등록', 15, appWidth),
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
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          '휴무는 0처리',
          textScaler: TextScaler.noScaling,
          style: TextStyle(
              height: textHeight,
              color: Colors.grey.shade900,
              fontSize: width > 410 ? 12 : 11,
              fontWeight: Platform.isAndroid  ? FontWeight.w600 : FontWeight.w900),
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
        ErrorText(decimalErrorText, appWidth),
        SizedBox(height: 20),
        memoTextField,
        SizedBox(height: 7.5),
        ErrorText(memoErrorText, appWidth),
        SizedBox(height: 15),
      ],
    );
  }
}
