
import 'package:flutter/material.dart';

import '../../update_dialog/enroll_button.dart';

class Event_Form_Column extends StatelessWidget {
  final String subtitleA;
  final String subtitleB;
  final String subtitleC;
  final void Function()? onTapA;
  final void Function()? onTapB;
  final void Function()? onTapC;

  Event_Form_Column({
    super.key,
    required this.subtitleA,
    required this.subtitleB,
    required this.subtitleC,
    this.onTapA,
    this.onTapB,
    this.onTapC,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        EnrollButton(
          iconUi: '🌟',
          title: '정상근무',
          subtitle: subtitleA,
          onTap: onTapA,
        ),
        EnrollButton(
          iconUi: '🚀',
          title: '연장근무',
          subtitle: subtitleB,
          onTap: onTapB,
        ),
        EnrollButton(
          iconUi: '🎉',
          title: '야간근무',
          subtitle: subtitleC,
          onTap: onTapC,
        ),
      ],
    );
  }
}
