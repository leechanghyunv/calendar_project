import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/widget/toast_msg.dart';
import '../../firebase_analytics.dart';
import '../../model/formz_memo_model.dart';
import '../../view_model/formz_memo_model.dart';



part 'formz_memo.g.dart';


@riverpod
class FormzMemoValidator extends _$FormzMemoValidator {

  String get memoError =>
      state.memoData.displayError?.toString() ?? ' 메모 열람방법은 설정 - 메모기록으로 보기';

  String get value => state.memoData.value;

  @override
  MemoForm build() {
    return const MemoForm(
        memoData: MemoInput.pure(),
        status: MemoFormzStatus.pure,
    );
  }

  Future<void> onChangeMemo(String val) async {
    print('onChangeMemo: ${state.status}');
    print(val);
    state = state.copyWith(
      memoData: MemoInput.dirty(val),
    status: Formz.validate([])
        ? MemoFormzStatus.invalid
        : MemoFormzStatus.submissionInProgress,
    );
  }

  Future<void> clearMemo() async {
    state = state.copyWith(
      memoData: const MemoInput.pure(),
      status: MemoFormzStatus.pure,
    );
  }


  void onSubmit(WidgetRef ref){

    try{
        final val = state.memoData.value;
        if (val.length < 2) {
          state = state.copyWith(status: MemoFormzStatus.invalid);
        } else {
          customMsg('메모가 저장되었습니다.\n근무유형을 선택해주세요');
          print('memoValueProvider: $val');

          ref.read(firebaseAnalyticsClassProvider.notifier).
          memoEvent({
            'memoEvent': 'memoEvent',
            'memo': val,
          });

          Future.delayed(const Duration(milliseconds: 250),() {
            state = state.copyWith(status: MemoFormzStatus.submissionSuccess);
          });
        }
    }catch(e) {
      state = state.copyWith(status: MemoFormzStatus.submissionFailure);
    }
  }


}
