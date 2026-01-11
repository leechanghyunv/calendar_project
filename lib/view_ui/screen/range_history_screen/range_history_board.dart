
import '../../../base_app_size.dart';
import '../../../core/export_package.dart';

class RangeHistoryBoard extends HookConsumerWidget {
  final Widget header;
  final List<Widget> children;
  final Widget? floatingActionButton;

  const RangeHistoryBoard({
    super.key,
    required this.header,
    required this.children,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Center(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 12.0,
                      ),
                      child: Column(
                        children: [
                          context.height > 750
                              ? SizedBox(height: context.width > 400 ? 20 : 15)
                              : SizedBox(height: 2.5),
                          SizedBox(height: context.width > 400 ? 15 : 10),
                          header,
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification is ScrollStartNotification) {
                    FocusScope.of(context).unfocus();
                  }
                  return false;
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 12.0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: children,
                    ),
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: floatingActionButton,
        ),
      ),
    );
  }
}