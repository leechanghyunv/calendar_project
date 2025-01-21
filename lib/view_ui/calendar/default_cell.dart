import 'package:calendar_project_240727/core/export_package.dart';


class DefaultCell extends StatelessWidget {

  final DateTime date;
  final Color textColor;

  const DefaultCell({super.key, required this.date, required this.textColor});

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(4.0.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0.r),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              '${date.day}',
              style: TextStyle(
                fontSize: switch (appWidth) {
                  > 450 => 18.5,
                  > 400 => 17,
                  _ => 16,
                },
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


