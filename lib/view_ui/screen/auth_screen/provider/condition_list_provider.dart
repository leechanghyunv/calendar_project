import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'condition_list_provider.g.dart';

@riverpod
class ConditionList extends _$ConditionList {
  @override
  List<String> build() => [];

  void updateCondition(int index, String? value) {
    final safeValue = value ?? '';

    String convertedValue = '';
    if (safeValue.isNotEmpty) {
      if (index == 3) {
        // 4번째 값: 15,000 → 1.5 변환
        final cleanValue = safeValue.replaceAll(',', '');
        final number = double.parse(cleanValue);
        convertedValue = (number / 10000).toStringAsFixed(1);
      } else {
        // 1,2,3번째 값: 그대로 사용
        convertedValue = safeValue;
      }
    }

    List<String> newList = List.from(state);

    if (index < newList.length) {
      newList[index] = convertedValue;
    } else {
      newList.add(convertedValue);
    }

    state = newList;
  }


}
