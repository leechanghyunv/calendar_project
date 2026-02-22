import '../../../../core/export_package.dart';



class StatisticsFilterModal extends HookConsumerWidget {
  const StatisticsFilterModal({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Row(
      children: [


        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: context.chipColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [

                  // TextWidget('infomation',13.5, context.width,
                  //     color: context.subTextColor),

                  Spacer(),
                  // Container(
                  //   width: 1,
                  //   height: 12,
                  //   margin: EdgeInsets.symmetric(horizontal: 8),
                  //   color: context.subTextColor,
                  // ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     // color: context.chipColor,
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 2.0),
                  //     child: TextWidget('작업현장 선택',13.5, context.width,
                  //         color: context.subTextColor),
                  //   ),
                  // ),
                  // Icon(Icons.keyboard_arrow_down_outlined,size: 15,),


                  // FunctionChip(
                  //     label: '작업현장을 선택해주세요',
                  //     color: context.chipColor,
                  //     borderColor: Colors.grey.shade600,
                  //     textColor: context.chipTextColor,
                  //     onTap: (){}),
                ],
              ),
            ),
          ),
        ),
        // Icon(Icons.notifications_none_outlined,color: Colors.grey.shade700,size: 25),
        // SizedBox(width: 15),

      ],
    );
  }
}
