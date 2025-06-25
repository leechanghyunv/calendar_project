import 'package:flutter/material.dart';

class RangeMemoField extends StatelessWidget {

  final TextEditingController boxMemoController;

  const RangeMemoField({super.key, required this.boxMemoController});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: 75,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade800,
          width: 0.85,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            controller: boxMemoController,
            cursorColor: Colors.grey.shade700,
            decoration: InputDecoration(
              hintText: ' 업체명, 현장명 입력',
              hintStyle: TextStyle(
                  fontSize: (width > 400 ? 15 : 14),
              ),
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            ),


          ),
        ],
      ),

    );
  }
}
