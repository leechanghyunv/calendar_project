
import 'package:calendar_project_240727/base_app_size.dart';
import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/view_ui/screen/statistic_screen/component/function_chip.dart';
import '../../../core/widget/toast_msg.dart';
import '../../../view_model/filted_instance_model/filted_month_model.dart';
import '../../../core/export_package.dart';
import '../../../view_model/sqlite_model/history_model.dart';
import 'b_type_toggle_button.dart';
import 'component/main_box_component.dart';
import 'setting_component/number_picker_modal.dart';


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
    final data2 = ref.watch(monthRecordProvider(ref.selected));    final data = ref.history;

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


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
      child: Container(
        height: 135,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(
              vertical: appWidth > 400 ? 10.0 : 8.0,
            horizontal: appWidth > 400 ? 10.0 : 8.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    child: Consumer(
                        builder: (context,ref,widget){
                      final data = ref.history;
                      return data.maybeWhen(
                        data: (val){
                          final selectedData = val.where((e) => e.date.toUtc() == ref.selected).map((e) => e.memo);
                          if(selectedData.isEmpty || selectedData.join(', ').length == 0){
                            return  Text(
                              textScaler: TextScaler.noScaling,
                                ' ${ref.month}월 ${ref.day}일 메모기록이 없습니다',
                              style: TextStyle(fontSize: appWidth > 400 ? 15.5 : 14,

                              ),
                            );
                          }
                          final value = selectedData.join(', ');
                          return Text( ' $value',
                            textScaler: TextScaler.noScaling,
                            style: TextStyle(
                                fontSize: appWidth > 400 ? 15.5 : 14,
                                letterSpacing: 0.5),
                          );
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
                    backgroundColor: Colors.grey.shade100,
                    width: 85,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          textScaler: TextScaler.noScaling,
                          '$payString',
                          style: TextStyle(
                            fontSize: appWidth > 400 ? 14 : 13.5,

                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircularComponent(
                    backgroundColor: Colors.white,
                    width: 65,
                    child: Text(
                      textScaler: TextScaler.noScaling,
                      '$month',
                      style: TextStyle(
                        fontSize: appWidth > 400 ? 14 : 13.5,

                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  Spacer(),

                  Consumer(
                      builder: (context,ref,widget){
                        final val = ref.history;

                        return FunctionChip(
                          label: '삭제하기',
                          color: Colors.grey.shade100,
                          borderColor: Colors.grey.shade600,
                          textColor: Colors.grey.shade900,
                          onTap: () {
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
                    );
                  }),
                  SizedBox(width: 7.5),
                  FunctionChip(
                      label: '공수등록',
                      color: Colors.grey.shade100,
                      borderColor: Colors.grey.shade600,
                      textColor: Colors.grey.shade900,
                      onTap: (){
                        NumberPickerModal(context);
                      }),
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


