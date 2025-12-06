

import 'package:calendar_project_240727/core/export_package.dart';

import '../../../../core/extentions/theme_color.dart';

void textFieldModal(BuildContext context){
  showModalBottomSheet(
      useRootNavigator: true,
      isScrollControlled: true,
      context: context,
      isDismissible: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        side: context.isDark ? BorderSide(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          width: 1,
        ) : BorderSide.none,
      ),
      builder: (context){
        return Container(
          height: 75,
            child: WorksiteTextField());
      });
}


class WorksiteTextField extends StatelessWidget {
  const WorksiteTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextField(

        ),
      ),
    );
  }
}


