import 'dart:convert';
import 'package:archive/archive.dart';

class ZlibBase64 {
  Future<String> compress(String text) async {
    final data = utf8.encode(text);
    final compressed = ZLibEncoder().encode(data);
    return base64.encode(compressed);
  }

  Future<String> decompress(String text) async {
    final compressed = base64.decode(text);
    final data = ZLibDecoder().decodeBytes(compressed);
    return utf8.decode(data);
  }
}
