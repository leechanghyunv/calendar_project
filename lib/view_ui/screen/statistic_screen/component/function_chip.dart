import 'package:flutter/material.dart';

import '../../../../theme_color.dart';

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
      height: height > 750 ? (width > 400 ? 27 : 25) : 24,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: widget.borderColor,
          width: isSelected ? 1.75 : 0.75,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
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
        child: Text(
          widget.label,
          textScaler: TextScaler.noScaling,
          style: TextStyle(
            height: textHeight,

            fontSize: height > 750 ? (width > 400 ? 14.5 : (width < 370 ? 11.4 : 13)) : 12.5,
            fontWeight: FontWeight.bold,
            color: widget.textColor,
          ),
        ),
      ),
    );
  }
}
