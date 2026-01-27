import 'package:calendar_project_240727/view_ui/screen/contract_setting_screen/workSite/new_Site_registration.dart';
import '../../../base_app_size.dart';
import '../../../base_consumer.dart';
import '../../../core/export_package.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../core/widget/text_widget.dart';
import '../../../model/work_history_model.dart';
import '../../../repository/formz/formz_decimal.dart';
import '../../../view_model/sqlite_model/history_model.dart';
import '../../widgets/dual_field_bar.dart';
import '../../widgets/duration_select_module.dart';
import '../app_setting_screen/daily_pay_config/daily_pay_modal.dart';
import '../auth_screen/component/auth_modal_component.dart';
import '../initial_setting_screen/initial_setting_screen.dart';

class NewSettingScreen extends HookConsumerWidget {
  const NewSettingScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final isDuration = useState(false);
    final selectedDate = useState(DateTime.now());
    final endDate = useState(DateTime.now());

    final isActive = ref.watch(memoActiveProvider);
    final history = ref.watch(viewHistoryProvider);

    final initialMemo = history.maybeWhen(
      data: (histories) {
        final found = histories.firstWhere(
              (h) => h.date.year == ref.selected.year &&
              h.date.month == ref.selected.month &&
              h.date.day == ref.selected.day,
          orElse: () => WorkHistory(date: ref.selected), // 없으면 빈 값
        );
        return found.memo;
      },
      orElse: () => '',
    );

    final memoController = useTextEditingController(text: initialMemo);
    final decimalController = useTextEditingController();

    final decimalFocus = useFocusNode();
    final memoFocus = useFocusNode();

    final memoText = useListenable(memoController).text;

    // useEffect(() {
    //   ref.read(memoActiveProvider.notifier).state = false;
    //   return null;
    // }, []);

    ref.watch(formzDecimalValidatorProvider);
    ref.formzMemoWatch;
    ref.decimalWatch;

    // 🎯 날짜 변화 감지
    useEffect(() {
      Future.microtask(() {
        ref.rangeNot.updateStartDate(selectedDate.value);
        ref.rangeNot.updateEndDate(endDate.value);
      });

      return null;
    }, [selectedDate.value, endDate.value]);

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
                        DailyPayModal(context);
                      });
                    },
                    child: TextWidget(
                        '일비설정',
                        13.5,
                        context.width,
                        color: context.subTextColor
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 12,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    color: context.subTextColor,
                  ),
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.selectionClick();
                      Navigator.pop(context);
                      Future.microtask(() {
                        if (context.mounted) {
                          showBasicModal(context);
                        }
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
                selectedDate: selectedDate,
                endDate: endDate,
                isDuration: isDuration,
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
