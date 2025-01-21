import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import '../../../core/export_package.dart';
import '../../../theme_color.dart';
import '../../dialog/archive_dialog/archive_dialog.dart';
import '../../dialog/backup_dialog/back_up_dialog.dart';
import '../../dialog/input_dialog/contract_form.dart';
import 'main_button_side.dart';

final List<Map<String, dynamic>> options = [
  {
    'label': '근로설정',
    'icon': Icons.settings,
    'selectedColor': Colors.blue.shade500
  },
  {
    'label': '누적기록',
    'icon': Icons.show_chart,
    'selectedColor': Colors.blue.shade500
  },
  {
    'label': '백업관리',
    'icon': Icons.settings_backup_restore,
    'selectedColor': Colors.blue.shade500
  },
];


class MainButton extends ConsumerStatefulWidget {
  const MainButton({super.key});

  @override
  ConsumerState<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends ConsumerState<MainButton> {

  int? selectedIndex;
  final ScrollController _scrollController = ScrollController();
  final double _chipWidth = 120.0; // 예상되는 ChoiceChip의 너비

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSelected(int index, double screenWidth) {
    if (_scrollController.hasClients) {
      final scrollPosition = (index * _chipWidth) - (screenWidth / 2) + (_chipWidth / 2);

      _scrollController.animateTo(
        scrollPosition.clamp(
          0.0,
          _scrollController.position.maxScrollExtent,
        ),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    void handleSelection(int index) {
      switch (index) {
        case 0:
          showDialog(
            context: context,
            builder: (context) => const InitialSetForm(),
          );
          break;
        case 1:
          ref.contract.when(
            data: (contractData) {
              if (contractData.isNotEmpty) {
                showDialog(
                    context: context,
                    builder: (context) => ArchiveDialog()
                );
              } else {
                customMsg('근로조건을 우선 입력해주세요');
                showDialog(
                  context: context,
                  builder: (context) => const InitialSetForm(),
                );
              }
            },
            loading: () => customMsg('로딩 중...'),
            error: (error, stack) => customMsg('근로조건을 우선 입력해주세요'),
          );
          break;
        case 2:
          showDialog(
              context: context, builder: (context) => const BackUpDialog());
          break;
      }
    }


    final appWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding:  EdgeInsets.fromLTRB(
        appWidth > 450 ? 0.0 : 0.0,
        0.0,
        appWidth > 450 ? 8.0 : 16.0,
        0.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding:  EdgeInsets.only(
                left: 16.0, right: 0.0,
                top: appWidth < 376 ? 0 : 16,
                bottom: appWidth < 376 ? 10 : 16,
              ),
              width: appWidth * 0.77,
              child: SizedBox(
                height: 35,
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: appWidth > 400 ? 7.0 : 4.0,
                      ),
                      child: ChoiceChip(
                        avatar: Icon(
                          options[index]['icon'],
                          size: appWidth > 450 ? 19 : 17,
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.grey.shade600,
                        ),
                        label: Text(
                          options[index]['label'],
                          style: TextStyle(
                            fontSize: appWidth > 450 ? 15 :14,
                            letterSpacing: appWidth > 450 ? 1.0 : null,

                            fontWeight: FontWeight.w900,
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.black87,
                          ),
                        ),
                        selected: selectedIndex == index,
                        onSelected: (bool selected) {
                          setState(() {
                            selectedIndex = selected ? index : null;
                            if (selected) {
                              handleSelection(index);
                              _scrollToSelected(index, appWidth * 0.7);
                            }
                          });
                        },
                        selectedColor: options[index]['selectedColor'],
                        backgroundColor: chipColor,
                        padding: EdgeInsets.symmetric(horizontal: appWidth < 376 ? 1.0 : 4.0),
                        elevation: 4, // 그림자 추가
                        shadowColor: Colors.grey.withOpacity(0.2), // 그림자 색상

                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          MainButtonSide(),
        ],
      ),
    );
  }
}