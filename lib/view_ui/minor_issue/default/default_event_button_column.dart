
import 'package:flutter/material.dart';

import '../widget/enroll_button.dart';

class Event_Form_Column extends StatefulWidget {
  final String subtitleA;
  final String subtitleB;
  final String subtitleC;
  final void Function()? onTapA;
  final void Function()? onTapB;
  final void Function()? onTapC;

  const Event_Form_Column({
    super.key,
    required this.subtitleA,
    required this.subtitleB,
    required this.subtitleC,
    this.onTapA,
    this.onTapB,
    this.onTapC,
  });

  @override
  State<Event_Form_Column> createState() => _Event_Form_ColumnState();
}

class _Event_Form_ColumnState extends State<Event_Form_Column> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        EnrollButton(
          iconUi: '🌟',
          title: '정상근무',
          subtitle: widget.subtitleA,
          onTap: widget.onTapA,
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
