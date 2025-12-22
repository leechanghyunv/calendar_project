import '../../../../base_consumer.dart';
import '../../../../core/export_package.dart';
import '../../../../view_model/filted_instance_model/filted_month_model.dart';

class MonthPayDayPayPopup extends HookConsumerWidget {
  final double totalPay;
  final String payString;

  const MonthPayDayPayPopup(
      {super.key,
        required this.totalPay,
        required this.payString});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final data = ref.watch(monthRecordProvider(ref.selected));


    return PopupMenuButton(
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      itemBuilder: (BuildContext context) => [
      ],

    );
  }
}
