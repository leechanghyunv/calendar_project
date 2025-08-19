import 'package:calendar_project_240727/base_app_size.dart';

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
        child: TextFormField(
          controller: controller,
          focusNode: backupNode,
          cursorColor: Colors.grey.shade700,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: BackupFontStyle(13,width: appWidth),
            labelStyle: BackupFontStyle(15,height: 1.5,),
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
