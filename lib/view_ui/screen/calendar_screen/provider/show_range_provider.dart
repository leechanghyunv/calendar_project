import '../../../../repository/repository_import.dart';

part 'show_range_provider.g.dart';

@riverpod
class ShowRangeState extends _$ShowRangeState {
  @override
   bool build() {
    return false;
  }

  void rangeState (){
    state = !state;

    if (state) {
      customMsg('기간 설정 후 공수 등록');
    } else {
      customMsg('지정된 날짜에 공수 등록');
    }

  }

}
