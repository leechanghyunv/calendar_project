import '../../../../core/export_package.dart';
import '../../dialog_text.dart';

class BackUpTextfield extends StatelessWidget {

  final GlobalKey iconKey;
  final String? hintText;
  final bool? autofocus;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final void Function()? iconOnPressed;
  final TextEditingController? controller;
  final Color? iconColor;

  const BackUpTextfield({
    super.key,
    this.autofocus,
    this.focusNode,
    this.onChanged,
    this.hintText,
    this.iconOnPressed,
    this.iconColor,
    this.controller,
    required this.iconKey});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.blue.shade700,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade700,),
        ),
        hintText: hintText,
        hintStyle: BackupFontStyle(13),
        labelStyle: BackupFontStyle(15,height: 1.5,),
        suffixIcon: IconButton(
          iconSize: 30,
          splashRadius: 25,
          splashColor: Colors.grey.shade500,
          onPressed: iconOnPressed,
          icon:
          Showcase(
            key: iconKey,
            targetPadding: const EdgeInsets.all(5),
            description: '👉 붙여넣은 후에 저장하기를 눌러주세요\n\n      이 방법은 ios,android간 호환가능합니다.',
            descTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: Platform.isAndroid ? 0.5 : 0.0,
            ),
            blurValue: 1.5,
            child: Icon(
              Icons.fingerprint_sharp,
              color: iconColor,size: 25,
            ),
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
