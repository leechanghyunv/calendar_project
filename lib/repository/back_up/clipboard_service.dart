import '../repository_import.dart';
import 'archive_zlib_base64.dart';

part 'clipboard_service.g.dart';

@riverpod
class BackUpClipboardService extends _$BackUpClipboardService {

  @override
  AsyncValue<void> build() => AsyncValue.data(null);

  Future<String> getCompressedHistory() async {
    final history = ref.read(viewHistoryProvider);
    final val = history.valueOrNull;
    if (val == null || val.isEmpty) return '';

    final jsonString = jsonEncode(val.map((e) => e.toJson()).toList());
    return await ZlibBase64().compress(jsonString);
  }

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
        await Clipboard.setData(ClipboardData(text: output));
        customMsg('클립보드에 복사되었습니다.');
        // SharePlus.instance.share(
        //     ShareParams(text: output)
        // );
      }
    },
        error: (err,trace) => customMsg('공수 기록이 없습니다.'),
        loading: () => customMsg('loading....'));
  }





}
