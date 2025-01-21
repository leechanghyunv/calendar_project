import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/export_package.dart';

import '../../../core/widget/toast_msg.dart';
import '../../../view_model/history_model.dart';
import '../../dialog/input_dialog/contract_form.dart';

class DraggableChipList extends ConsumerStatefulWidget {
  const DraggableChipList({super.key});

  @override
  ConsumerState<DraggableChipList> createState() => _DraggableChipListState();
}

class _DraggableChipListState extends ConsumerState<DraggableChipList> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {

    final appWidth = MediaQuery.of(context).size.width;

    final contract = ref.contract;
    return Container(

      height: switch (appWidth) {
        > 450 => 25,
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
                    // contract 상태 확인
                    switch (contract) {
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
                      default:
                        customMsg('근로조건을 우선 입력해주세요');
                        return;
                    }
                    setState(() {
                      selectedIndex = selectedIndex == index ? null : index;
                    });
                  },

                onTapUp: (details){
                  switch (contract){
                    case AsyncData(value: final conditions) when conditions.isNotEmpty:
                      ref.refreshState(context);
                      break;
                    case AsyncData(value: final conditions) when conditions.isEmpty:
                      showDialog(
                        context: context,
                        builder: (context) => const InitialSetForm(),
                      );
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

  Widget _buildChip(Map<String, dynamic> chipData,double width, {bool isSelected = false}) {
    return Container(

      height: switch (width) {
        > 450 => 23,
        > 420 => 21,
        > 400 => 21,
        _ => 19,
      },

      width: switch (width) {
        > 450 => 52,
        > 400 =>  48,
        > 400 =>  44.5,
        _ => 43,
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
            width: isSelected ? 1.25 : 0.5,),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Center( // Center 위젯으로 텍스트 중앙 정렬
          child: Text(
            '${chipData['imoji']!} ${chipData['value']!}',
            style:  TextStyle(
                color: chipData['color'],

              fontSize: switch (width) {
                > 450 => 13,
                > 420 => 12,
                > 400 => 11.5,
                _ => 11,
              },
                fontWeight: FontWeight.w900,
              shadows: Platform.isAndroid ? [
                Shadow(
                  blurRadius: 0.75,
                  color: Colors.grey,
                  offset: Offset(0.25, 0.25),
                ),
              ] : null,
            ),
          ),
        ),
      ),
    );
  }
}

final List<Map<String,dynamic>> chipList = [
  {
    'value' : '1.0',
    'imoji' : '🚀'
  },
  {
    'value' : '1.5',
    'imoji' : '🔥'
  },
  {
    'value' : '2.0',
    'imoji' : '🎉'
  },

];

