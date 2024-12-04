import 'dart:async';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewManager {
  static final ReviewManager _instance = ReviewManager._internal();
  factory ReviewManager() => _instance;
  ReviewManager._internal();

  static const String _tapCountKey = 'secret_tap_count';
  static const String _lastTapTimeKey = 'last_tap_time';
  static const String _firstReviewDoneKey = 'first_review_done';
  static const String _secondReviewDoneKey = 'second_review_done';

  final InAppReview inAppReview = InAppReview.instance;
  SharedPreferences? _prefs;
  Timer? _resetTimer;
  int _tapCount = 0;
  bool _initialized = false;

  Future<void> init() async {
    if (!_initialized) {
      try {
        _prefs = await SharedPreferences.getInstance();
        await _loadTapCount();
        _initialized = true;
      } catch (e) {
        print('ReviewManager 초기화 오류: $e');
        _tapCount = 0;
      }
    }
  }

  Future<void> _loadTapCount() async {
    try {
      final lastTapTime = _prefs?.getInt(_lastTapTimeKey) ?? 0;
      final now = DateTime.now().millisecondsSinceEpoch;

      if (now - lastTapTime > 3000) {
        await _resetTapCount();
      } else {
        _tapCount = _prefs?.getInt(_tapCountKey) ?? 0;
      }
    } catch (e) {
      print('탭 카운트 로드 오류: $e');
      _tapCount = 0;
    }
  }

  Future<void> _saveTapCount() async {
    await _prefs?.setInt(_tapCountKey, _tapCount);
    await _prefs?.setInt(_lastTapTimeKey, DateTime.now().millisecondsSinceEpoch);
  }

  Future<void> _resetTapCount() async {
    _tapCount = 0;
    await _prefs?.setInt(_tapCountKey, 0);
  }

  Future<void> _requestReview() async {
    final firstReviewDone = _prefs?.getBool(_firstReviewDoneKey) ?? false;
    final secondReviewDone = _prefs?.getBool(_secondReviewDoneKey) ?? false;

    if (_tapCount == 30 && !firstReviewDone) {
      if (await inAppReview.isAvailable()) {
        await inAppReview.requestReview();
        await _prefs?.setBool(_firstReviewDoneKey, true);
      }
    } else if (_tapCount == 60 && !secondReviewDone) {
      if (await inAppReview.isAvailable()) {
        await inAppReview.requestReview();
        await _prefs?.setBool(_secondReviewDoneKey, true);
      }
    }
  }

  Future<void> handleTap() async {
    if (!_initialized) {
      await init();
    }
    _resetTimer?.cancel();
    _tapCount++;
    try {
      await _saveTapCount();
      if (_tapCount == 30 || _tapCount == 60) {
        await _requestReview();
      }
      if (_tapCount >= 60) {
        await _resetTapCount();
      }
      _resetTimer = Timer(const Duration(seconds: 3), () {
        if (_tapCount > 0) {
          print('3초 동안 탭이 없어 카운트가 리셋됩니다.');
          _resetTapCount();
        }
      });
    } catch (e) {
      print('탭 처리 오류: $e');
    }
  }

  void dispose() {
    _resetTimer?.cancel();
  }
}
