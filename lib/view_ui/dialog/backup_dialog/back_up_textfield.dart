import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';

import '../../../core/export_package.dart';
import '../dialog_text.dart';

class BackUpTextField extends StatelessWidget {

  final String? hintText;
  final bool? autofocus;
  final Function(String)? onChanged;
  final void Function()? iconOnPressed;
  final TextEditingController? controller;
  final FocusNode? backupNode;
  final Color? iconColor;

  const BackUpTextField({
    super.key,
    this.autofocus,
    this.onChanged,
    this.hintText,
    this.iconOnPressed,
    this.iconColor,
    this.backupNode,
    this.controller,
    });

  @override
  Widget build(BuildContext context) {

    final appWidth = context.width;


    return Padding(
      padding: const EdgeInsets.fromLTRB(4.0,0.0,2.0,0.0),
      child: Container(
        alignment: Alignment.center,
        child: TextFormField(
          controller: controller,
          focusNode: backupNode,
          cursorColor: Colors.grey.shade700,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: BackupFontStyle(
                appWidth.responsiveSize([13,12,12,12,11,10]),
                width: appWidth).copyWith(
              color: context.subTextColor,
            ),
            suffixIcon: IconButton(
              iconSize: 30,
              splashRadius: 25,
              splashColor: Colors.grey.shade500,
              onPressed: iconOnPressed,
              icon: Icon(
                Icons.fingerprint_sharp,
                color: iconColor,size: appWidth < 376 ? 22 : 25,
              ),
            ),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
