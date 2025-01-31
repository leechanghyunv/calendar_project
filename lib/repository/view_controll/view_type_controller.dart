import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/view_type.dart';

part 'view_type_controller.g.dart';


@riverpod
Future<ViewTypeController> viewType(ViewTypeRef ref) async {
  final prefs = await SharedPreferences.getInstance();
  return ViewTypeController(prefs);
}

class ViewTypeController {
  final SharedPreferences prefs;
  static const String _viewTypeKey = 'selected_view_type';

  ViewTypeController(this.prefs);

  Future<ViewType> getSelectedType() async {
    final String? savedType = prefs.getString(_viewTypeKey);

    switch (savedType) {
      case 'gongsu':
        return ViewType.gongsu;
      case 'amount':
        return ViewType.amount;
      case 'memo':
        return ViewType.memo;
      default:
        return ViewType.gongsu;
    }
  }

  Future<void> setSelectedType(ViewType type) async {
    if (type != ViewType.gongsu &&
        type != ViewType.amount &&
        type != ViewType.memo) {
      return;
    }

    await prefs.setString(_viewTypeKey, type.name);
  }
}