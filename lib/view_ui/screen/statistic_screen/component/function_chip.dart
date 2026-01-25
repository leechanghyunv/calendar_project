import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/extentions/theme_color.dart';

class FunctionChip extends StatefulWidget {
  final String label;
  final Color color;
  final Color borderColor;
  final Color textColor;
  final VoidCallback? onTap;

  const FunctionChip({
    super.key,
    required this.label,
    required this.color,
    required this.borderColor,
    required this.textColor,
    required this.onTap,

  });

  @override
  State<FunctionChip> createState() => _FunctionChipState();
}

class _FunctionChipState extends State<FunctionChip> {

  bool isSelected = false;


  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      height: height > 750 ? (width > 400 ? 27 : 25) : width < 350 ? 21.5 : 24,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: widget.borderColor,
          width: isSelected
              ? 1.75
              : context.isDark ? 1.25 : 0.75,
        ),
        boxShadow: context.defaultShadow,
      ),
      child: GestureDetector(
        onTapDown: (_){
          setState(() {
            isSelected = true;
          });
        },
        onTap: (){
          widget.onTap?.call();
          setState(() {
            isSelected = false;
          });
        },
        child: TextWidget(widget.label, 13, context.width,color: widget.textColor),
      ),
    );
  }
}
