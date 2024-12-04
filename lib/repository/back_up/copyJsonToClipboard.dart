import 'dart:convert';

import 'package:super_clipboard/super_clipboard.dart';

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
