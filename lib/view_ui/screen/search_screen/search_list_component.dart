import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';

// 🕐 검색 히스토리 위젯
class SearchListWidget extends StatelessWidget {
  final List<String> searchHistory;
  final TextEditingController searchController;
  final ValueNotifier<String> searchQuery;
  final FocusNode searchNode;
  final bool isVisible;
  final Function(String) onDeleteKeyword; // 👈 삭제 콜백 추가
  final VoidCallback onClearAll; // 👈 전체삭제 콜백 추가

  const SearchListWidget({
    super.key,
    required this.searchHistory,
    required this.searchController,
    required this.searchQuery,
    required this.searchNode,
    required this.isVisible,
    required this.onDeleteKeyword,
    required this.onClearAll,
  });

  @override
  Widget build(BuildContext context) {
    if (!isVisible || searchHistory.isEmpty) {
      return SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          SizedBox(height: 8),
          _buildHistoryChips(context),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget('최근 검색', 13,
            color: context.isDark ? Colors.grey[200] : Colors.grey[600],
            fontWeight: FontWeight.w500),
        GestureDetector(
          onTap: () => onClearAll,
          child: TextWidget('전체삭제', 12,
              color:  context.isDark ? Colors.grey[200] : Colors.grey[500],
              fontWeight: FontWeight.normal),
        ),
      ],
    );
  }

  Widget _buildHistoryChips(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: searchHistory.take(5).map((history) {
        return _HistoryChip(
          text: history,
          onTap: () {
            searchController.text = history;
            searchQuery.value = history;
            searchNode.requestFocus();
          },
          onDelete: () =>  onDeleteKeyword(history),
        );
      }).toList(),
    );
  }
}

// 📌 개별 히스토리 칩
class _HistoryChip extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _HistoryChip({
    required this.text,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {

    final textColor = context.isDark ? Colors.grey[100] : Colors.grey[700];
    final iconColor = context.isDark ? Colors.grey[100] : Colors.grey[600];
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: context.isDark ? Colors.black54 : Colors.grey[200],
          border: context.isLight ? null : Border.all(width: 0.75,
              color: Colors.white),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextWidget(text, 13,
                color: textColor, fontWeight: FontWeight.normal,
            ),
            SizedBox(width: 4),
            GestureDetector(
              onTap: onDelete,
              child: Icon(Icons.close, size: 14, color: iconColor),
            ),
          ],
        ),
      ),
    );
  }
}
