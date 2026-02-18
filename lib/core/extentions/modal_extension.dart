import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:flutter/material.dart';

extension ModalExtension on BuildContext {
  Future<T?> showModal<T>({
    required Widget child,
    double? heightRatio,
    double Function(double screenHeight)? heightBuilder,
    bool showHandle = true,
    bool useRootNavigator = true,
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool enableDrag = true,
    Color? backgroundColor,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      useRootNavigator: useRootNavigator,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      // barrierColor: Colors.transparent,
      backgroundColor: backgroundColor ?? Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        side: isDark
            ? BorderSide(
                color: Theme.of(this).colorScheme.outline.withValues(alpha: 0.2),
                width: 1,
              )
            : BorderSide.none,
      ),
      builder: (context) {
        final screenHeight = MediaQuery.of(context).size.height;
        final modalHeight = heightBuilder?.call(screenHeight) ??
                           (screenHeight * (heightRatio ?? 0.8));

        return Container(
          height: modalHeight,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              if (showHandle)
                Container(
                  width: 30,
                  height: 4,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              Expanded(child: child),
            ],
          ),
        );
      },
    );
  }


  Future<T?> memoChipModal<T>({
    required Widget child,
    double? heightRatio,
    double Function(double screenHeight)? heightBuilder,
    bool showHandle = true,
    bool useRootNavigator = true,
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool enableDrag = true,
    Color? backgroundColor,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      useRootNavigator: useRootNavigator,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      barrierColor: Colors.black.withOpacity(0.1),
      backgroundColor: backgroundColor ?? Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        side: isDark
            ? BorderSide(
          color: Theme.of(this).colorScheme.outline.withValues(alpha: 0.2),
          width: 1,
        )
            : BorderSide.none,
      ),
      builder: (context) {
        final screenHeight = MediaQuery.of(context).size.height;
        final modalHeight = heightBuilder?.call(screenHeight) ??
            (screenHeight * (heightRatio ?? 0.8));

        return Container(
          height: modalHeight,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(width: 0.25, color: Colors.grey.shade300),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              if (showHandle)
                Container(
                  width: 30,
                  height: 4,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              Expanded(child: child),
            ],
          ),
        );
      },
    );
  }





}
