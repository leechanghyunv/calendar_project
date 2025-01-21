import 'package:calendar_project_240727/view_ui/dialog/archive_dialog/goal_setting_dialog.dart';

import '../../../core/export_package.dart';
import '../../../theme_color.dart';

class AchiveContainer extends StatefulWidget {
  final String goalValue;
  final String goalRate;

  const AchiveContainer(
      {super.key, required this.goalValue, required this.goalRate});

  @override
  State<AchiveContainer> createState() => _AchiveContainerState();
}

class _AchiveContainerState extends State<AchiveContainer> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    return Container(
      constraints: BoxConstraints(
        maxWidth: appWidth * 0.6,
        minWidth: appWidth * 0.6,
      ),
      // width: appWidth * 0.6,
      height: 125,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '목표달성율',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                Icon(Icons.settings, color: Colors.grey.shade700, size: 17.5),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Text(
                  '${widget.goalRate}%',
                  style: TextStyle(
                    shadows: Platform.isAndroid ? [
                      Shadow(
                        blurRadius: 0.75,
                        color: Colors.grey,
                        offset: Offset(0.25, 0.25),
                      ),
                    ] : null,
                    height: textHeight,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                    fontSize: 34,
                  ),
                ),
                Spacer(),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Text(
                  '목표 ${widget.goalValue}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => GoalSettingDialog(),
                    );
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  child: goalSettingBox(isSelected: isSelected),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget goalSettingBox({bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey.shade300 : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.black, width: isSelected ? 0.5 : 0.75),
      ),
      child: Text(
        '목표 수정',
        style: TextStyle(
          fontSize: 12,
          height: textHeight,
          fontWeight: FontWeight.w700,
          color: Colors.grey.shade800,
        ),
      ),
    );
  }
}
