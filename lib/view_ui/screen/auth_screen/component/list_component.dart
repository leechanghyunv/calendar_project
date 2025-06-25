import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

final List<Map<String, dynamic>> sites = [
  {'name': '하이테크', 'icon': Icons.memory},
  {'name': '조선소', 'icon': MdiIcons.crane},
  {'name': '플랜트', 'icon': MdiIcons.factoryIcon},
  {'name': '일반현장', 'icon': MdiIcons.officeBuilding},
];

final Map<String, List<String>> subTypes = {
  '전기': ['포설', '트레이', '내선,단말','기타'],
};