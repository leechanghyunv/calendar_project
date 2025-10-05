import '../../../../core/export_package.dart';

class DaySelectScreen extends StatelessWidget {
  const DaySelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: const Text('날짜 선택'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 👈 이전 화면으로 돌아가기
          },
        ),
      ),
    );
  }
}
