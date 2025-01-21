import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/export_package.dart';

class MemoDecimalTitle extends ConsumerWidget {
  const MemoDecimalTitle({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final appWidth = MediaQuery.of(context).size.width;


    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('근무유형,메모 등록',
              style: TextStyle(
                  fontSize: appWidth > 410 ? 15 : 14,
                  fontWeight: FontWeight.bold)),
          Spacer(),
          Container(
            height: appWidth > 410 ? 24 : 22.5,
            width: appWidth > 410 ? 115 : 110,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade700),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.5),
              child: Text(
                '${ref.year}년${ref.monthString}월${ref.dayString}일',
                style: TextStyle(
                    fontSize: appWidth > 410 ? 13 : 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleRow extends StatelessWidget {
  const TitleRow({super.key});

  @override
  Widget build(BuildContext context) {

    final appWidth = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '공수등록',
          style: TextStyle(
              fontSize: appWidth > 410 ? 15 : 14,
              fontWeight: FontWeight.bold),
        ),
        Spacer(),
        decimalContainer1(appWidth),
        SizedBox(width: 5),
        decimalContainer2(appWidth),
      ],
    );
  }
}

Widget  decimalContainer1(double width) => Container(
      height: width > 410 ? 22 : 21,
      width: width > 410 ? 60 : 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade700),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4),
        child: Text(
          '🚀소수점',
          style: TextStyle(
              color: Colors.grey.shade900,
              fontSize: width > 410 ? 10.5 : 9,
              fontWeight: FontWeight.w900),
        ),
      ),
    );

Widget decimalContainer2(double width) => Container(
  height: width > 410 ? 22 : 21,
  width: width > 410 ? 60 : 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade700),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4),
        child: Text(
          '휴무는 0.0',
          style: TextStyle(
              fontSize: width > 420 ? 10 : 9,
              fontWeight: FontWeight.w900),
        ),
      ),
    );



class MomoDecimalBox extends StatelessWidget {
  final Widget memoTextfield;
  final String memoErrorText;
  final Widget decimalTextfield;
  final String decimalErrorText;

  const MomoDecimalBox(
      {super.key,
        required this.memoTextfield,
        required this.memoErrorText,
        required this.decimalTextfield,

        required this.decimalErrorText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        SizedBox(height: 10),
        memoTextfield,

        SizedBox(height: 7.5),
        Row(
          children: [
            Text(memoErrorText,
              style: TextStyle(fontSize: 10.5,fontWeight: FontWeight.w900,color: Colors.grey.shade700),
            ),
          ],
        ),
        SizedBox(height: 17.5),
        Divider(
          color: Colors.grey.shade400,
          thickness: 1.0,
        ),
        SizedBox(height: 17.5),
        TitleRow(),
        SizedBox(height: 12.5),
        decimalTextfield,
        SizedBox(height: 7.5),
        Row(
          children: [
            Text(decimalErrorText,
              style: TextStyle(fontSize: 10,fontWeight: FontWeight.w900,color: Colors.grey.shade700),
            ),
          ],
        ),
      ],
    );
  }
}
