import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';
import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';
import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';
import '../auth_screen/component/auth_text.dart';
import '../auth_screen/component/auth_modal_component.dart';
import '../initial_setting_screen/initial_setting_screen.dart';
import 'component/statistics_filter_chip.dart';
import 'component/statistics_box.dart';
import 'component/statistics_filter_modal.dart';

class UserStatisticsScreen extends HookConsumerWidget {
  const UserStatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = context.height;
    final width = context.width;

    final nestedScrollController = useScrollController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: NestedScrollView(
            controller: nestedScrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Container(
                          height: height > 800 ? 200 : height > 750 ? 180 : 165,
                          width: context.width,
                          decoration: context.OpeningBoxDeco,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: height > 750 ? 12.0 : 8.0, horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    AnimatedEmoji(
                                      AnimatedEmojis.wave.mediumLight,
                                      repeat: false,
                                      animate: true,
                                      size: width > 400 ? 18 : 17,
                                    ),
                                    SizedBox(width: 5),
                                    TextWidget('안녕하세요 워크캘린더입니다.',15.5,width,
                                    color: context.textColor),
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 16.0),
                                    child: introText(height),
                                  ),
                                ),
                                // Spacer(),
                                Row(
                                  children: [
                                    /// 근로조건 설정하기
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () => initialModal(context),
                                        child: Container(
                                          height:  context.width > 400 ? 30 : 30.5,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: context.isDark ? Colors.teal.shade900 : Colors.teal,
                                            borderRadius: BorderRadius.circular(8),
                                            boxShadow: context.isDark ? null : [
                                              BoxShadow(
                                                color: Colors.grey.shade300,
                                                blurRadius: 3,
                                                offset: const Offset(2, 5),
                                              ),
                                            ],
                                          ),
                                          child: TextWidget(
                                              '근로조건 설정하기', 14.5, width,
                                              color: context.buttonColor),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  )
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height > 750 ? 20 : 15),
                    // StatisticsFilterModal(),

                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width < 370 ? 2.5 : 4.0),
                      child: StatisticsFilterChip(
                        nestedScrollController
                      ),
                    ),
                    context.height > 850 ? SizedBox(height: 5) : SizedBox.shrink(),
                    Padding(
                      padding:  EdgeInsets.symmetric(
                          vertical: height > 750 ? 3.0 : 0.0, horizontal: 8.0),
                      child: Divider(color: Colors.grey.shade300, thickness: 1.0),
                    ),
                    SizedBox(height: 15),
                    StatisticsBox(),
                
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
