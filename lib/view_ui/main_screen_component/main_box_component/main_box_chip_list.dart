import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart' as go;
import '../../../core/widget/toast_msg.dart';
import '../../../view_model/sqlite_model/history_model.dart';

final selectedChipIndexProvider = StateProvider.autoDispose<int?>((ref) => null);

class ChipList extends HookConsumerWidget {
  const ChipList({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final appWidth = MediaQuery.of(context).size.width;
    final selectedIndex = ref.watch(selectedChipIndexProvider);

    return Container(

      height: switch (appWidth) {
        > 420 => 24.5,
        > 400 => 23.5,
        _ => 22,
      },

      width: switch (appWidth) {
        > 450 => appWidth * 0.41,
        > 400 => appWidth * 0.39,
        _ => appWidth * 0.41,
      },

      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: chipList.length,
          itemBuilder: (context,index){
            return Padding(
              padding:  EdgeInsets.symmetric(horizontal: appWidth > 400 ? 4 : 3),
              child: GestureDetector(
                  onTap: () {
                    switch (ref.contract) {
                      case AsyncData(value: final conditions) when conditions.isNotEmpty:
                        final condition = conditions.last;
                        switch (index) {
                          case 0:
                            enrollMsg(ref.selected, '정상근무');
                            ref.read(addHistoryProvider(condition.normal, ref.selected));
                            break;
                          case 1:
                            enrollMsg(ref.selected, '연장근무');
                            ref.read(addHistoryProvider(condition.extend, ref.selected));
                            break;
                          case 2:
                            enrollMsg(ref.selected, '야간근무');
                            ref.read(addHistoryProvider(condition.night, ref.selected));
                            break;
                        }
                      case AsyncData(value: final conditions) when conditions.isEmpty:
                        customMsg('근로조건을 우선 입력해주세요');
                        return;
                    }
                    ref.read(selectedChipIndexProvider.notifier).state =
                    selectedIndex == index ? null : index;

                  },

                onTapUp: (details){
                  switch (ref.contract){
                    case AsyncData(value: final conditions) when conditions.isNotEmpty:
                      Future.delayed(Duration(milliseconds: 100), () {
                        ref.refreshState(context);
                      });
                      break;
                    case AsyncData(value: final conditions) when conditions.isEmpty:
                      context.go('/setting');
                      break;
                  }

                  },
                  child: _buildChip(chipList[index],
                    appWidth,
                    isSelected: selectedIndex == index,
                  ),
              ),
            );
          }),
    );
  }

  Widget _buildChip(
      Map<String, dynamic> chipData,
      double width,
      {bool isSelected = false,
      }) {
    return Container(
      height: switch (width) {
        > 450 => 26,
        > 420 => 21,
        > 400 => 21,
        _ => 19,
      },

      width: switch (width) {
        > 450 => 52,
        > 420 =>  48,
        > 400 =>  44.5,
        _ => 44,
      },

      decoration: BoxDecoration(
        color: Colors.grey.shade200, // 드래그 중 색상 변경
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1.5,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
            color: isSelected ? Colors.black : Colors.grey.shade800,
            width: isSelected ? 1.25 : 0.75,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [

              Platform.isAndroid ? SvgPicture.asset(
                'assets/${chipData['icon']!}.svg',
                width: switch (width) {
                  > 450 => 13,
                  > 420 => 12,
                  > 400 => 11.5,
                  _ => 11,
                },
                colorFilter: ColorFilter.mode(
                  chipData['color'],
                  BlendMode.srcIn,
                ),
                clipBehavior: Clip.antiAlias,

              ) : SizedBox.shrink(),

              Text(
                textScaler: TextScaler.noScaling,
                ' ${chipData['value']!} ',
                style:  TextStyle(
                  fontSize: switch (width) {
                    > 450 => 14,
                    > 420 => 12,
                    > 400 => 11.5,
                    _ => 11,
                  },
                    fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),


      ),
    );
  }
}

final List<Map<String,dynamic>> chipList = [
  {
    'value' : Platform.isAndroid ? '1.0' : '🚀1.0',
    'icon' : 'star',
    'color' :  Colors.black,

  },
  {
    'value' : Platform.isAndroid ? '1.5' : '🔥1.5',
    'icon' : 'cuboid',
    'color' :  Colors.black,

  },
  {
    'value' : Platform.isAndroid ? '2.0' : '🎉2.0',
    'icon' : 'zap',
    'color' :  Colors.black,
  },

];

