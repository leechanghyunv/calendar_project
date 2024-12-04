import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';
import '../../../core/widget/toast_msg.dart';
import '../../../repository/time/calendar_time_controll.dart';
import '../../../view_model/history_model.dart';
import '../dialog_text.dart';

class MonthDeleteDialog extends StatefulWidget {
  const MonthDeleteDialog({super.key});

  @override
  State<MonthDeleteDialog> createState() => _MonthDeleteDialogState();
}

class _MonthDeleteDialogState extends State<MonthDeleteDialog> {
  @override
  Widget build(BuildContext context) {

    final appWidth = MediaQuery.of(context).size.width;

    return Consumer(
      builder: (context, ref, child) {
        final timeManager = ref.watch(timeManagerProvider);
        final selected = timeManager.selected;
        final month = selected.month.toString().padLeft(2, '0');

        return AlertDialog(
          shape: ShapeBorder.lerp(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            10.0,
          ),
          title: Row(
            children: [

              TextWidget('🗑️ ${month}월 공수기록 삭제', 17, appWidth),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:  12.0),
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.black, size: 20),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [


              Container(
                width: appWidth > 500? appWidth/3 : appWidth,
                margin: const EdgeInsets.only(top: 8),
                child: Stack(
                  children: [
                    // 말풍선 본체
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '${month}월 공수기록을 삭제하면 더이상 복구할 수 없습니다. 삭제 하시겠습니까?',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    // 말풍선 꼬리
                    Positioned(
                      top: -8,
                      left: 20,
                      child: CustomPaint(
                        size: const Size(16, 8),
                        painter: BubbleTrianglePainter(Colors.grey[200]!),
                      ),
                    ),
                  ],
                ),
              ),
              // 추가 경고 아이콘

            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: ButtonTextWidget('취소', 17),
            ),
            TextButton(
              onPressed: () async {
                await ref.read(deleteMonthHistoryProvider(selected));
                customMsg('${month}월 공수기록을 삭제합니다');
                Navigator.pushReplacementNamed(context, '/main');

              },
              child: ButtonTextWidget('확인', 17),
            ),
          ],
        );
      },

    );
  }
}

class BubbleTrianglePainter extends CustomPainter {
  final Color color;

  BubbleTrianglePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}