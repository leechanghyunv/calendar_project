import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';

import '../../../../core/export_package.dart';
import '../../../dialog/dialog_text.dart';

class BackUpTextField extends StatelessWidget {

  final String? hintText;
  final bool? autofocus;
  final Function(String)? onChanged;
  final void Function()? iconOnPressed;
  final TextEditingController controller;
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
    required this.controller,
    });

  @override
  Widget build(BuildContext context) {

    final appWidth = context.width;
    final fontSize = context.width.responsiveSize([15,13.5,13.5,13.5,13,12]);

    return Padding(
      padding: const EdgeInsets.fromLTRB(4.0,8.0,2.0,0.0),
      child: Row(
        crossAxisAlignment: .end,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: backupNode,
              maxLines: 10,
              cursorColor: Colors.grey.shade600,

              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: BackupFontStyle(
                    fontSize,
                    width: appWidth).copyWith(
                  color: context.subTextColor,
                  fontWeight: .bold
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),

              ),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
