import 'package:flutter/material.dart';

class WorkTypeDialog extends StatelessWidget {

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onPressed;

  const WorkTypeDialog({super.key, this.onChanged, this.onSubmitted, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('공증 입력',
                textScaler: TextScaler.noScaling,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              Icon(Icons.more_vert,
                color: Colors.grey.shade700,
                size: 20,
              ),
            ],
          ),
          const Text('유형에 없는 공증을 직접 입력해주세요',
            textScaler: TextScaler.noScaling,
            style: TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 11,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 45,
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.5)),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),

              ),
              onChanged: onChanged,
              onSubmitted: onSubmitted,
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: const Text('코킹, 위생 등등 기타 공증이 있다면 입력해주세요',
              textScaler: TextScaler.noScaling,
              style: TextStyle(
                fontSize: 11,
                color: Colors.black,
              ),
            ),
          ),









        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('취소',
            textScaler: TextScaler.noScaling,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            onPressed?.call();
            Navigator.of(context).pop();
          },
          child: const Text('등록',
            textScaler: TextScaler.noScaling,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 15,
              color: Colors.black,
            ),),
        ),
      ],
    );
  }
}
