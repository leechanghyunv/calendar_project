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
import '../../widgets/svg_imoji.dart';
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

  double _getSize(double appWidth, {required List<double> sizes}) {
    if (appWidth > 450) return sizes[0];
    if (appWidth > 420) return sizes[1];
    if (appWidth > 400) return sizes[2];
    return sizes[3];
  }

  double borderWidth = 0.75;

  @override
  Widget build(BuildContext context) {

    final appWidth = context.width;

    final height = _getSize(appWidth, sizes: [26, 25, 25, Platform.isAndroid ? 21.5 : 22.5]);
    final iconSize = _getSize(appWidth, sizes: [14, 12.5, 12.5, 11]);
    final fontSize = _getSize(appWidth, sizes: [14, 12.5, 12, 10.5]);

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

        height: height,

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
          padding: const EdgeInsets.symmetric(horizontal: 7.0,vertical: 1.0),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgImoJi(
                  nameLight: 'Setting',
                  nameDark: 'settings',
                  width: iconSize,
                ),
                Text('️ 등록',
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                    color: context.textColor,
                    fontSize: fontSize,
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
