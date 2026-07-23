import 'package:calendar_project_240727/core/extentions/theme_color.dart';
import 'package:calendar_project_240727/core/widget/text_widget.dart';

import '../../../../core/export_package.dart';
import '../../../../core/utils/converter.dart';
import '../../../../data/provider/string_list_provider.dart';
import 'package:intl/intl.dart';
import 'site_worker_tax_type.dart';

class RegistrationGuideText extends HookConsumerWidget {
  final List<TextEditingController> controllers;
  final ValueNotifier<int> guideIndex; // 👈 추가
  final ValueNotifier<bool> isOpen;
  final Future<void> Function()? onComplete;

  const RegistrationGuideText({
    super.key, required this.controllers,
    required this.guideIndex,
    required this.isOpen,
    this.onComplete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final selectedIndex = useState<int?>(null);

    String? parseAndFormat(String text) {
      final raw = int.tryParse(text.replaceAll(',', ''));
      if (raw == null) return null;
      return formatAmount(raw);
    }

    final currentIndex = useValueListenable(guideIndex);

    final t0 = useListenable(controllers[0]).text;
    final t1 = useListenable(controllers[1]).text;
    final t2 = useListenable(controllers[2]).text;
    final t3 = useListenable(controllers[3]).text;
    final texts = [t0, t1, t2, t3];

    final widgetTexts = [
      t0.length >= 2 ? '${texts[0]}' : '${texts[0]}',
      t1.length >= 5 ? parseAndFormat(t1) ?? t1 : t1,
      t2.length >= 2 ? '${texts[2]}%' : texts[2],
      t3.length >= 4 ? parseAndFormat(t3) ?? t3 : '',
    ];

    final sitesAsync = ref.watch(stringListNotifierProvider);
    final sites = sitesAsync.valueOrNull ?? [];

    return Row(
      crossAxisAlignment: .end,
      children: [
        for (int i = 0; i <= currentIndex; i++)
          AnimatedSize(
            duration: Duration(milliseconds: 300),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 400),
              opacity: texts[i].length >= 1 ? 1.0 : 0.0,
              child: texts[i].length >= 1
                  ? _StepWidget(text: widgetTexts[i])
                  : SizedBox.shrink(),
            ),
          ),

        if (currentIndex != 1 && currentIndex != 2) Spacer(),

        if (currentIndex == 1)
          if (!isOpen.value)
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Spacer(),
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        HapticFeedback.selectionClick();
                        isOpen.value = true;
                      },
                      child: _buttonWidget(text: '이전기록 불러오기'),
                    ),
                    SizedBox(height: 4.5),
                  ],
                ),
              ],
            ),
          ) else
            /// /// ///
            Expanded(
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    reverse: true,
                    itemCount: sites.length,
                    itemBuilder: (context, index){
                      final site = sites[index];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(4.5,4.5,0.0,4.5),
                        child: Row(
                          children: [
                            Spacer(),
                            GestureDetector(
                              onTap: () async {
                                HapticFeedback.selectionClick();
                                controllers[1].text = NumberFormat('#,###').format(site.pay);
                                controllers[2].text = site.tax.toString();
                                controllers[3].text = site.subsidy == 0 ? '' : NumberFormat('#,###').format(site.subsidy);
                                isOpen.value = false;
                                if (onComplete != null) {
                                  await onComplete!();
                                }
                              },
                              child: _buttonWidget(text: site.value),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),

        /// /// /// ///
        if (currentIndex == 2)
          Expanded(
            child: SiteWorkerTaxType(
              payController: controllers[1],
              taxController: controllers[2],
              selectedIndex: selectedIndex,
            ),
          ),

      ],
    );
  }
}

class _StepWidget extends StatelessWidget {
  final String text;
  const _StepWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0,6.0,8.0,12.0),
      child: Row(
        children: [
          TextWidget(text,13,color: context.subTextColor),
        ],
      ),
    );
  }
}

class _buttonWidget extends StatelessWidget {
  final String text;

  const _buttonWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.bTypeChipColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 6.0,horizontal: 8.0),
        child: TextWidget(text,13,color: context.subTextColor),
      ),
    );
  }
}
