import '../../../../repository/repository_import.dart';

part 'additional_pay_provider.g.dart';

@riverpod
class AdditionalPay extends _$AdditionalPay {

  @override
   bool build() => false;

  void openBox() => state = !state;

}
