import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:calendar_project_240727/model/work_history_model.dart';

// 🎯 검색 결과 위젯 분리
class SearchResultWidget extends StatelessWidget {
  final AsyncValue<List<WorkHistory>> historyAsync;
  final List<WorkHistory> filteredResults;

  const SearchResultWidget({
    super.key,
    required this.historyAsync,
    required this.filteredResults,
  });

  @override
  Widget build(BuildContext context) {
    return switch (historyAsync) {
      AsyncLoading() => _buildLoading(context),
      AsyncError(:final error) => _buildError(context, error),
      AsyncData() => filteredResults.isEmpty
          ? _buildEmpty(context)
          : _buildList(context),
      _ => SizedBox(),
    };
  }

  Widget _buildLoading(BuildContext context) {
    return Center(
      child: TextWidget('로딩중....', 14),
    );
  }

  Widget _buildError(BuildContext context, Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget('${error.toString()}', 14,
              color: Colors.grey.shade700),
        ],
      ),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget('검색 결과가 여기에 표시됩니다', 14,
              color: Colors.grey[500]),
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: filteredResults.length,
      itemBuilder: (context, index) {
        final history = filteredResults[index];
        return _HistoryCard(history: history);
      },
    );
  }
}

// 📋 개별 카드 위젯
class _HistoryCard extends StatelessWidget {
  final WorkHistory history;

  const _HistoryCard({required this.history});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(vertical: 14,horizontal: 16),
      decoration: BoxDecoration(
        color: context.boxColor,
        borderRadius: BorderRadius.circular(12),
        border: context.isLight ? null : Border.all(width: 0.75,
            color: Colors.white),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            child: Column(
              children: [
                TextWidget(
                  history.date.day.toString(), 22,
                  color: Colors.teal,
                ),
                TextWidget(
                  '${history.date.month}월', 12,
                  color: Colors.teal[200],
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: TextWidget(
              '${history.memo}', 14,
              color: context.isDark ? Colors.grey[100] : Colors.grey[800],
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(width: 16),
          SearchMoreContent(history: history),

        ],
      ),
    );
  }
}


class SearchMoreContent extends StatelessWidget {
  final WorkHistory history;
  const SearchMoreContent({super.key, required this.history});

  @override
  Widget build(BuildContext context) {

    final labels = ['일당', '공수', '근무'];

    Widget chartInText(String text){
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(text,
            textScaler: TextScaler.noScaling,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: context.isDark ? Colors.grey.shade100 : Colors.grey.shade700,
            ),
        ),
      );
    }

    return PopupMenuButton(
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade100),
      ),
      offset: const Offset(15, 30),
      itemBuilder: (context) => [
        PopupMenuItem(
          enabled: false,
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      chartInText('${labels[0]}:'),
                      chartInText('${(history.pay / 10000).toInt()}만원',),
                    ],
                  ),
                  Row(
                    children: [
                      chartInText('${labels[1]}:'),
                      chartInText('${(history.record).toInt()}공수',),
                    ],
                  ),
                  Row(
                    children: [
                      chartInText('${labels[2]}:'),
                      chartInText('${(history.comment)}',),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ],
      child: Icon(
        Icons.more_horiz,
        color: Colors.grey.shade400,
      ),
    );
  }
}
