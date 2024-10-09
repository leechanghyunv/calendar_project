import 'package:calendar_project_240727/core/export.dart';
import '../../../core/utils/converter.dart';
import '../../../core/widget/text_widget.dart';

class EnrollButton extends StatefulWidget {
  final String iconUi;
  final String title;
  final String subtitle;

  final void Function()? onTap;

  const EnrollButton(
      {super.key,
        this.onTap,
        required this.iconUi,
        required this.title,
        required this.subtitle,
        });

  @override
  State<EnrollButton> createState() => _EnrollButtonState();
}

class _EnrollButtonState extends State<EnrollButton> {

  // Color containerColor = Colors.grey.shade700;  // 초기 색상은 투명
  //
  // void updateColor() {
  //   // 버튼이 눌릴 때 색상을 변경
  //   setState(() {
  //     containerColor = Colors.purple.shade700;  // 색상을 grey로 변경
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.fromLTRB(
          appWidth > 500 ? 5.0.w : 10.0.w,
          4.0.h,
          appWidth > 500 ? 5.0.w : 10.0.w,
          4.0.h),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        // color: containerColor,
        child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: (){
              //  updateColor();
                widget.onTap!();
              },
              child: Container(
                width: 100.w,
                height: 50.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.shade700,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextWidget(widget.iconUi,
                          15, appWidth),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child:
                      TextWidget(widget.title, 15, appWidth),
                    ),

                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextWidget('${numberWithCommas(widget.subtitle)}원',
                          15,
                          appWidth),
                    ),
                    SizedBox(width: appWidth > 500 ? 7.5.w : 15.w),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
