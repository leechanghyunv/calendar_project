import 'package:calendar_project_240727/core/export.dart';

class MoneyinputTextfield extends StatelessWidget {
  final bool? autofocus;
  final FocusNode? focusNode;
  final String? hintMsg;
  final String? labelMsg;
  final String? initialValue;
  final double edgeValue;
  final void Function(String)? onChanged;
  final TextInputAction textInputAction;

  final TextEditingController? controller;

  const MoneyinputTextfield(
      {super.key,
        this.autofocus,
        this.hintMsg,
        this.labelMsg,
        this.initialValue,
        required this.edgeValue,
        this.onChanged,
        required this.textInputAction,
        this.focusNode,
        this.controller});

  @override
  Widget build(BuildContext context) {

    final appWidth = MediaQuery.of(context).size.width;

    double screenUtilSize(double size) => Platform.isAndroid ? (size - 1.0).sp : size.sp;
    double adaptiveSize(double size) => Platform.isAndroid ? (size - 1.0) : size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: edgeValue),
      child: SizedBox(
        height: appWidth > 500 ? 23.75.sp : 47.5.sp,

        child: TextFormField(
          controller: controller,
          textInputAction: textInputAction,
          autofocus: autofocus ?? false,
          focusNode: focusNode,
          onChanged: onChanged,
          keyboardType: TextInputType.number,
          initialValue: initialValue,
          inputFormatters: [
            ThousandsFormatter(),
          ],
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            prefixText: '₩ ',
            prefixStyle: TextStyle(
              fontSize: appWidth > 500 ? screenUtilSize(7.5) : screenUtilSize(15),
            ),
            // suffixText: '원',
            hintText: hintMsg,
            hintStyle: TextStyle(
              fontSize:  appWidth > 500 ? screenUtilSize(7.5) : screenUtilSize(15),
              color: Colors.grey[600],
            ),
            labelText: labelMsg, /// '🌟 1공수(정상근무) *', 🚀 1.5공수(연장근무) * 🎉 2공수(야간근무) *
            labelStyle: TextStyle(
              fontSize:  appWidth > 500 ? screenUtilSize(7.5) : screenUtilSize(15),
              color: Colors.grey[900],
            ),
          ),
        ),

      ),
    );
  }
}
