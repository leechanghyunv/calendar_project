import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_dialog_extenstion.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';
import '../../../core/export_package.dart';
import '../../../core/utils/formatter.dart';
import '../../../core/widget/text_widget.dart';
import '../../../core/widget/toast_msg.dart';
import '../../../view_model/sqlite_model/contract_model.dart';
import '../../screen/statistic_screen/provider/info_box_provider.dart';
import '../dialog_text.dart';

class GoalSettingDialog extends HookConsumerWidget {

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final _controller = useTextEditingController();

    ref.contractForm;

    final appWidth = MediaQuery.of(context).size.width;
    final formzRefNot = ref.formzWatch;
    final formzRefread = ref.formzRead;



    return AlertDialog(
      backgroundColor:  context.dialogColor,
      shape: context.dialogShape,
      title: Column(
        children: [
          Row(
            children: [
              TextWidget('목표금액 수정', 17,appWidth,
                  color: context.textColor),
            ],
          ),
          SizedBox(height: 2.5),
          Row(
            children: [
              TextWidget('목표금액이 화면에 반영됩니다', 11,appWidth,
                  color: Colors.grey.shade500),
            ],
          ),
        ],
      ),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: context.isDark ? Colors.grey[900] : Colors.grey[100],
                border: Border.all(
                  color: Colors.grey.shade700,
                  width: 0.85,
                ),
                boxShadow: context.defaultShadow,
                borderRadius: BorderRadius.circular(7.5),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(5.0.w, 0.0, 0.0, 0.0),
                    child: SettingBox(
                      controller: _controller,
                      onChanged: (val) {
                        final cleanedValue = _controller.text.replaceAll(',', '');
                        formzRefread.onChangeGoal(cleanedValue);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 7.5),
            Consumer(
                builder: (context,ref,child){
                  ref.watch(viewContractProvider);
                  ref.watch(infoBoxProvider).whenData((d) => d).value ?? const InfoBoxModel();
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        TextWidget(formzRefread.goalError,
                          11,
                          appWidth,color: Colors.grey.shade500
                        ),
                        Spacer(),

                      ],
                    ),
                  );

                }
            ),


          ],
        ),
      ),

      actions: [
        Row(
          children: [
            Spacer(),
            TextButton(
              onPressed: () {
                customMsg('취소되었습니다.');
                Navigator.pop(context);
              },
              child: TextWidget('취소', 15,appWidth,
                  color: context.textColor),
            ),
            TextButton(
              onPressed: () {
                final cleanedValue = _controller.text.replaceAll(',', '');
                final value = int.tryParse(cleanedValue);
                if (value != null) {
                  ref.read(updateContractProvider(value));
                  ref.refreshState(context);
                }
                customMsg('목표금액이 변경되었습니다.');
                Navigator.pop(context);
                },

              child: TextWidget('수정', 15,appWidth,
                  color: context.textColor),
            ),
          ],
        )
      ],

    );

  }
}

class SettingBox extends ConsumerWidget {

  final void Function(String) onChanged;
  final TextEditingController controller;

  const SettingBox({super.key,required this.onChanged, required this.controller,});



  @override
  Widget build(BuildContext context,WidgetRef ref) {


    return TextFormField(
      controller: controller,

      autofocus: true,
      cursorColor: Colors.grey.shade500,
      keyboardType: TextInputType.number,
      inputFormatters: [
        CommaInputFormatter(),
      ],
      decoration: InputDecoration(
        isDense: true,
        border: InputBorder.none,
        hintText: '100,000,000',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: context.width.responsiveSize([14,14,14,13,12,11]),
        ),
        prefixText: '₩ ',
        prefixStyle: ContractFontStyle().
        copyWith(fontSize: context.width.responsiveSize([14,14,14,13,12,11])),
      ),
      onChanged: onChanged,


    );
  }
}


