import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import '../../../../core/export_package.dart';
import '../provider/additional_pay_provider.dart';

class AdditionalPayComponent extends HookConsumerWidget {

  final Widget widget;

  const AdditionalPayComponent(this.widget,
      {

      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final additionalController = useTextEditingController();
    final additionalFocus = useFocusNode();

    final openBox = ref.watch(additionalPayProvider);

    // ✅ openBox가 true로 변경될 때 focus 요청
    useEffect(() {
      if (openBox) {
        Future.delayed(const Duration(milliseconds: 200), () {
          additionalFocus.requestFocus();
        });
      }
      return null; // cleanup 불필요
    }, [openBox]);

    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: openBox ? 60 : 0,
          padding: openBox
              ? const EdgeInsets.symmetric(vertical: 8.0)
              : EdgeInsets.zero,
          child: openBox
              ? Container(
                  decoration: BoxDecoration(
                    color:
                        context.isDark ? Colors.black54 : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.grey.shade500,
                      width: 1.05,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: widget,
                  ),
                )
              : null,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
