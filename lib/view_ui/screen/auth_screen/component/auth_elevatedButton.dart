
import '../../../../core/export_package.dart';
import '../../../../core/widget/text_widget.dart';

class AuthButton extends StatelessWidget {

  final VoidCallback? onPressedReset;
  final VoidCallback? onPressed;
  final String? text;

  const AuthButton({super.key, this.onPressedReset,this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return  Row(
      children: [
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: onPressedReset,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade100,
              padding:  EdgeInsets.symmetric(horizontal: 12,
                  vertical: height > 750 ? 12 : 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.5),
              ),
              elevation: 2,
            ),
            child: TextWidget(text ?? '초기화',
                15,width,color: Colors.grey.shade900

            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 3,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF059669),
              padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: height > 750 ? 12 : 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.5),
              ),
              elevation: 2,
            ),
            child: TextWidget(text ?? '모두 입력했습니다!',
                15,width,color: Colors.grey.shade100

            ),
          ),
        ),
      ],
    );
  }
}
