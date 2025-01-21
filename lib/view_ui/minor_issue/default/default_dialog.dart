
import 'package:calendar_project_240727/core/export_package.dart';

class DefaultDialog extends StatefulWidget {

  final List<Widget>? actions;
  final List<Widget> children;
  final Widget? title;

  const DefaultDialog({super.key,
    required this.children,
    this.actions, this.title});

  @override
  State<DefaultDialog> createState() => _DefaultDialogState();
}

class _DefaultDialogState extends State<DefaultDialog> {
  @override
  Widget build(BuildContext context) {

    final appWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      shape: ShapeBorder.lerp(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        10.0,
      ),
      title: widget.title,
      content: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(5),
        ),

        height: 265,
        width: appWidth > 500? 55.w : double.infinity,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: widget.children,
            ),
          ),
        ),
      ),
      actions: widget.actions,
    );
  }
}
