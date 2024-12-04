import '../../../core/export_package.dart';
import '../../../core/widget/text_widget.dart';

class DeleteButton extends StatefulWidget {
  final String imoji;
  final String title;
  final void Function()? onTap;

  const DeleteButton(
      {super.key, required this.imoji, required this.title, this.onTap});

  @override
  State<DeleteButton> createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton> {
  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    final appHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.fromLTRB(
          appWidth > 500 ? 0 : 10.0.w,
          4.0.h,
          appWidth > 500 ? 0 : 10.0.w,
          4.0.h),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              widget.onTap!();
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: appHeight > 700 ? 50.h : 60.h,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey.shade700,
                ),
              ),
              child: Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: TextWidget(widget.imoji, 15, appWidth),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextWidget(widget.title, 14, appWidth),
                  ),
                  SizedBox(width: appWidth > 500 ? 7.5.w : 15.w),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
