import '../../../../../core/export_package.dart';
import '../../../../../view_model/sqlite_model/contract_model.dart';

class JobListChip extends ConsumerWidget {
  final String? selectedValue;
  final ValueChanged<String> onSelected;

  const JobListChip({
    super.key,
    required this.selectedValue,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final jobList = ref.watch(viewContractProvider);

    return jobList.maybeWhen(
      data: (list) {
        final jobOnlyList = list.where((e) => e.job.isNotEmpty).toList();
        final options = jobOnlyList.map((e) => e.job).toSet().toList(); // 중복 제거

        return SizedBox(
          height: 26,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: options.length,
            itemBuilder: (context, index) {
              final job = options[index];
              final bool isSelected = selectedValue == job;

              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 0 : 5,
                  right: index == options.length - 1 ? 0 : 5,
                ),
                child: GestureDetector(
                  onTap: () => onSelected(job),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.grey.shade300 : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected ? Colors.grey.shade600 : Colors.grey.shade400,
                        width: isSelected ? 1.5 : 1.25,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 4,
                          offset: const Offset(2, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '#$job',
                        textScaler: TextScaler.noScaling,
                        style: TextStyle(
                          fontSize: height > 750 ? (width > 400 ? 14 : 13) : 11.5,
                          fontWeight: FontWeight.w900,
                          color: isSelected ? Colors.black : Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
      orElse: () => const SizedBox(),
    );
  }
}
