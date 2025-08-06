import '../../../core/export_package.dart';

class RangeDefaultScreen extends StatelessWidget {

  final List<Widget> children;
  final Widget? floatingActionButton;
  final bool isCalendarScreen;  // 파라미터로 받기

   RangeDefaultScreen({super.key, required this.children, this.floatingActionButton, required this.isCalendarScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey.shade50,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height
                  - MediaQuery.of(context).padding.top
                  - MediaQuery.of(context).padding.bottom, // SafeArea 높이
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: isCalendarScreen ? 12.0 : 24.0,
                  vertical: isCalendarScreen ? 0.0 : 12.0),
              child: Column(
                children: children,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: floatingActionButton,
    );
  }
}
