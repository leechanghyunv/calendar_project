import '../repository/repository_import.dart';

part 'decimal_value_provider.g.dart';

@riverpod
class DecimalRawInput extends _$DecimalRawInput {
  @override
  double build() => 0.0;

  void update(double value) {
    // print('update: ${value}');
    state = value;
  }
}