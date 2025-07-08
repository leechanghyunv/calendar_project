import 'package:calendar_project_240727/base_consumer.dart';
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
      title: Column(
        children: [
          Row(
            children: [
              TextWidget('목표금액 수정', 17,appWidth),
            ],
          ),
          SizedBox(height: 2.5),
          Row(
            children: [
              TextWidget('목표금액이 화면에 반영됩니다', 11,appWidth,color: Colors.grey.shade500),
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
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(
                  color: Colors.grey.shade700,
                  width: 0.85,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
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

                  final contract = ref.watch(viewContractProvider);
                  final goal = (contract.value?.last.goal ?? 0).toStringAsFixed(0);
                  final goalInt = int.tryParse(goal) ?? 0;
                  // final goalValue = goalInt ~/ 10000;
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
              child: TextWidget('취소', 15,appWidth),
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

              child: TextWidget('수정', 15,appWidth),
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
          fontSize: 14,
        ),
        prefixText: '₩ ',
        prefixStyle: ContractFontStyle(),
      ),
      onChanged: onChanged,


    );
  }
}


