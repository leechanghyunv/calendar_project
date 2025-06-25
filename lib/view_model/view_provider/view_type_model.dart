import 'package:calendar_project_240727/repository/view_controll/view_type_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/utils/view_type.dart';

part 'view_type_model.g.dart';

@riverpod
class ViewTypeModel extends _$ViewTypeModel {
  @override
  FutureOr<ViewType> build() async {
    return _getViewTypeValue();
  }

  Future<ViewType> _getViewTypeValue() async {
    final prefs = await ref.watch(viewTypeProvider.future);
    final value = await prefs.getSelectedType();
    return value;
  }


  Future<void> setViewTypeValue(ViewType type) async {
    final prefs = await ref.watch(viewTypeProvider.future);
    prefs.setSelectedType(type);
    state = AsyncValue.data(type);
  }

}
