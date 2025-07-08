import '../../../core/export_package.dart';
import '../../../core/export_package.dart' as badges;
import '../../../view_model/view_provider/focus_node_listner.dart';
import '../../../view_model/view_provider/is_galaxy_fold.dart';
import '../../../view_model/view_provider/main_button_index_provider.dart';
import 'button_option.dart';
import 'main_button_side.dart';

class MainButton extends HookConsumerWidget {
   MainButton({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final isFocused = ref.watch(focusStateProvider);

    final _scrollController = useScrollController();
    final selectedIndex = ref.watch(selectedIndexProvider);

    const chipWidth = 120.0;

    final appWidth = MediaQuery.of(context).size.width;
    final isFold = ref.watch(isGalaxyFoldProvider);
    final isFoldValue = isFold.asData?.value ?? false;


    // 🎯 스크롤 함수
    final _scrollToSelected = useCallback((int index, double screenWidth) {
      if (_scrollController.hasClients) {
        final scrollPosition = (index * chipWidth) - (screenWidth / 2) + (chipWidth / 2);

        _scrollController.animateTo(
          scrollPosition.clamp(
            0.0,
            _scrollController.position.maxScrollExtent,
          ),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }, [_scrollController]);


    void handleSelection(int index) {
      if (index >= options.length) return;
      switch (index) {
        case 0: context.go('/setting'); break;
        case 1: context.go('/calendar'); break;
        case 2: context.go('/statics'); break;
      }
    }

    return isFocused ? SizedBox.shrink() :  Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding:  EdgeInsets.only(
                left: 16.0, right: 0.0,
                /// 갤럭시 23울트라, 24플러스에서 6줄일 경우 마지막달을 가리는 문제
                top: appWidth < 376 ? 0 : isFoldValue ? 0 : 16,
                /// 16
                bottom: appWidth < 376 ? 10 : isFoldValue ? 10 : 16,
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

                      /// badge
                      child: ChoiceChip(
                        side: BorderSide(
                          color: Colors.grey.shade200,
                          width: 0.25,
                        ),
                        avatar: Icon(
                          options[index]['icon'],
                          size: appWidth > 450 ? 20 :  appWidth < 376 ? 17 :  18,
                          color: selectedIndex == index
                              ? Colors.grey.shade700
                              : Colors.grey.shade700,
                        ),
                        label: Text(
                          options[index]['label'],
                          textScaler: TextScaler.noScaling,
                          style: TextStyle(
                            fontSize: appWidth > 450 ? 16 : appWidth < 376 ? 13 : 14,
                            letterSpacing: appWidth > 450 ? 1.0 : null,
                            fontWeight: Platform.isAndroid ? FontWeight.bold : FontWeight.w900,
                            color: selectedIndex == index
                                ? Colors.black87
                                : Colors.black87,
                          ),
                        ),


                        selected: selectedIndex == index,
                        onSelected: (bool selected) {
                          ref.read(selectedIndexProvider.notifier)
                              .setIndex(selected ? index : null);
                          if (selected) {
                            handleSelection(index);
                            _scrollToSelected(index, appWidth * 0.7);
                          }
                        },
                        selectedColor: options[index]['selectedColor'],
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: appWidth < 376 ? 1.0 : 4.0),
                        elevation: 4, // 그림자 추가
                        shadowColor: Colors.grey.withOpacity(0.2),

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