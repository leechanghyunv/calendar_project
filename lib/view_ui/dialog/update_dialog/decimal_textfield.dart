import 'package:calendar_project_240727/core/export_package.dart';

import '../../../core/utils/converter.dart';
import '../dialog_text.dart';

class DecimalTextfield extends StatelessWidget {

  final bool? autofocus;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final void Function()? iconOnPressed;
  final TextEditingController? controller;
  final Color? iconColor;

  const DecimalTextfield({super.key, this.onChanged, this.iconOnPressed, this.iconColor, this.autofocus, this.focusNode, this.controller});

  double adaptiveSize(double size) => Platform.isAndroid ? (size - 1.0) : size;

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    return TextFormField(
      controller: controller,
      autofocus: autofocus ?? false,
      focusNode: focusNode,
      cursorColor: Colors.purple.shade700,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,3}')),
        TwoDigitInputFormatter(),
      ],
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.purple.shade700),
          ),
          hintText: '입력 후 확인 아이콘을 눌러주세요',
          hintStyle: DecimalTextFieldHintStyle(),
          suffixStyle: TextStyle(
            fontSize: adaptiveSize(13.5),
          ),
          suffixIcon: IconWidget(appWidth, iconColor, iconOnPressed),
      ),
      onChanged: onChanged,
    );
  }
}


Widget IconWidget(double appWidth, Color? iconColor, void Function()? iconOnPressed) => IconButton(
  iconSize: appWidth > 370 ? 30 : 25,
  splashRadius: 25,
  splashColor: Colors.grey.shade500,
  onPressed: iconOnPressed,
  icon: Icon(Icons.fingerprint_sharp,
    color: iconColor,
  ),
);