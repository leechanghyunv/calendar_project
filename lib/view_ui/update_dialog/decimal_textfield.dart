import 'package:calendar_project_240727/core/export.dart';
import '../../core/utils/converter.dart';

class DecimalTextfield extends StatelessWidget {

  final bool? autofocus;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final void Function()? iconOnPressed;
  final TextEditingController? controller;
  final Color? iconColor;

  const DecimalTextfield({super.key, this.onChanged, this.iconOnPressed, this.iconColor, this.autofocus, this.focusNode, this.controller});

  double adaptiveSize(double size) => Platform.isAndroid ? (size - 1.0) : size;
  double screenUtilSize(double size) => Platform.isAndroid ? (size - 1.0).sp : size.sp;

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: controller,
      autofocus: autofocus ?? false,
      focusNode: focusNode,
      cursorColor: Colors.purple.shade900,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
        TwoDigitInputFormatter(),
      ],
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.purple.shade900),
          ),
          hintText: '입력 후 확인 아이콘을 눌러주세요',
          hintStyle: TextStyle(
            fontSize: adaptiveSize(13),
            letterSpacing: 0.5,
          ),
          suffixStyle: TextStyle(
            fontSize: adaptiveSize(13.5),
          ),
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,letterSpacing: 0.5,height: 1.5,
              fontSize: adaptiveSize(15)),
          suffixIcon: IconButton(
            iconSize: 30,
            splashRadius: 25,
            splashColor: Colors.grey.shade500,
            onPressed: iconOnPressed,
            icon: Icon(Icons.fingerprint_sharp,
              color: iconColor,
            ),
          )
      ),
      onChanged: onChanged,
    );
  }
}

