import 'package:calendar_project_240727/view_ui/screen/contract_setting_screen/workSite/new_Site_registration.dart';
import '../../../base_app_size.dart';
import '../../../core/export_package.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../core/widget/text_widget.dart';
import '../../widgets/dual_field_bar.dart';
import '../../widgets/duration_select_module.dart';
import '../../widgets/svg_imoji.dart';
import '../user_statistics_screen/component/auth_modal_component.dart';

class NewSettingScreen extends HookConsumerWidget {
  const NewSettingScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final memoController = useTextEditingController();
    final decimalController = useTextEditingController();

    final decimalFocus = useFocusNode();
    final memoFocus = useFocusNode();

    final memoText = useListenable(memoController).text;

    final isDuration = useState(false);
    final selectedDate = useState(DateTime.now());
    final endDate = useState(DateTime.now());

    final isActive = ref.watch(memoActiveProvider);

    // useEffect(() {
    //   ref.read(memoActiveProvider.notifier).state = false;
    //   return null;
    // }, []);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: context.height > 750 ? 24.0 : 12.0, horizontal: 24.0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              NewSiteRegistration(),

              SizedBox(height: 10),
              Divider(
                color: Theme.of(context).dividerColor,
                thickness: 1,
              ),
              DurationSelectModule(
                isDuration: isDuration,
                selectedDate: selectedDate,
                endDate: endDate,
              ),

              SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    children: [
                      TextWidget(
                          '메모기록',
                          14,
                          context.width,
                          color: context.subTextColor
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          ref.read(memoActiveProvider.notifier).state = !isActive;
                          HapticFeedback.selectionClick();
                        },
                        child: Icon(
                          fontWeight: FontWeight.bold,
                          size: 17.5,
                          Icons.add,
                          color: context.subTextColor,
                        ),
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                  if (memoText.isNotEmpty)
                    SizedBox(height: 15),
                  Row(
                    children: [
                      TextWidget(
                          memoText,
                          13.5,
                          context.width,
                          color: context.subTextColor
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(
                color: Theme.of(context).dividerColor,
                thickness: 1,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      HapticFeedback.selectionClick();
                      Navigator.pop(context);
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        showBasicModal(context);
                      });
                    },
                    child: TextWidget(
                         '공수조건변경',
                        13.5,
                        context.width,
                        color: context.subTextColor
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
              

            ],
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              DualFieldBar(
                // selectedDate: selectedDate,
                // endDate: endDate,
                textController: memoController,
                decimalController: decimalController,
                textFocusNode: memoFocus,
                decimalFocusNode: decimalFocus,

              ),
            ],
          ),
        ),

      ),
    );

  }
}
