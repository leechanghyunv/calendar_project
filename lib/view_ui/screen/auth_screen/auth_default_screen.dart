import '../../../core/export_package.dart';

class AuthDefaultScreen extends StatelessWidget {
  final ScrollController scrollController;
  final GlobalKey<FormBuilderState> authKey;
  final Widget widget;
  const AuthDefaultScreen(
      {super.key,
      required this.scrollController,
      required this.widget,
      required this.authKey});

@override
Widget build(BuildContext context) {
  return Scaffold(
    resizeToAvoidBottomInset: true,
    backgroundColor: Colors.grey.shade50,
    body: Center(
      child: Scrollbar(
        thickness: 6,         // 스크롤바 두께
        radius: Radius.circular(4.0),  // 둥근 모서리
        thumbVisibility: true,  // 항상 스크롤바 표시

        controller: scrollController,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: scrollController,
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height
                  - MediaQuery.of(context).padding.top
                  - MediaQuery.of(context).padding.bottom, // SafeArea 높이
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                  vertical: 16.0),
              child: FormBuilder(
                autovalidateMode: AutovalidateMode.always,
                key: authKey,
                child: widget,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
}


