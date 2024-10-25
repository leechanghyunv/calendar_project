
import 'package:calendar_project_240727/core/export.dart';
import 'package:flutter/material.dart';

import '../widget/enroll_button.dart';

class Event_Form_Column extends StatefulWidget {
  final GlobalKey buttonKey;
  final String subtitleA;
  final String subtitleB;
  final String subtitleC;
  final void Function()? onTapA;
  final void Function()? onTapB;
  final void Function()? onTapC;
  // final GlobalKey buttonKey;

  const Event_Form_Column({
    super.key,
    required this.buttonKey,
    required this.subtitleA,
    required this.subtitleB,
    required this.subtitleC,
    this.onTapA,
    this.onTapB,
    this.onTapC,
    // required this.buttonKey,
  });

  @override
  State<Event_Form_Column> createState() => _Event_Form_ColumnState();
}

class _Event_Form_ColumnState extends State<Event_Form_Column> {
  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: 100.w,
          height: appHeight > 700 ? 55.h : 60.h,
          child: Showcase(
            key: widget.buttonKey,
            targetPadding: const EdgeInsets.all(0),
            description: '👉 근무유형을 선택 후에',
            descTextStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            blurValue: 1.5,
            child: EnrollButton(
              iconUi: '🌟',
              title: '정상근무',
              subtitle: widget.subtitleA,
              onTap: widget.onTapA,
            ),
          ),
        ),
        EnrollButton(
          iconUi: '🚀',
          title: '연장근무',
          subtitle: widget.subtitleB,
          onTap: widget.onTapB,
        ),
        EnrollButton(
          iconUi: '🎉',
          title: '야간근무',
          subtitle: widget.subtitleC,
          onTap: widget.onTapC,
        ),
      ],
    );
  }
}
