import 'dart:io';

import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/view_model/history_model.dart';
import 'package:calendar_project_240727/view_model/view_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/utils/view_type.dart';
import '../../dialog/memo_decimal_dialog/memo_decimal_form.dart';

part 'main_box_setting_button.g.dart';

@riverpod
class SettingValue extends _$SettingValue {
  @override
  ViewType build() => ViewType.gongsu;

  void changeView(ViewType viewType) => state = viewType;
}

class SettingButton extends ConsumerStatefulWidget {
  const SettingButton({super.key});

  @override
  ConsumerState<SettingButton> createState() => _SettingButtonState();
}

class _SettingButtonState extends ConsumerState<SettingButton> {

  Color _backgroundColor = Colors.grey.shade200;
  double borderWidth = 0.75;

  @override
  Widget build(BuildContext context) {

    final appWidth = MediaQuery.of(context).size.width;

    TextStyle  getStyle = TextStyle(
      fontSize: 12,
      color: Colors.grey.shade900,
      fontWeight: FontWeight.w600,
    );

    return GestureDetector(
      onTap: (){
        setState(() => borderWidth = 1.25,);
      },

      child: Container(



        height: switch (appWidth) {
          > 450 => 26,
          > 420 => 25,
          > 400 => 24,
          _ => 22.5,
        },

        width: switch (appWidth) {
          > 450 => 53,
          > 420 =>  51.5,
          > 400 =>  50,
          _ => 48,
        },


        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1, blurRadius: 4, offset: const Offset(0, 2),
          ),
          ],
          border: Border.all(color: Colors.grey.shade800, width: borderWidth),
        ),
        child: PopupMenuButton<ViewType>(
          onSelected: (viewType) async {
            final controller = await ref.read(viewTypeModelProvider.notifier);
            switch (viewType) {
              case ViewType.memo:
                await controller.setViewTypeValue(ViewType.memo);
                customMsg('메모기록으로');
              case ViewType.amount:
                await controller.setViewTypeValue(ViewType.amount);
                customMsg('일당기록으로');
              case ViewType.gongsu:
                await controller.setViewTypeValue(ViewType.gongsu);
                customMsg('공수기록으로');
              case ViewType.and:
                print('View changed: 근무유형 직접등록');
                showDialog(
                    context: context,
                    builder: (context) => EnrollDialogWidget());
              case ViewType.more:
                ref.read(latestHistoryProvider);
                ref.refreshState(context);
                print('View changed: 이전공수 복사등록');
            }
          },
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          position: PopupMenuPosition.under,
          offset: const Offset(30, -325),
          padding: EdgeInsets.zero,
          child: Platform.isAndroid ? Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0),
              child: Row(
                children: [
                  Icon(Icons.settings,
                      size: appWidth > 450 ? 15.5 : 14,
                      color: Colors.grey.shade500),
                  Text(
                    '설정',
                    style: TextStyle(
                      shadows: [
                        Shadow(
                          blurRadius: 0.75,
                          color: Colors.grey,
                          offset: Offset(0.25, 0.25),
                        ),
                      ] ,
                      color: Colors.black,
                      fontSize: switch (appWidth) {
                        > 450 => 13,
                        > 420 => 12,
                        > 400 => 11.5,
                        _ => 11,
                      },
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ) :
          Center(
            child: Text(
              '⚙️설정',
              style: TextStyle(
                color: Colors.black,

                fontSize: switch (appWidth) {
                  > 450 => 13,
                  > 420 => 12,
                  > 400 => 11.5,
                  _ => 11,
                },

                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          itemBuilder: (context) => [
            PopupMenuItem<ViewType>(
              enabled: false,
              height: 64,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '공수표 형식 선택',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '달력상에 표시할 내용을 선택\n(공수, 일당, 메모)',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade500,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuItem<ViewType>(
              value: ViewType.memo,
              height: 40,
              child: _SettingBox('🚀 메모기록으로 보기', getStyle),
            ),
            PopupMenuItem<ViewType>(
              value: ViewType.amount,
              height: 40,
              child: _SettingBox('🔥 일당기록으로 보기', getStyle),
            ),
            PopupMenuItem<ViewType>(
              value: ViewType.gongsu,
              height: 40,
              child: _SettingBox('🎉 공수기록으로 보기', getStyle),


            ),
            const PopupMenuDivider(height: 15),  // Added divider here
            PopupMenuItem<ViewType>(
              value: ViewType.and,
              height: 40,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '👉 근무유형 직접 등록',
                          style: getStyle,
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '       메모기록 등록 가능',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            PopupMenuItem<ViewType>(
              value: ViewType.more,
              height: 40,
              child: _SettingBox('🎈 이전공수 복사 등록', getStyle),
            ),
          ],
        ),
      ),
    );
  }

  Widget _SettingBox(String msg, TextStyle getStyle) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          Text(msg, style: getStyle),
        ],
      ),
    );
  }
}