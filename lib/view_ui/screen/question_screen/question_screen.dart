import '../../../../core/export_package.dart';
import '../../widgets/elevated_button.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(4),
        children: [
          _buildQuestion(
            context,
            ' 공수 조건 수정은 어떻게 하나요?',
            '[등록] - [공수조건 변경] 에서 변경합니다',
          ),
          _buildQuestion(
            context,
            ' 이미 입력한 공수를 수정하는 방법은?',
            '해당 날짜에 공수를 다시 입력하면 이전 공수는 삭제되고 등록하신 고수가 등록되어 자동 수정됩니다.',
          ),
          _buildQuestion(
            context,
            ' 이미 입력한 메모를 수정하는 방법은?',
            '공수 수정 방법과 마찬가지로 해당 날짜에 공수를 다시 입력하면 이전 공수는 삭제되고 등록하신 고수가 등록되어 자동 수정됩니다.',
          ),
          _buildQuestion(
            context,
            ' 특정한 기간을 삭제하는 방법은 없나요?',
            '캘린더 우측 상단 [메뉴 아이콘] - [근로기간 검색하기]에서 원하시는 범위를 선택하신 후에 좌측 상단 아이콘 혹은 [선택완료] 이후 [선택기간삭제] 합니다',
          ),
          _buildQuestion(
            context,
            ' 특정한 기간에 공수를 확인하는 방법은?',
            '캘린더 우측 상단 [메뉴 아이콘] - [근로기간 검색하기]에서 원하시는 범위를 선택하신 후에 [선택완료] 하시면 확인 가능합니다',
          ),
          _buildQuestion(
            context,
            '메인화면에 1.0,1.5,2.0 변경 방법은?',
            '캘린더 우측 상단 [메뉴 아이콘] - [기본공수 변경하기]에서 원하시는 공수로 변경해주세요',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: CustomElevatedButton(
                text: '읽어주셔서 감사합니다',
                onPressed: () =>Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),

    );
  }

  Widget _buildQuestion(BuildContext context,String question, String answer) {
    return ExpansionTile(
      title: Text(question, style: const TextStyle(fontWeight: FontWeight.bold)),
      textColor: Colors.teal,
      collapsedIconColor: Colors.grey,
      iconColor: Colors.teal,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(child: Text(answer)),
            ],
          ),
        ),
      ],
    );
  }
}
