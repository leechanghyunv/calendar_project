import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import '../../../../core/export_package.dart';
import '../../../../core/utils/formatter.dart';
import '../../../../core/widget/text_widget.dart';
import 'auth_textField/auth_field_decoration.dart';

enum PayFieldAction {
  autoComplete, // 자동완성
  hideKeyboard, // 키보드 숨기기
  closeInput,   // 입력창에서 나가기
  none,         // suffixIcon 없음
}

class PayNumberField extends HookWidget {
  final String name;
  final FocusNode? focusNode;
  final TextEditingController? textController;
  final String? hintText;
  final PayFieldAction action;
  final ValueChanged<String?>? onSubmitted;
  final Function(String?)? onChanged;
  final VoidCallback? onActionTap;

  const PayNumberField({
    super.key,
    required this.name,
    this.focusNode,
    this.textController,
    this.hintText,
    this.action = PayFieldAction.none,
    this.onSubmitted,
    this.onChanged,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {

    final hasText = useState(false);

    return authContainer(
      child: FormBuilderTextField(
        name: name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        focusNode: focusNode,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.numberWithOptions(signed: true),
        cursorColor: Colors.grey.shade700,
        cursorWidth: 4.0,
        decoration: customInputDecoration(
          hintText: hintText,
          suffixIcon: _buildSuffixIcon(context,hasText.value),
        ),
        inputFormatters: [
          CommaInputFormatter6Digits(),
        ],
        onSubmitted: onSubmitted,
        onChanged: (val){
          hasText.value = val != null && val.isNotEmpty;
          onChanged?.call(val);
        },
      ),
    );
  }

  Widget? _buildSuffixIcon(BuildContext context, bool hasText) {
    if (action == PayFieldAction.none) return null;

    final actionText = {
      PayFieldAction.autoComplete: '자동완성',
      PayFieldAction.hideKeyboard: '키보드 숨기기',
      PayFieldAction.closeInput:   '나가기',
    }[action]!;

    final buttonColor = context.isDark ? Colors.grey.shade900 : Colors.grey.shade200;

    final isAutoCompleteWithText = action == PayFieldAction.autoComplete && hasText;

    return GestureDetector(
      onTap: () {
        switch (action) {
          case PayFieldAction.hideKeyboard:
            FocusScope.of(context).unfocus();
            break;
          case PayFieldAction.closeInput:
            Navigator.of(context, rootNavigator: true).pop();
            break;
          case PayFieldAction.autoComplete:
            HapticFeedback.selectionClick();
            onActionTap?.call();
            break;
          case PayFieldAction.none:
            break;
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isAutoCompleteWithText
                ? (context.isDark ? Colors.teal.shade900 : Colors.grey.shade200)
                : buttonColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 2.0,
                horizontal: 8.0),
            child: TextWidget(
              actionText, 14,
                context.width,
              color: isAutoCompleteWithText
                  ? (context.isDark ? Colors.teal.shade100 : Colors.teal.shade700)
                  : context.subTextColor,



            ),
          ),
        ),
      ),
    );
  }

}
