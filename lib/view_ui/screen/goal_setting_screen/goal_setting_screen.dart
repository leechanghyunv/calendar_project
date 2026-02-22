
import 'package:calendar_project_240727/view_ui/widgets/info_row.dart';

import '../../../base_app_size.dart';
import '../../../base_consumer.dart';
import '../../../core/export_package.dart';
import '../../../core/extentions/modal_extension.dart';
import '../../../core/extentions/theme_color.dart';
import '../../../core/widget/text_widget.dart';
import '../../../core/widget/toast_msg.dart';
import '../../../view_model/sqlite_model/contract_model.dart';
import '../../widgets/text_field_number_bar.dart';

void goalSettingModal(BuildContext context) {
  context.showModal(
    heightRatio: 0.425,
    child: GoalSettingScreen(),
  );
}

final boolProvider = StateProvider<bool>((ref) => false);

class GoalSettingScreen extends HookConsumerWidget {
  const GoalSettingScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final _controller = useTextEditingController();
    final _nodeFocus = useFocusNode();

    ref.contractForm;
    ref.formzWatch;
    final formZRead = ref.formzRead;

    useEffect(() {
      Future.microtask(() => ref.read(boolProvider.notifier).state = true);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _nodeFocus.requestFocus();
      });
      return null;
    }, []);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 8.0,horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 20),
              InfoRow(title: '목표금액 수정',subtitle: '목표금액이 화면에 반영됩니다'),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 8.0,horizontal: 8
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0),
                child: TextWidget(formZRead.goalError, 12.0,
                    context.width,color: context.subTextColor),
              ),
              SizedBox(height: 15),
              NumberFieldBar(
                controller: _controller,
                focusNode: _nodeFocus,
                hintText: '100,000,000',
                icon: Icons.check,
                onChanged: (val){
                  final cleanedValue = _controller.text.replaceAll(',', '');
                  formZRead.onChangeGoal(cleanedValue);
                },
                onPressed: (){
                  final cleanedValue = _controller.text.replaceAll(',', '');
                  final value = int.tryParse(cleanedValue);
                  if (value != null) {
                    ref.read(updateContractProvider(value));
                    ref.refreshState(context);
                  }
                  ref.read(boolProvider.notifier).state = false;
                  customMsg('목표금액이 변경되었습니다.');
                  Navigator.pop(context);
                },

              ),
            ],
          ),
        ),
      ),
    );
  }
}
