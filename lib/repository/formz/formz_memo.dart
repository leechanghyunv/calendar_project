import '../repository_import.dart';

part 'formz_memo.g.dart';


@riverpod
class FormzMemoValidator extends _$FormzMemoValidator {

  String get memoError =>
      state.memoData.displayError?.toString() ?? ' 해당 날짜를 고르시면 메인 UI에서 확인 가능합니다';

  String get value => state.memoData.value;

  @override
  MemoForm build() {
    return const MemoForm(
        memoData: MemoInput.pure(),
        status: MemoFormzStatus.pure,
    );
  }

  Future<void> onChangeMemo(String val) async {
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
