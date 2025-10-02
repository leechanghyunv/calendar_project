import 'package:calendar_project_240727/core/export_package.dart';
import 'package:calendar_project_240727/view_ui/screen/range_history_screen/component/range_history_modal_component.dart';
import '../../theme_color.dart';


class DefaultScreen extends HookConsumerWidget {
  final Widget body;
  final List<Widget> buttom;

  const DefaultScreen({
    super.key,
    required this.body,
    required this.buttom,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: themeColor,
      endDrawer: _buildSettingsDrawer(context, ref),
      drawerScrimColor: Colors.black.withOpacity(0.4), // 기본값은 0.54 정도

      body: Center(
        child: body,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: LayoutBuilder(
        builder: (context, constraints) {
          // LayoutBuilder 안에서 안전하게 MediaQuery 사용
          final mediaQuery = MediaQuery.of(context);
          final appHeight = mediaQuery.size.height;
          final appWidth = mediaQuery.size.width;

          final double isSmall = Platform.isAndroid
              ? appHeight * 0.0125
              : appHeight * 0.0225;
          final double isBig = Platform.isAndroid
              ? appHeight * 0.008
              : appHeight * 0.028;

          return Transform.translate(
            offset: Offset(0, appWidth < 380 ? isSmall : isBig),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: buttom,
            ),
          );
        },
      ),
    );
  }

  Widget _buildSettingsDrawer(BuildContext context, WidgetRef ref) {
    return Drawer(
      // width: context.width * 0.5,
      backgroundColor: Colors.grey[50],
      child: Column(
        children: [

          // 메뉴 리스트
          Expanded(
            child: SafeArea(
              bottom: false,
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _buildMenuItem(
                    title: '근로기간 설정',
                    onTap: () {
                      Navigator.pop(context);
                      showRangeModal(context, ref);
                    },
                  ),

                  _buildMenuItem(
                    title: '근로조건 설정',

                    onTap: () {
                      // Navigator.pop(context);
                      // showBasicModal(context, false);
                    },
                  ),

                  _buildMenuItem(
                    title: '캘린더모드 변경',
                    subtitle: '메모기록 포함/제외',
                    onTap: () {
                      // Navigator.pop(context);
                      // ref.read(calendarSwitcherProvider.notifier).toggle();
                    },
                  ),

                  _buildMenuItem(
                    title: '기본공수 변경',
                    onTap: () {
                      // Navigator.pop(context);
                      // showDialog(
                      //   context: context,
                      //   builder: (context) => BasicSettingDialog(),
                      // );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

// 메뉴 아이템 위젯
  Widget _buildMenuItem({
    required String title,
    String? subtitle,

    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        subtitle: subtitle != null
            ? Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[500],
              fontWeight: FontWeight.bold,
            ),
          ),
        )
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onTap: onTap,
      ),
    );
  }

}


