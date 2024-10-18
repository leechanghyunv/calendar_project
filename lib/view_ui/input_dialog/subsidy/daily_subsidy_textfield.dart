
import 'package:calendar_project_240727/core/export.dart';


class DailySubsidyTextfield extends StatelessWidget {

  final Function(String)? onChanged;
  final void Function()? iconOnPressed;
  final GlobalKey iconKey;
  final TextEditingController? controller;
  final Color? cursorColor;
  final Color borderColor;
  final Color? iconColor;

  const DailySubsidyTextfield({
    super.key,
    this.onChanged,
    this.iconOnPressed,
    this.iconColor,
    this.cursorColor,
    required this.borderColor,
    required this.iconKey,
    this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: cursorColor,
      keyboardType: TextInputType.number,
      inputFormatters: [
        ThousandsFormatter(),
      ],
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: borderColor,
          ),
        ),
        hintText: '입력 후 우측 아이콘을 눌러주세요',
        hintStyle: const TextStyle(
          fontSize: 13,letterSpacing: 0.25,
        ),
        // prefixText: '₩ ',
        suffixStyle: const TextStyle(
          fontSize: 13.5,
        ),
        labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,letterSpacing: 0.5,height: 1.5,
            fontSize: 15),
        suffixIcon: IconButton(
          iconSize: 30,
          splashRadius: 25,
          splashColor: Colors.grey.shade500,
          onPressed: iconOnPressed,
          icon: Showcase(
            key: iconKey,
            targetPadding: const EdgeInsets.all(5),
            description: '👉 일비가 없으시면 바로 아이콘만 눌러주세요',
            descTextStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            blurValue: 1.5,
            child: Icon(Icons.fingerprint_sharp,
              color: iconColor,
            ),
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
