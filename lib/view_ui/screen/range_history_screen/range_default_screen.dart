import '../../../core/export_package.dart';

class RangeDefaultScreen extends StatelessWidget {

  final List<Widget> children;
  final Widget? floatingActionButton;

   RangeDefaultScreen({super.key, required this.children, this.floatingActionButton});

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
              /// calendar일때는 vertical: 0.0, 아닐때는 vertical: 12.0
              /// /// calendar일때는 horizontal: 12.0, 아닐때는 horizontal: 24.0
              padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 0.0),
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
