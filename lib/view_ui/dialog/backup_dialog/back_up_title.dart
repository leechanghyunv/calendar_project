import '../../../core/export_package.dart';
import '../dialog_text.dart';

class BackupTitleBox extends StatefulWidget {
  final FocusNode focusNode;

  const BackupTitleBox({
    super.key,
    required this.focusNode,
  });

  @override
  State<BackupTitleBox> createState() => _BackupTitleBoxState();
}

class _BackupTitleBoxState extends State<BackupTitleBox> {
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_handleFocusChange);
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      isKeyboardVisible = widget.focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;

    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 300),
      tween: Tween<double>(
        begin: 40,
        end: isKeyboardVisible ? 0 : 40,
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