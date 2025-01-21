import 'package:calendar_project_240727/base_consumer.dart';
import 'package:calendar_project_240727/core/export_package.dart';
import '../../../core/widget/toast_msg.dart';
import '../../../view_model/history_model.dart';

class DeleteChip extends ConsumerStatefulWidget {
  const DeleteChip({super.key});

  @override
  ConsumerState<DeleteChip> createState() => _DeleteChipState();
}

class _DeleteChipState extends ConsumerState<DeleteChip> {

  double borderWidth = 0.75;

  @override
  Widget build(BuildContext context) {

    final data = ref.history;
    final appWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
        setState(() {
          borderWidth = 1.25;
        });
        data.when(data: (val) async {
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
            error: (err,trace){},
            loading: (){},
        );
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
          color: Colors.grey.shade200, // 드래그 중 색상 변경
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(color: Colors.grey.shade800, width: borderWidth),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.5),
          child: Platform.isAndroid ? Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0),
              child: Row(
                children: [
                  Icon(Icons.delete,
                      size: appWidth > 450 ? 15.5 : 14,
                      color: Colors.grey.shade500),
                  Text(
                    '삭제',
                    style:  TextStyle(
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
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          )
          : Center(
            child: Text(
              '🗑삭제',
              style:  TextStyle(
                  color: Colors.black,
                  fontSize: switch (appWidth) {
                    > 450 => 13,
                    > 420 => 12,
                    > 400 => 11.5,
                    _ => 11,
                  },
                  fontWeight: FontWeight.w900),


            ),
          ),
        ),
      ),
    );
  }
}
