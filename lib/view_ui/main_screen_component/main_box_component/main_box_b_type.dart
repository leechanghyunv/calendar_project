
import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/extentions/theme_extension.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';
import '../../../core/widget/toast_msg.dart';
import '../../../core/export_package.dart';
import '../../../view_model/period_filter_model/monthly_filter_model.dart';
import '../../../view_model/sqlite_model/history_model.dart';
import '../../../view_model/view_provider/is_galaxy_fold.dart';
import 'b_type_toggle_button.dart';
import 'component/main_box_component.dart';
import '../../screen/contract_setting_screen/component/number_picker_modal.dart';


class MainBoxBTypeContainer extends ConsumerStatefulWidget {
  MainBoxBTypeContainer({super.key});

  @override
  ConsumerState<MainBoxBTypeContainer> createState() => _MainBoxBTypeContainerState();
}

class _MainBoxBTypeContainerState extends ConsumerState<MainBoxBTypeContainer> {

  String payString = '0.0만원';
  String taxValue = '세율 0.0%';
  String afterTax = '세후 0.0만원';
  String percent = '0.0%';
  String month = '';
  int workDay = 0;
  int offDay = 0;

  @override
  Widget build(BuildContext context) {

    final data1 = ref.watch(monthRecordProvider(ref.selected));
    final data2 = ref.watch(monthRecordProvider(ref.selected));
    final data = ref.history;

    final appWidth = context.width;
    data1.whenData((val) {
      payString = val.totalPayString;
      afterTax = val.afterTax;
      taxValue = val.tax;
      percent = val.percent;
    });


    data2.whenData((val) {
      month = val.workRecord;
      workDay = val.workDay;
      offDay = val.offDay;
    });

    final isFold = ref.watch(isGalaxyFoldProvider);
    final isFoldValue = isFold.asData?.value ?? false;
    final isFlip = ref.watch(isGalaxyFlipProvider);
    final isFlipValue = isFlip.asData?.value ?? false;

    final ratio = context.height/context.width;
    final isWideRatio = ratio >= 1 && ratio < 1.5;
    final narrowRatio = ratio > 2;


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
      child: Container(
        height: isFoldValue && isWideRatio? 102.5 : 120,
        decoration: context.boxDecoration,
        child: Padding(
          padding:  EdgeInsets.symmetric(
            vertical: appWidth > 400 ? 10.0 : 8.0,
            horizontal: appWidth > 400 ? 10.0 : 8.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 5),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    // height: 40,
                    child: Consumer(
                        builder: (context,ref,widget){
                          final data = ref.history;
                          return data.maybeWhen(
                            data: (val){
                              final selectedData = val.where((e) => e.date.toUtc() == ref.selected).map((e) => e.memo);
                              if(selectedData.isEmpty || selectedData.join(', ').length == 0){
                                return TextWidget(
                                    ' ${ref.month}월 ${ref.day}일 메모기록이 없습니다',
                                    14, fontWeight: FontWeight.normal);
                              }
                              final value = selectedData.join(', ');
                              return TextWidget(
                                  ' $value',
                                  14, fontWeight: FontWeight.normal);
                            },
                            orElse: () => const Text(''),
                          );
                        }),
                  ),
                  Spacer(),
                  SwitchExample(),
                ],
              ),

              Spacer(),
              Row(
                children: [
                  CircularComponent(
                    backgroundColor: context.bTypeChipColor,
                    width: 85,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextWidget(payString, 13.5 ,color: context.textColor,fontWeight: FontWeight.w600),
                      ],
                    ),
                  ),
                  CircularComponent(
                    backgroundColor: context.bTypeChipColor,
                    width: 65,
                    child: TextWidget(month, 13.5 ,color: context.textColor,fontWeight: FontWeight.w600),


                  ),

                  Spacer(),
                  Consumer(
                      builder: (context,ref,widget){
                        final val = ref.history;
                    return  GestureDetector(
                      onTap: (){
                        HapticFeedback.selectionClick();
                        val.maybeWhen(
                            data: (val) async {
                              final selectedOne = val.where((e) => e.date.toUtc() == ref.selected);
                              if(selectedOne.isEmpty){
                                customMsg('${ref.selected.month}월 ${ref.selected.day}일 공수가 없습니다.');
                              }else{
                                await ref.read(deleteHistoryProvider(ref.selected));
                                await Future.delayed(const Duration(milliseconds: 50));
                                customMsg('${ref.selected.month}월 ${ref.selected.day}일 공수가 삭제되었습니다.');
                                ref.refreshState(context);
                              }
                            },
                            orElse: () => customMsg('삭제할 데이터가 없습니다.'));
                      },
                      child: Icon(Icons.remove),
                    );
                  }
                  ),
                  SizedBox(width: 12.5),
                  GestureDetector(
                      onTap: (){
                        HapticFeedback.selectionClick();
                        NumberPickerModal(context);
                      },
                      child: Icon(Icons.playlist_add)),
                  SizedBox(width: 7.5),
                ],
              ),
            ],
          ),
        ),
      ),
    );


  }



}

