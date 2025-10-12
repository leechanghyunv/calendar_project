import 'dart:io';
import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/utils/view_type.dart';
import '../../../core/widget/toast_msg.dart';
import '../../screen/user_statistics_screen/component/auth_modal_component.dart';
import 'setting_component/number_picker_modal.dart';
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

  double borderWidth = 0.75;

  @override
  Widget build(BuildContext context) {

    final appWidth = context.width;

    return GestureDetector(
      onTap: (){
        setState(() => borderWidth = 1.25);
        if (ref.contract.value!.isEmpty) {
          customMsg('근로조건을 우선 입력해주세요');
          showBasicModal(context,false);
        } else {
          NumberPickerModal(context);
        }
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
          color: context.isLight ? Colors.grey.shade200 :  Colors.black54, // 드래그 중 색상 변경,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(context.isLight ? 0.2 : 0.1),
              spreadRadius: 1.5,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ] ,
          border: Border.all(
              color: Colors.grey.shade800,
              width: borderWidth,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Platform.isAndroid ? SvgPicture.asset(
                'assets/settings.svg',
                width: switch (appWidth) {
                  > 450 => 13,
                  > 420 => 12,
                  > 400 => 11.5,
                  _ => 11,
                },
                colorFilter: ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ),
                clipBehavior: Clip.antiAlias,
              ) : context.isDark ? SvgPicture.asset(
                'assets/settings.svg',
                width: switch (appWidth) {
                  > 450 => 13.5,
                  > 420 => 12.5,
                  > 400 => 12,
                  _ => 11.5,
                },
                colorFilter: ColorFilter.mode(
                  context.textColor,
                  BlendMode.srcIn,
                ),
                clipBehavior: Clip.antiAlias,
              ) : SizedBox.shrink(),
              Text(Platform.isAndroid ? '️ 등록' : context.isDark ?  '️ 등록' : '️⚙️등록',
                textScaler: TextScaler.noScaling,
                style: TextStyle(
                  color: context.textColor,
                  fontSize: Platform.isAndroid
                      ? switch (appWidth) {
                    > 450 => 14.5,
                    > 420 => 12.5,
                    > 400 => 12,
                    _ => 11.5,
                  } : context.isDark ? switch (appWidth) {
                    > 450 => 13.5,
                    > 420 => 11.5,
                    > 400 => 11,
                    _ => 10.5,
                  } :
                  switch (appWidth) {
                    > 450 => 14,
                    > 420 => 12,
                    > 400 => 11.5,
                    _ => 11,
                  },
                  fontWeight: Platform.isAndroid ? FontWeight.w700 :  FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
