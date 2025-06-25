
import 'package:share_plus/share_plus.dart';
import 'package:super_clipboard/super_clipboard.dart';

import '../repository_import.dart';
import 'archive_zlib_base64.dart';

part 'clipboard_service.g.dart';

@riverpod
class BackUpClipboardService extends _$BackUpClipboardService {

  @override
  AsyncValue<void> build() => AsyncValue.data(null);

  Future<void> clipboardHistory() async {
    ref.read(firebaseAnalyticsClassProvider.notifier).backupEvent('Backup_Event');

    final history = ref.watch(viewHistoryProvider);

    history.when(data: (val) async {
      final histories = val;
      String jsonString = jsonEncode(histories.map((e) => e.toJson()).toList());
      final output = await ZlibBase64().compress(jsonString);

      if(histories.isEmpty){
        customMsg('공수 기록이 없습니다.');
      } else {
        copyJsonToClipboard(output);
        customMsg('클립보드에 복사되었습니다.');
        SharePlus.instance.share(
            ShareParams(text: output)
        );
      }

    },
        error: (err,trace) => customMsg('공수 기록이 없습니다.'),
        loading: () => customMsg('loading....'));
  }

}

Future<void> copyJsonToClipboard(String jsonString) async {

  try {
    final item = DataWriterItem();
    item.add(Formats.plainText(jsonString));
    await SystemClipboard.instance?.write([item]);

  } catch (e) {
    print('클립보드 복사 실패: $e');
    rethrow;
  }
}
