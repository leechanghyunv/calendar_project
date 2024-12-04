import 'package:calendar_project_240727/core/export_package.dart';
import '../../../core/utils/converter.dart';
import '../../dialog/dialog_text.dart';

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

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.fromLTRB(
          appWidth > 500 ? 5.0.w : 10.0.w,
          4.0.h,
          appWidth > 500 ? 5.0.w : 10.0.w,
          4.0.h),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: (){
                widget.onTap!();
              },
              child: Container(
                width: 100.w,
                height: appHeight > 700 ? 50.h : 55.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.shade700,
                  ),
                ),
                child: Row(
                  children: [
                    PaddedEnrollText(
                      text: widget.iconUi,
                      padding: const EdgeInsets.all(8.0),  // 8.0 패딩 지정
                    ),
                    PaddedEnrollText(
                      text: widget.title,
                    ),
                    const Spacer(),
                    PaddedEnrollText(
                      text: '${numberWithCommas(widget.subtitle)}원',
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
