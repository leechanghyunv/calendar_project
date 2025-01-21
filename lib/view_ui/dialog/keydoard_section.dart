
import 'package:flutter_animate/flutter_animate.dart';

import '../../core/export_package.dart';
import '../../core/widget/text_widget.dart';


KeyboardActionsItem createKeyboardItem({
  required FocusNode focusNode,
  required String text,
  required Function() onTap,
  required  double appWidth,
}) {
  return KeyboardActionsItem(
    focusNode: focusNode,
    toolbarButtons: [
          (node) => GestureDetector(
        onTap: onTap,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 12.0.sp),
          child: TextWidget2(
            text,
            14.sp,
            Colors.grey.shade700,
            appWidth,
          ).animate(
              onPlay: (controller) => controller.repeat(reverse: true)
          ).fadeOut(
              duration: 0.5.seconds,
              curve: Curves.easeInOut
          ),
        ),
      ),
    ],
  );
}

KeyboardActionsItem raactiveKeyboardItem({
  required FocusNode focusNode,
  required TextEditingController controller,
  required String text,
  required Function() onTap,
  required  double appWidth,
}){

  return KeyboardActionsItem(
      focusNode: focusNode,
    toolbarButtons: [
          (node) =>
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                          onTap: onTap,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: TextWidget2(
                              text,
                              14.sp,
                              Colors.grey.shade700,
                              appWidth,
                            )
                                .animate(
                  onPlay: (controller) => controller.repeat(reverse: true)
                            ).fadeOut(
                  duration: 0.5.seconds,
                  curve: Curves.easeInOut
                            ),
                          ),
                        ),
                ],
              ),
    ],
  );
}
