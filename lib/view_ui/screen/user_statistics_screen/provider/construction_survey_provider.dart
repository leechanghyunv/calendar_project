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
        '전기', '비계', '토목','덕트', '칸막이', '철근', '타설', '설비', '도장',
        '소방','금속', '철골', '방수', '철거','인테리어', '기타'
      ],
      '하이테크': [
        '전기', '배관','덕트','칸막이','비계','타설', '판넬', '계장',
        '용접', '소방','셋업', '토목','기타'
      ],
      '플랜트': [
        '배관', '용접', '비계', '철골', '전기', '계장', '기계설치',
        '타설', '철근', '도장/방청', '방수','토목','기타'
      ],
      '조선소': [
        '전기', '용접', '취부', '선체도장', '그라인더', '조립', '사상',
        '비계','기타'
      ],
      '공통': [
        '전기','비계','용접','타설','칸막이','소방','철골',
        '덕트','토목','안전','화재감시','유도원','기타',
      ],
    };

    return workTypes[state.selectedType ?? '공통'] ?? [];
  }

}