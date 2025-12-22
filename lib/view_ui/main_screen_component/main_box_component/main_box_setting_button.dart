import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/export_package.dart';
import '../../../core/utils/view_type.dart';
import '../../../core/widget/toast_msg.dart';
import '../../screen/user_statistics_screen/component/auth_modal_component.dart';
import '../../screen/contract_setting_screen/component/number_picker_modal.dart';
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
        HapticFeedback.selectionClick();
        setState(() => borderWidth = 1.25);
        if (ref.contract.value!.isEmpty) {
          customMsg('근로조건을 우선 입력해주세요');
          showBasicModal(context);
        } else {
          NumberPickerModal(context);
        }
      },

      child: Container(

        height: switch (appWidth) {
          > 450 => 26,
          > 420 => 25,
          > 400 => 24,
          _ => Platform.isAndroid ?  21.5 : 22.5,
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

        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            SvgPicture.asset(
            context.isDark ? 'assets/settings.svg' : 'assets/Setting.svg',
              width: switch (appWidth) {
                > 450 => 12.5,
                > 420 => 12,
                > 400 => 11.5,
                _ => 11,
              },
              colorFilter: context.isDark ? ColorFilter.mode(
                context.textColor,
                BlendMode.srcIn,
              ) : null,
            ),
                Text('️ 등록',
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                    color: context.textColor,
                    fontSize: switch (appWidth) {
                      > 450 => 12,
                      > 420 => 11.5,
                      > 400 => 11,
                      _ => 10.5,
                    },
                    fontWeight: Platform.isAndroid ? FontWeight.w800 :  FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
