import 'package:fluttertoast/fluttertoast.dart';

import '../utils/converter.dart';

Future<bool?> initialMsg(String? amount) async => await
Fluttertoast.showToast(
    msg:'목표금액 $amount원 입력되었습니다.',
    gravity: ToastGravity.CENTER);

Future<bool?> showMsg(String pay,String? amount) async => await
Fluttertoast.showToast(
    msg:'$pay $amount가 입력되었습니다.',
    gravity: ToastGravity.CENTER);

Future<bool?> saveSettingMsg() async {

  await Fluttertoast.showToast(
      msg:'근로조건이 등록되었습니다.',
      gravity: ToastGravity.CENTER);
}

Future<bool?> settingErrorMsg() async => await
Fluttertoast.showToast(
    msg:'값을 모두 입력해주세요.',
    gravity: ToastGravity.CENTER);

Future<bool?> inputErrorMsg() async => await
Fluttertoast.showToast(
    msg:'근로조건을 다시 등록해주세요',
    gravity: ToastGravity.CENTER);

Future<bool?> ValueErrorMsg1(int val1, int val2) async => await
Fluttertoast.showToast(
    msg:'연장수당 ${formatAmount(val1)}이\n정상근무 수당${formatAmount(val2)}보다\n작거나 같습니다.\n\n다시 확인해주세요',
    gravity: ToastGravity.CENTER);

Future<bool?> ValueErrorMsg2(int val1, int val2) async => await
Fluttertoast.showToast(
    msg:'야간수당 ${formatAmount(val1)}이\n연장근무 수당${formatAmount(val2)}보다\n작거나 같습니다.\n\n다시 확인해주세요',
    gravity: ToastGravity.CENTER);

Future<bool?> pureStateErrorMsg() async => await
Fluttertoast.showToast(
    msg:'근로조건을 등록해주세요',
    gravity: ToastGravity.CENTER);

Future<bool?> enrollErrorMsg() async => await
Fluttertoast.showToast(
    msg:'근무유형을 선택해주세요',
    gravity: ToastGravity.CENTER);

Future<bool?> cancelMsg() async => await
Fluttertoast.showToast(
    msg:'취소되었습니다.',
    gravity: ToastGravity.CENTER);

Future<bool?> clearMsg() async => await
Fluttertoast.showToast(
    msg:'데이터를 모두 삭제합니다.',
    gravity: ToastGravity.CENTER);

Future<bool?> failureMsg() async => await
Fluttertoast.showToast(
    msg:'입력값 저장을 실패했습니다.',
    gravity: ToastGravity.CENTER);

Future<bool?> enrollMsg(DateTime day,String value) async => await
Fluttertoast.showToast(
    msg: '${day.month}월 ${day.day}일 $value 선택\n\n확인 버튼을 눌러주세요',
    gravity: ToastGravity.CENTER);

Future<bool?> enrollSaveMsg(DateTime day,String msg) async => await
Fluttertoast.showToast(
    msg: '${day.month}월 ${day.day}일 $msg로 저장되었습니다',
    gravity: ToastGravity.CENTER);