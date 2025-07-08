import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'construction_survey_provider.freezed.dart';
part 'construction_survey_provider.g.dart';

@freezed
abstract class ConstructionSurveyState with _$ConstructionSurveyState {
  const factory ConstructionSurveyState({
    @Default(null) String? selectedType,
    @Default(null) String? selectedWork,
    @Default(0) int currentStep,
  }) = _ConstructionSurveyState;
}


@riverpod
class ConstructionSurvey extends _$ConstructionSurvey {
  @override
  ConstructionSurveyState build() {
    return ConstructionSurveyState();
  }
  void selectConstructionType(String type) {
    state = state.copyWith(
      selectedType: type,
      selectedWork: null,  // 🔄 하위 단계 리셋
      currentStep: 1,
    );
  }

  // 📝 2단계: 작업 선택
  void selectWork(String work) {
    state = state.copyWith(
      selectedWork: work,
      currentStep: 2,
    );
  }

  // 🔄 리셋
  void reset() {
    state = const ConstructionSurveyState();
  }

  List<String> getCurrentWorkList() {
    final workTypes = {
      '일반현장': [
        '토목','덕트', '철근', '타설', '판넬', '설비', '전기', '비계', '도장',
        '유리', '소방', '위생','형틀목','금속', '철골', '수장', '방수',
        '철거','인테리어','신호수', '기타'
      ],
      '하이테크': [
        '판넬', '칸막이','덕트', '배관', '에폭시', '전기', '계장', '비계',
        '용접', '양중', '소방','타설','셋업', '토목','화재감시','신호수',
        '안전','기타'
      ],
      '플랜트': [
        '배관', '용접', '비계', '철골', '전기', '계장', '기계설치',
        '타설', '철근', '도장/방청', '방수','토목',
        '신호수', '안전','화재감시','유도원','기타'
      ],
      '조선소': [
        '용접', '취부', '선체도장', '그라인더', '조립', '사상',
        '전기', '비계', '신호수', '안전','화재감시','유도원','기타'
      ],
      '공통': [
        '전기','비계','용접','타설','수장','소방','철골',
        '덕트','토목','신호수','안전','화재감시','유도원','기타',
      ],
    };

    return workTypes[state.selectedType ?? '공통'] ?? [];
  }

}