
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
          borderRadius: BorderRadius.circular(5),
          // color: Colors.grey.shade100,
        ),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: widget.children,
            ),
          ),
        ),
      ),
      actions: widget.actions,
    );
  }
}
