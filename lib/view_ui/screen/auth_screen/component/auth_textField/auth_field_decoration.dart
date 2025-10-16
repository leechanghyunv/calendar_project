import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';

import '../../../../../core/export_package.dart';

class authContainer extends StatelessWidget {
  final Widget child;

  const authContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  height = context.height;
    final  width =  context.width;
    return Container(
      height: height > 750 ? (width > 400 ? 48 : 45) : 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.all(
          color: context.isDark ? Colors.white : Colors.grey.shade800,
          width: 0.85,
        ),
        boxShadow: context.defaultShadow,
      ),
      child: child,
    );
  }
}


InputDecoration customInputDecoration({
  String? hintText,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    errorMaxLines: 1,
    hintText: hintText,
    hintStyle: TextStyle(
      color: Colors.grey.shade600,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    ),
    isDense: true,
    errorBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    suffixIcon: suffixIcon,
  );
}
