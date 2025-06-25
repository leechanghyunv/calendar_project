import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'decimal_bool_repo.g.dart';


@riverpod
class DecimalBoolRepo extends _$DecimalBoolRepo {

  @override
  bool build() => true;

  void changeDecimalBool (bool){
    state = bool;
  }

}
