import 'package:calendar_project_240727/view_model/filted_instance_model/range_filted_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/formatter.dart';
import '../../../../repository/repository_import.dart';

part 'info_box_sub_provider.freezed.dart';
part 'info_box_sub_provider.g.dart';

@freezed
abstract class InfoBoxSubModel with _$InfoBoxSubModel {
  const factory InfoBoxSubModel({
    @Default(0.0) double total,
    @Default(0.0) double record,
    @Default(0) int workDay,
    @Default(0.0) double retire,
    @Default('0000년 00월 00일') String lastDate,
    @Default('00월') String lastMonth,

  }) = _InfoBoxSubModel;

  factory InfoBoxSubModel.fromJson(Map<String, dynamic> json) =>
      _$InfoBoxSubModelFromJson(json);
}



@riverpod
class InfoBoxSub extends _$InfoBoxSub {
  @override
  FutureOr<InfoBoxSubModel> build() async {
    final  history = ref.watch(viewHistoryProvider);

    final lastDate = switch (history) {
      AsyncData(:final value) when value.isNotEmpty =>
      value.reduce((a, b) => a.date.isAfter(b.date) ? a : b).date,
      _ => null,
    };

    if(lastDate != null){
      final start = DateTime(lastDate.year, lastDate.month, 1);
      final  end = DateTime(lastDate.year, lastDate.month + 1, 0);
      final  data = ref.watch(rangeSourceProvider(start,end));
      final  state = ref.read(rangeSourceProvider(start,end).notifier);

      return switch(data){
        AsyncData(:final value) => InfoBoxSubModel(
          total: state.totalPayRange.toDouble(),
          record: state.workRecodeRange,
          workDay: state.workDayRange,
          retire: 0.0,
          lastDate: formatDateInfoBox(lastDate),
          lastMonth: formatDateInfoBoxMonth(lastDate),
        ),
      AsyncError() || _ => InfoBoxSubModel(),
      };
    }
    return InfoBoxSubModel();
  }
}
