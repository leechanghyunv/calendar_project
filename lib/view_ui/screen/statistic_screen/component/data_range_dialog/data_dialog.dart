// import 'package:calendar_project_240727/repository/repository_import.dart';
// import '../../../../../view_model/sqlite_model/selected_model.dart';
//
// class DataDialog extends HookConsumerWidget {
//    DataDialog({super.key});
//
//   @override
//   Widget build(BuildContext context,WidgetRef ref) {
//
//     final boxMemoController = useTextEditingController();
//     final dateRange = useState<List<DateTime>?>(null);
//     final selectedTax = useState<double>(3.3); // 세율 상태 추가
//     final selected = useState('');
//
//
//     Widget DataDialogWidget(String text,double size,bool isBold){
//       return Text(text,textScaler: TextScaler.noScaling,
//         style: TextStyle(
//           fontWeight: isBold ? FontWeight.w900 : null,
//           fontSize: size,
//           color: isBold ? Colors.black : Colors.grey,
//         ),
//       );
//     }
//
//
//     return AlertDialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       content: SizedBox(
//         width: double.maxFinite,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 15),
//
//             Column(
//               children: [
//                 SizedBox(height: 15),
//                 Row(
//                   children: [
//                     SizedBox(width: 10),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//
//           },
//           child: const Text('취소',
//             textScaler: TextScaler.noScaling,
//             style: TextStyle(
//               fontWeight: FontWeight.w900,
//               fontSize: 15,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         TextButton(
//           onPressed: () {
//             if (dateRange.value == null) {
//               customMsg('기간을 선택해주세요.');
//               return;
//             }
//             ref.read(addSelectedProvider(
//                 dateRange.value![0],
//                 dateRange.value![1],
//                 (selectedTax.value/100),
//                 boxMemoController.text,
//                 selected.value
//             ).future
//             );
//             Navigator.of(context).pop();
//             customMsg('선택하신 기간이 저장되었습니다.');
//           },
//           child: DataDialogWidget('저장', 15, true),
//         ),
//       ],
//     );
//   }
// }
