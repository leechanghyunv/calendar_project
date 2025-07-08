import '../../../../core/export_package.dart';
import '../../../../theme_color.dart';
import '../../user_statistics_screen/provider/construction_survey_provider.dart';
import '../provider/condition_list_provider.dart';
import 'auth_text.dart';
import 'box_comonent.dart';
import 'job_input_dialog.dart';
import 'list_component.dart';

class WorkTypeWrap extends HookConsumerWidget {
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onPressed;
  final GestureTapCallback? onTapSub;
  final void Function(String)? onTapMain;
  final FocusNode nodeFocus;

  WorkTypeWrap(
      {super.key,
      required this.nodeFocus,
      this.onSubmitted,
      this.onPressed,
      this.onTapMain,
      this.onTapSub});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(constructionSurveyProvider);

    final  surveyList = ref.read(constructionSurveyProvider.notifier);

    final List<String> surveyTypeList = surveyList.getCurrentWorkList();

    final inputValue = useState('');

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;


    return FormBuilderField<String>(
      name: 'work_type',
      focusNode: nodeFocus,
      builder: (FormFieldState<String?> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bigText('공종을 선택해주세요 ', height),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return WorkTypeDialog(
                            onChanged: (val) {
                              inputValue.value = val;
                            },
                            onSubmitted: (val) {
                              onSubmitted?.call(val);
                              field.didChange(val);
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                if (context.mounted &&
                                    nodeFocus.canRequestFocus) {
                                  nodeFocus.requestFocus();
                                }
                              });
                              ref
                                  .read(conditionListProvider.notifier)
                                  .updateCondition(1, val);
                            },
                            onPressed: () {
                              /// 등록버튼
                              onPressed?.call();
                              field.didChange(inputValue.value);
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                if (context.mounted &&
                                    nodeFocus.canRequestFocus) {
                                  nodeFocus.requestFocus();
                                }
                              });
                              ref.read(conditionListProvider.notifier).updateCondition(1, inputValue.value);
                            },
                          );
                        },
                      );
                    },
                    child: greyBox('직접입력', height,width),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      onTapSub?.call();
                      field.didChange('기타'); // ✅ 값 변경
                      nodeFocus.requestFocus(); // ✅ 텍스트필드에 포커스 이동
                      ref.read(conditionListProvider.notifier).updateCondition(1, '기타');
                    },
                    child: greyBox('넘어가기', height,width),
                  ),
                  SizedBox(width: 2.5),
                ],
              ),
            ),
            height > 750
                ? smallText('보기에 없다면 직접입력 해주세요', height)
                : SizedBox.shrink(),
            SizedBox(height: 15),
            Wrap(
              spacing: (width > 400 ? 3.0 : 2.0),
              runSpacing: (width > 400 ? 10.0 : 8.0),
              children: surveyTypeList.map((type) {
                final isSelected = field.value?.startsWith(type) ?? false;
                return GestureDetector(
                  onTapDown: (details) async {
                    if (subTypes.containsKey(type)) {
                      final selectedSub = await showMenu<String>(
                        context: context,
                        position: RelativeRect.fromLTRB(
                          details.globalPosition.dx,
                          details.globalPosition.dy,
                          details.globalPosition.dx,
                          details.globalPosition.dy,
                        ),
                        items: subTypes[type]!
                            .map((sub) => PopupMenuItem(
                                  value: '$type-$sub',
                                  child: Text(sub,
                                      textScaler: TextScaler.noScaling,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ))
                            .toList(),
                      );
                      if (selectedSub != null) {
                        field.didChange(selectedSub);
                        onTapMain?.call(selectedSub);
                        nodeFocus.requestFocus(); // ✅ 텍스트필드에 포커스 이동
                        ref.read(conditionListProvider.notifier).updateCondition(1, selectedSub);
                      }
                    } else {
                      field.didChange(type);
                      onTapMain?.call(type);
                      nodeFocus.requestFocus(); // ✅ 텍스트필드에 포커스 이동
                      ref.read(conditionListProvider.notifier).updateCondition(1, type);
                    }
                  },
                  child: Container(
                    height: height > 750 ? (width > 400 ? 30 : 25.5) : 24.5,
                    padding:
                        const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 5,
                        ),
                    decoration: BoxDecoration(
                      color:  isSelected
                              ? Colors.grey.shade200
                              : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color:  isSelected
                                ? Colors.black
                                : Colors.grey.shade700,
                        width: isSelected ? 1.55 : 0.35,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                       '#$type',
                      textScaler: TextScaler.noScaling,
                      style: TextStyle(
                        height: textHeight,
                        fontSize: height > 750 ? (width > 400 ? 14 : 13) : 12.5,
                        fontWeight: FontWeight.bold,
                        color:  (isSelected
                                ? Colors.black
                                : Colors.black),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
