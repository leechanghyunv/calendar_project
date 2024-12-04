import 'package:calendar_project_240727/view_model/contract_model.dart';
import '../../core/export_package.dart';
import '../../core/widget/text_widget.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:async';

class PieChartIndexText extends ConsumerStatefulWidget {
  const PieChartIndexText({super.key});

  @override
  ConsumerState<PieChartIndexText> createState() => _PieChartIndexTextState();
}

class _PieChartIndexTextState extends ConsumerState<PieChartIndexText> {
  int currentIndex = 0;
  Timer? _timer;
  late int cycleLength;

  String formatAmount(int amount) {
    double manWon = amount / 10000;
    return '${manWon}만원';
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        startTimer();
      }
    });
  }

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (mounted) {
        setState(() {
          currentIndex = (currentIndex + 1) % cycleLength;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final contract = ref.watch(viewContractProvider);
    final appWidth = MediaQuery.of(context).size.width;

    return contract.when(
      data: (val) {

        if (val.isEmpty) {
          return const SizedBox(); // 또는 다른 기본 위젯 반환
        }

        final dayPay = val.last.subsidy;
        // subsidy 값이 있고 0보다 큰 경우에만 추가
        final bool hasSubsidy = dayPay > 0;

        // 기본 색상 리스트
        List<Color> colors = [Colors.blue, Colors.amber.shade700, Colors.red];
        // 기본 텍스트 리스트
        List<String> texts = [
          '주간:${formatAmount(val.last.normal)}',
          '연장:${formatAmount(val.last.extend)}',
          '야간:${formatAmount(val.last.night)}'
        ];

        if (hasSubsidy) {
          colors.add(Colors.green);
          texts.add('일비:${formatAmount(dayPay)}');
        }

        cycleLength = hasSubsidy ? 4 : 3;
        return contract.hasValue ? Padding(
          padding: EdgeInsets.fromLTRB(9.0, 0.0, 9.0, 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: colors[currentIndex],
                    size: Platform.isAndroid ? 6 : 7,
                  ),
                  SizedBox(width: 2.5),
                  TextWidget(
                      texts[currentIndex],
                      9,
                      appWidth
                  ),
                ],
              )
                  .animate(
                key: ValueKey(currentIndex),
                onPlay: (controller) => controller.forward(),
              )
                  .fadeIn(
                duration: 500.ms,
                curve: Curves.easeIn,
              )
                  .then(delay: 2500.ms)
                  .fadeOut(
                duration: 1000.ms,
                curve: Curves.easeOut,
              ),
            ],



          ),
        ) : SizedBox();

      },
      error: (error, stackTrace) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('데이터 로드 중 오류가 발생했습니다.'),
          ],
        );
      },
      loading: () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 10,
              height: 10,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}