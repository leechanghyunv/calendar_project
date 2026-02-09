
extension IntFormatX on int {
  String formatWithComma() {
    return toString().replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
            (m) => '${m[1]},'
    );
  }
}