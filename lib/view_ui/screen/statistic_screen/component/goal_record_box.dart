import 'package:calendar_project_240727/repository/repository_import.dart';
import '../provider/info_box_provider.dart';
import '../provider/statistic_switch_provider.dart';


class GoalAnimatedSwitcher extends HookConsumerWidget {
  const GoalAnimatedSwitcher({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    final switchAsync = ref.watch(switchNotifierProvider);
    final isOn = switchAsync.valueOrNull ?? false;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: SizeTransition(
            sizeFactor: animation,
            axisAlignment: -1.0,
            child: child,
          ),
        );
      },
      child: isOn
          ? const SizedBox(key: ValueKey('off'))
          : Column(
        key: const ValueKey('on'),
        children: [
          GoalRecordBox(
            Colors.green.shade700,
          ),
          SizedBox(height: height > 750 ? 20.0 : 15.0),
        ],
      ),
    );
  }
}



class GoalRecordBox extends ConsumerWidget {

  final Color color;

  const GoalRecordBox(this.color, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final contract = ref.watch(viewContractProvider);
    final data = ref.watch(infoBoxProvider)
        .whenData((d) => d).value ?? const InfoBoxModel();

    final total = data.total;

    return contract.whenData(
            (val) {
              final goal = (val.last.goal).toStringAsFixed(0);
              final goalInt = int.tryParse(goal) ?? 0;
              final goalValue = goalInt ~/ 10000;
              final percent = goalValue > 0 ? ((total / goalValue) * 100).floor() : 0;
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      Text(
                        goalValue >= 10000
                            ? '목표금액은 ${(goalValue / 10000).toStringAsFixed(1)}억원 입니다'
                            : '목표금액은 ${goalValue}만원 입니다',
                        textScaler: TextScaler.noScaling,
                        style: TextStyle(
                          fontSize: height > 750 ? (width > 400 ? 22 : 20) : 18.5,
                          fontWeight: Platform.isAndroid ? FontWeight.w600 :  FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),

                      goalValue == 0 ? RichText(
                        textScaler: TextScaler.noScaling,
                        text: TextSpan(
                          text: '목표금액은 ',
                          style: TextStyle(
                            fontSize: height > 750 ? (width > 400 ? 13.5 : 12.5) : 11.5,
                            color: Colors.grey.shade700,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '✅목표관리버튼',
                              style: TextStyle(
                                fontWeight: Platform.isAndroid ? FontWeight.w600 :  FontWeight.w900,
                                letterSpacing: 0.75,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(text: ' 으로 설정합니다.'),
                          ],
                        ),
                      ) :
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RichText(
                              textScaler: TextScaler.noScaling,
                              text: TextSpan(
                                text: '🔥 누적금액 ${data.total}만원 ',
                                style: TextStyle(
                                  fontSize: height > 750 ? (width > 400 ? 13.5 : 12.5) : 11.5,
                                  color: Colors.grey.shade700,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '목표금액의 $percent%',
                                    style: TextStyle(
                                      fontWeight: Platform.isAndroid ? FontWeight.w600 :  FontWeight.w900,
                                      letterSpacing: 0.75,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(text: ' 달성'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
    ).valueOrNull ?? Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text('목표금액은 ${0}만원 입니다',
            textScaler: TextScaler.noScaling,
            style: TextStyle(
              fontSize: height > 750 ? (width > 400 ? 22 : 20) : 18.5,
              fontWeight: Platform.isAndroid ? FontWeight.w600 :  FontWeight.w900,
              color: Colors.black,
            ),
          ),
          RichText(
            textScaler: TextScaler.noScaling,
            text: TextSpan(
              text: '목표금액은 ',
              style: TextStyle(
                fontSize: height > 750 ? (width > 400 ? 13.5 : 12.5) : 11.5,
                color: Colors.grey.shade700,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '✅목표관리버튼',
                  style: TextStyle(
                    fontWeight: Platform.isAndroid ? FontWeight.w600 :  FontWeight.w900,
                    letterSpacing: 0.75,
                    color: Colors.black,
                  ),
                ),
                TextSpan(text: ' 으로 설정합니다.'),
              ],
            ),
          )
        ],
      ),
    );


  }
}

