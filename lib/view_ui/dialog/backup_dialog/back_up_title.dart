import '../../../core/export_package.dart';
import '../dialog_text.dart';

class BackupTitleBox extends HookWidget {
  final FocusNode focusNode;

  const BackupTitleBox({
    super.key,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    final isKeyboardVisible = useState(false);

    useEffect(() {
      void handleFocusChange() {
        isKeyboardVisible.value = focusNode.hasFocus;
      }

      focusNode.addListener(handleFocusChange);
      return () => focusNode.removeListener(handleFocusChange);
    }, [focusNode]);

    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 300),
      tween: Tween<double>(
        begin: 40,
        end: isKeyboardVisible.value ? 0 : 40,
      ),
      builder: (context, height, child) {
        if (height == 0) return const SizedBox.shrink();

        return SizedBox(
          height: height,
          child: Opacity(
            opacity: height / 40,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 8.0),
              child: SizedBox(
                child: Row(
                  children: [
                    DialogTextWidget('공수데이터 백업관리', appWidth > 400 ? 17 : 15.5),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}