import '../../../../core/export_package.dart';
import '../../dialog_text.dart';
import 'app_review_method.dart';

/// 30번 클릭했을때 앱 리뷰 페이지로 이동하는 메써드를 호출하는 위젯

class AppReviewButton extends StatefulWidget {

  final VoidCallback? onPressed;

  const AppReviewButton({super.key, this.onPressed});

  @override
  State<AppReviewButton> createState() => _AppReviewButtonState();
}

class _AppReviewButtonState extends State<AppReviewButton> {
  final ReviewManager _reviewManager = ReviewManager();

  @override
  void initState() {
    super.initState();
    _reviewManager.init();
  }

  Future<void> _handleTap() async {
    await _reviewManager.handleTap();
    widget.onPressed?.call();
  }

  @override
  void dispose() {
    _reviewManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: _handleTap,
        child: ButtonTextWidget('확인', 17,
        ),
    );
  }
}
