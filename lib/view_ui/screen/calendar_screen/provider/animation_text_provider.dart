import '../../../../repository/repository_import.dart';

part 'animation_text_provider.g.dart';

@riverpod
class AnimationTextProvider extends _$AnimationTextProvider {
  @override
  bool build() => true;

  void stateChange() => state = false;
}
