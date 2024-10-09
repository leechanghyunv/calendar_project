import 'package:calendar_project_240727/core/export.dart';



class ToggleWidget extends StatefulWidget {

  final void Function(int?)? onToggle;

  const ToggleWidget({super.key, this.onToggle});

  @override
  State<ToggleWidget> createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  @override
  Widget build(BuildContext context) {

    double ratio = MediaQuery.of(context).size.aspectRatio;
    double appHeight = MediaQuery.of(context).size.height;
    double appWidth = MediaQuery.of(context).size.width;
    double screenUtilSize(double size) {
      return Platform.isAndroid
          ? appWidth > 500? (size - 1.0).sp/2 : (size - 1.0).sp
          : appWidth > 500? size.sp/2 :  size.sp;
    }

    return ToggleSwitch(
      minWidth: appHeight < 700
          ? appWidth > 500 ? 37.5 : 75.0.w
          : appWidth > 500 ? 40.0.w :80.0.w,

      minHeight: appWidth < 500
          ? 35.w
          : (35.w)/2,

      initialLabelIndex: 0,
      cornerRadius: 20.0,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey.shade400,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      radiusStyle: true,
      customTextStyles: [
        TextStyle(
            fontSize: appHeight < 700
                ? appWidth > 500? 7.sp : 14.sp
                : screenUtilSize(15),

            fontWeight: FontWeight.bold,color: Colors.black),
        TextStyle(
            fontSize: appHeight < 700
                ? appWidth > 500? 7.sp : 14.sp
                : screenUtilSize(15),

            fontWeight: FontWeight.bold,color: Colors.black)],

      labels: const ['근로조건', '근무등록'],
      activeBgColors: [[Colors.blue.shade500],[Colors.blue.shade500]],
      onToggle: widget.onToggle,
    );
  }
}
