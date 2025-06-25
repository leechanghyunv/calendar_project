import '../../../../repository/repository_import.dart';

part 'pay_list_provider.g.dart';

@riverpod
class PayList extends _$PayList {
  @override
  List<String> build() => [];

  void update(int index, String? value) {
    print('update index: $index, value: $value');
    final safeValue = value ?? '';

    String convertedValue = '';

    if (safeValue.isNotEmpty) {
      final cleanValue = safeValue.replaceAll(',', '');
      final number = double.parse(cleanValue); // tryParse → parse

      // 10,000으로 나누고 소수점 한 자리로 표시
      convertedValue = (number / 10000).toStringAsFixed(1);
    }

    List<String> newList = List.from(state);

    // 해당 인덱스 위치에 값 설정
    if (index < newList.length) {
      newList[index] = convertedValue; // 기존 값 수정
    } else {
      newList.add(convertedValue); // 새로운 값 추가
    }
    state = newList;
  }

}
