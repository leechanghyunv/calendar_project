import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:flutter_svg/svg.dart';
import '../provider/info_box_provider.dart';

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
                          fontSize: height > 750 ? (width > 400 ? 22 : 20) : 16.5,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),

                      goalValue == 0 ? RichText(
                        textScaler: TextScaler.noScaling,
                        text: TextSpan(
                          text: '목표금액은 ',
                          style: TextStyle(
                            fontSize: height > 750 ? (width > 400 ? 13.5 : 12.5) : 10,
                            color: Colors.grey.shade700,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '✅목표관리버튼',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
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
                            // SvgPicture.asset(
                            //   'assets/sparkle.svg',
                            //   width: height > 750 ? (width > 400 ? 13.5 : 12.5) : 10,
                            //   color: color,
                            //   clipBehavior: Clip.antiAlias,
                            // ),
                            RichText(
                              textScaler: TextScaler.noScaling,
                              text: TextSpan(
                                text: '🔥 누적금액 ${data.total}만원 ',
                                style: TextStyle(
                                  fontSize: height > 750 ? (width > 400 ? 13.5 : 12.5) : 10,
                                  color: Colors.grey.shade700,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '목표금액의 $percent%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
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
              fontSize: height > 750 ? (width > 400 ? 22 : 20) : 16.5,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
          RichText(
            textScaler: TextScaler.noScaling,
            text: TextSpan(
              text: '목표금액은 ',
              style: TextStyle(
                fontSize: height > 750 ? (width > 400 ? 13.5 : 12.5) : 10,
                color: Colors.grey.shade700,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '✅목표관리버튼',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
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

