import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'firebase_analytics_method.dart';
part 'firebase_analytics.g.dart';

class MemoStatus {
  static const String hasMemo = 'has_memo';
  static const String noMemo = 'no_memo';

  static String fromMemo(String? memo) {
    return (memo != null && memo.isNotEmpty) ? hasMemo : noMemo;
  }
}

@riverpod
class FirebaseAnalyticsClass extends _$FirebaseAnalyticsClass {

  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  String? _deviceId;
  bool _isDebugDevice = false;  // 디버그 기기 여부를 저장할 변수

  // 개발 기기 ID 목록
  final List<String> _debugDeviceIds = [
    dotenv.get('DEV_ID'),  // 제외할 iOS 기기 ID
  ];


/// 기대하는점 건설근로시장의 근로단가, 평균공수, 일비, 파악가능
  @override
  FirebaseAnalytics build() {

    _initDeviceId();
    return FirebaseAnalytics.instance;
  }

  Future<void> _initDeviceId() async {
    try {
      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        _deviceId = androidInfo.id;
        print('Android ID: ${_deviceId}');
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        _deviceId = iosInfo.identifierForVendor;
        print('IOS ID: ${_deviceId}');
      }

      // 디버그 기기 여부 확인
      _isDebugDevice = _debugDeviceIds.contains(_deviceId);
      if (_isDebugDevice) {
        print('Debug device detected: Analytics will be disabled');
        await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(false);
      } else {
        await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
      }
    } catch (e) {
      print('디바이스 ID 초기화 오류: $e');
    }
  }


  /// formz_model.dart
  Future<void> goalEvent(Map<String, dynamic> goalEvent) async {

    String formatMoney(dynamic amount) {
      if (amount == null || amount == '0') return '0원';
      final numericAmount = int.parse(amount.toString());
      return "${(numericAmount / 10000).toStringAsFixed(1)}만원";
    }

    final combinedInfo = [
      _deviceId == '7A589B20-5FF4-4216-B84B-29CB88414510' ?
      'developer' : 'customer'
      "목표: ${formatSpreadsheetMoney(goalEvent['goal'])}",
      "세금: ${goalEvent['tax']}",  // tax는 그대로 사용
      "주간: ${formatMoney(goalEvent['normal'])}",
      "연장: ${formatMoney(goalEvent['extend'])}",
      "야간: ${formatMoney(goalEvent['night'])}",
      "일비: ${formatMoney(goalEvent['day_pay'])}",
      "유형: ${formatMoney(goalEvent['site'])}",
      "공증: ${formatMoney(goalEvent['job'])}",
    ].join(' | ');

    state.logEvent(
        name: 'contract_form',
        parameters: {
          'contract_info': combinedInfo,
        }
    );
  }

/// history_model.dart
  Future<void> dailyEvent(Map<String, dynamic> dailyEvent) async {

    try{
      // 1. 모든 필드 추출 및 변환
      final double recode = (dailyEvent['recode'] as num).toDouble();
      final int pay = dailyEvent['pay'] as int;
      final String comment = dailyEvent['comment']?.toString() ?? 'no_comment';
      final String memo = dailyEvent['memo'] ?? '';  // 그대로 memo 사용

      // 2. 날짜 처리
      final date = DateTime.parse(dailyEvent['date']);
      final formattedDate = '${DateFormat('yy-MM-dd').format(date)} ${getWeekdayShort(date)}';

      // 3. 데이터 포매팅
      final formattedRecode = '${recode.toStringAsFixed(1)}공수';
      final formattedPay = '${(pay / 10000).toStringAsFixed(0)}만원';

      // 4. 결합된 데이터 생성
      final combinedData = [
        _deviceId == '7A589B20-5FF4-4216-B84B-29CB88414510' ? 'developer' : 'customer',
        formattedRecode,
        formattedPay,
        comment,
        formattedDate,
        memo                // 직접 memo 값 사용
      ].join(' | ');

      // 5. Firebase Analytics 이벤트 로깅
      await state.logEvent(
          name: 'dailyEvent',
          parameters: {
            'combined_info': combinedData,
          }
      );

    }catch(e){
      print('Error in dailyEvent: $e');
      print('Input recode value: ${dailyEvent['recode']}');
      print('Input recode type: ${dailyEvent['recode'].runtimeType}');
      rethrow;
    }


  }



  Future<void> autoCopyEvent() async {
    state.logEvent(name: 'autoCopyEvent');
  }

///formz_memo.dart
  Future<void> memoEvent(Map<String, dynamic> memoEvent) async {

    final memoStatus = [
      "memoEvent: ${memoEvent['memoEvent']}",
      "memo: ${memoEvent['memo']}",
    ];

    state.logEvent(name: 'memoEvent',
    parameters: {
      'memo_info' : memoStatus,
    });
  }
  /// back_up_dialog.dart

  Future<void> backupEvent(String backupEvent) async {
    state.logEvent(name: backupEvent);
  }



}
