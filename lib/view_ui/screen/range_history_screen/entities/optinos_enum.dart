enum ChipAction {
  delete('선택기간삭제'),
  save('저장후보관'),
  tax('세율설정'),
  exit('나가기');

  final String label;
  const ChipAction(this.label);
}