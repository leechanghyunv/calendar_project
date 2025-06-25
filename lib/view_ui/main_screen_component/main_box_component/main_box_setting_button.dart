import 'dart:io';

import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/utils/view_type.dart';
import '../../../view_model/sqlite_model/history_model.dart';
import '../../../view_model/view_provider/view_type_model.dart';
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
      fontSize: appWidth > 450 ? 14 : 12,
      color: Colors.grey.shade900,
      fontWeight: FontWeight.w600,
    );

    TextStyle  getSettingStyle = TextStyle(
      fontSize: appWidth > 450 ? 14 : 12,
      color: Colors.grey.shade900,
      fontWeight: FontWeight.w600,
    );

    return GestureDetector(
      onTap: (){
        setState(() => borderWidth = 1.25);
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
          boxShadow: [
            BoxShadow(
            color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
          ],
          border: Border.all(
              color: Colors.grey.shade800,
              width: borderWidth,
          ),
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
                showDialog(
                    context: context,
                    builder: (context) => EnrollDialogWidget());
              case ViewType.more:
                ref.read(latestHistoryProvider);
                ref.refreshState(context);
              // case ViewType.setting:
              //   showBasicModal(context);
            }
          },
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade100),
          ),
          position: PopupMenuPosition.under,
          offset: const Offset(30, -300),
          padding: EdgeInsets.zero,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Platform.isAndroid ? SvgPicture.asset(
                  'assets/Gear.svg',
                  width: switch (appWidth) {
                    > 450 => 14,
                    > 420 => 13,
                    > 400 => 12.5,
                    _ => 12,
                  },
                  colorFilter: ColorFilter.mode(
                    Colors.black,
                    BlendMode.srcIn,
                  ),
                  clipBehavior: Clip.antiAlias,
                ) : SizedBox.shrink(),
                Text( '️⚙️설정',
                  textScaler: TextScaler.noScaling,
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
              ],
            ),
          ),
          itemBuilder: (context) => [
            PopupMenuItem<ViewType>(
              enabled: false,
              height: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '공수표 형식 선택함',
                    textScaler: TextScaler.noScaling,
                    style: TextStyle(
                      fontSize: appWidth > 450 ? 15 : 12,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '달력상에 표시할 내용 선택\n(공수,일당,메모)',
                    textScaler: TextScaler.noScaling,
                    style: TextStyle(
                      fontSize: appWidth > 450 ? 13 : 11,
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
              child: _SettingBox('🚀 메모기록으로 보기','rocket', getStyle),
            ),
            PopupMenuItem<ViewType>(
              value: ViewType.amount,
              height: 40,
              child: _SettingBox('🔥 일당기록으로 보기','cuboid', getStyle),
            ),
            PopupMenuItem<ViewType>(
              value: ViewType.gongsu,
              height: 40,
              child: _SettingBox('🎉 공수기록으로 보기','zap', getStyle),


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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SettingBox('👉 근무유형 직접 등록','sparkle', getStyle),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '          0.5공수,0.25공수,휴무',
                          textScaler: TextScaler.noScaling,
                          style: TextStyle(
                            fontSize: appWidth > 450 ? 12 : 10,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.5,),
                  ],
                ),
              ),
            ),
            PopupMenuItem<ViewType>(
              value: ViewType.more,
              height: 40,
              child: _SettingBox('🎈 이전공수 복사 등록','flame', getStyle),
            ),
            // PopupMenuItem<ViewType>(
            //   value: ViewType.setting,
            //   height: 40,
            //   child: _SettingBox(' 근로조건 설정 하기','clover',isSetting: true,
            //       getSettingStyle),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _SettingBox(String msg,String svg, TextStyle getStyle,{bool? isSetting = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          Platform.isAndroid ? SvgPicture.asset(
            'assets/${svg}.svg',
            width: getStyle.fontSize,
            colorFilter: ColorFilter.mode(
              isSetting == false ? Colors.grey.shade600 : Colors.green.shade900,
              BlendMode.srcIn,
            ),
            clipBehavior: Clip.antiAlias,
          ) : SizedBox.shrink(),
          Text(
              textScaler: TextScaler.noScaling,
              msg, style: getStyle),
        ],
      ),
    );
  }
}