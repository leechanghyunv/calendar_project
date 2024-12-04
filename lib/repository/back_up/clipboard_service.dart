import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/widget/toast_msg.dart';
import '../../firebase_analytics.dart';
import '../../view_model/filted_source_model.dart';
import '../../view_ui/dialog/input_dialog/back_up_data/drop_down_value.dart';
import '../time/calendar_time_controll.dart';
import 'copyJsonToClipboard.dart';

part 'clipboard_service.g.dart';

@riverpod
class BackUpClipboardService extends _$BackUpClipboardService {

  @override
  AsyncValue<void> build() => AsyncValue.data(null);

  Future<void> clipboardHistory() async {
    ref.read(firebaseAnalyticsClassProvider.notifier).backupEvent('Backup_Event');
    final timeManager = ref.watch(timeManagerProvider);
    final combinedData = ref.watch(numericSourceModelProvider(timeManager.selected));
    final dropDownValue = ref.watch(dropDownValueProvider);

    combinedData.when(data: (val){
      final histories = val.history.where((e) => e.date.year == dropDownValue);
      String jsonString = jsonEncode(histories.
      map((e) => e.toJson()).toList());

      if(histories.isEmpty){
        customMsg('공수 기록이 없습니다.');
      } else {
        copyJsonToClipboard(jsonString);
        customMsg('$dropDownValue년 공수 기록이 복사되었습니다.');
      }

    },
        error: (err,trace) => customMsg('공수 기록이 없습니다.'),
        loading: () => showLoadingMsg());
  }

}
