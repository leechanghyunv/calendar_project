

import 'package:freezed_annotation/freezed_annotation.dart';

part 'decimal_pay_model.freezed.dart';


@freezed
abstract class DecimalPayModel with _$DecimalPayModel {
  const factory DecimalPayModel({
    required String month,
    required String day,
    required int pay,
    required double decimal,
  }) = _DecimalPayModel;

}