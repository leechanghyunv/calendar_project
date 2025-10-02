import '../../../../repository/repository_import.dart';

part 'popup_menu_provider.g.dart';

@riverpod
class PopupMenuOpen extends _$PopupMenuOpen {
  @override
  bool build() => false;

  void open() => state = true;
  void close() => state = false;
}
