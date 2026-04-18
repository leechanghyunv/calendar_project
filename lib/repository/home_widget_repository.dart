
import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:home_widget/home_widget.dart';

/// HomeWidget.setAppGroupId('group.com.example.calendarproject2407');
/// iOSName: 'HomeWidget',
/// dadaKey: workCalendar_homeWidget

part 'home_widget_repository.g.dart';

@riverpod
class WidgetBridge extends _$WidgetBridge {

  static const _appGroupId = 'group.com.example.calendarproject2407';
  static const _iOSWidgetName = 'HomeWidget';

  @override
  void build() {
    HomeWidget.setAppGroupId(_appGroupId);
  }

  /// 공수데이터
  Future<void> saveWorkRecord(double days) async {
    await HomeWidget.saveWidgetData('workRecord', days);

  }

  /// 임금데이터
  Future<void> saveWage(int wage) async {
    await HomeWidget.saveWidgetData('wage', wage);

  }

  /// ✅ iOS/Android 위젯을 실제로 새로고침하는 명령
  Future<void> updateWidget() async {
    await HomeWidget.updateWidget(
      iOSName: _iOSWidgetName,
      // androidName: 'HomeWidgetProvider', // 안드로이드도 있다면 추가
    );
  }


}