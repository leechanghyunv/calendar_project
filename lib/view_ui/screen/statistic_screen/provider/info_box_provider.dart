
import '../../../../repository/repository_import.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../repository/time/calculate_day.dart';
import '../../../../view_model/filted_instance_model/filted_source_total.dart';

part 'info_box_provider.freezed.dart';
part 'info_box_provider.g.dart';


@freezed
abstract class InfoBoxModel with _$InfoBoxModel {
  const factory InfoBoxModel({
    @Default(0.0) double total,
    @Default(0.0) double record,
    @Default(0) int workDay,
    @Default(0.0) double retire,
  }) = _InfoBoxModel;

  factory InfoBoxModel.fromJson(Map<String, dynamic> json) =>
      _$InfoBoxModelFromJson(json);
}

@riverpod
class InfoBox extends _$InfoBox {

  @override
  FutureOr<InfoBoxModel> build() async {
    final state =  ref.watch(workRecordProvider);

    final extraDay = ref.watch(calculateValueProvider);

    return switch(state){
      AsyncData(:final value) => InfoBoxModel(
        total: double.tryParse(value.totalPay.replaceAll('만원', '')) ?? 0.0,
        record: value.workRecord,
        workDay: value.workDay,
        retire: double.parse(
          ((value.workDay + extraDay) * 6200 / 10000).toStringAsFixed(1),
        ),
      ),
      AsyncError() || _ => const InfoBoxModel(),
    };
  }
}