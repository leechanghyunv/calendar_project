import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/widget/toast_msg.dart';
import '../../firebase_analytics.dart';
import '../../view_model/filted_source_model.dart';
import '../time/calendar_time_controll.dart';
import 'archive_zlib_base64.dart';
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

    combinedData.when(data: (val) async {
      final histories = val.history;
      String jsonString = jsonEncode(histories.map((e) => e.toJson()).toList());
      final output = await ZlibBase64().compress(jsonString);

      if(histories.isEmpty){
        customMsg('공수 기록이 없습니다.');
      } else {
        copyJsonToClipboard(output);
        customMsg('클립보드에 복사되었습니다.');
      }

    },
        error: (err,trace) => customMsg('공수 기록이 없습니다.'),
        loading: () => customMsg('loading....'));
  }

}
