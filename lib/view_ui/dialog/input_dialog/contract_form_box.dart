import '../../../core/export_package.dart';
import '../../../repository/view_controll/singlechild_scroll_repo.dart';

class ContractFormBox extends ConsumerWidget {

  final Widget child;

  const ContractFormBox({super.key, required this.child});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final scrollController = ref.watch(scrollControllerProvider);
    final appWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      controller: scrollController,
      child: Container(
        height: appWidth > 500? 375.sp/2 : 375.sp,
        width: appWidth > 500? 55.w : double.infinity,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: child,
        ),

      ),
    );
  }
}
