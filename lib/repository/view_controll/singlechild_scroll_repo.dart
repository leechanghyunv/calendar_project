
import '../../core/export_package.dart';

final scrollControllerProvider = Provider.autoDispose((ref) {
  final controller = ScrollController();
  ref.onDispose(() => controller.dispose());
  return controller;
});

final scrollNotifierProvider = NotifierProvider.autoDispose<ScrollNotifier, void>(() {
  return ScrollNotifier();
});

class ScrollNotifier extends AutoDisposeNotifier<void> {
  @override
  void build() {}

  void scrollToBottom() {
    final controller = ref.read(scrollControllerProvider);
    controller.animateTo(
      controller.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void scrollToTop() {
    final controller = ref.read(scrollControllerProvider);
    controller.animateTo(
      0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
