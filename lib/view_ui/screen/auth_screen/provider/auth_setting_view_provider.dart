import '../../../../repository/repository_import.dart';

part 'auth_setting_view_provider.g.dart';

@riverpod
class AuthSettingView extends _$AuthSettingView {

  @override
  void build() {}

  void scrollToBottom(ScrollController controller) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!controller.hasClients) return;
      controller.animateTo(
        controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    });
  }


}
