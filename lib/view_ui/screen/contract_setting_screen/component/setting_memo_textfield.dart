import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';
import '../../../../core/export_package.dart';

class SettingMemoTextField extends HookConsumerWidget {
  final FocusNode nodeMemo;
  final FocusNode decimalMemo;
  final TextEditingController memoController;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  const SettingMemoTextField(
      {required this.nodeMemo,
        required this.decimalMemo,
      required this.memoController,
      this.onChanged,
        required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final borderColor = nodeMemo.hasFocus ? Colors.teal : Colors.grey.shade500;

    return Container(
      constraints: BoxConstraints(
        minHeight: context.width > 400 ? 150 : 100,
      ),
      decoration: BoxDecoration(
        color: context.isDark ? Colors.black54 : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: borderColor,
          width: nodeMemo.hasFocus ? 1.55 : 1.05,
        ),
        boxShadow: context.defaultShadow,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            focusNode: nodeMemo,
            controller: memoController,
            onChanged: onChanged,
            maxLines: null, // 자동으로 여러 줄 입력 가능

            cursorColor: Colors.grey.shade500,
            style: TextStyle(
              fontSize: context.width > 400 ? 15.5 : 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 6.0,
              ),

              hintText: ' 메모내용을 입력해주세요',
              hintStyle: TextStyle(
                  fontSize: context.width > 400 ? 15.5 : 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  overflow: TextOverflow.ellipsis),
              border: InputBorder.none,
              isDense: true,
            ),
          ),
        ],
      ),
    );
  }
}
