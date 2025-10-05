import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/export_package.dart';

import '../../screen/range_history_screen/component/range_history_modal_component.dart';


Widget buildSettingsDrawer(BuildContext context, WidgetRef ref) {
  return Drawer(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
    ),
    width: context.width * 0.45,
    backgroundColor: Colors.grey[50],
    child: Column(
      children: [
        // 헤더 영역 (심플 & 미니멀)
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(40),
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "워크캘린더",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      // color: Colors.grey[50],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "앱 맞춤 옵션 관리",
                    style: TextStyle(
                      fontSize: 13,
                      // color: Colors.grey[200],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),


        // 메뉴 리스트
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            children: [
              _buildMenuItem(
                title: '근로기간 설정',
                onTap: () {},
              ),
              _buildMenuItem(
                title: '근로조건 설정',
                onTap: () {},
              ),
              _buildMenuItem(
                title: '캘린더모드 변경',
                subtitle: '메모기록 포함/제외',
                onTap: () {},
              ),
              _buildMenuItem(
                title: '기본공수 변경',
                onTap: () {},
              ),
            ],
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


