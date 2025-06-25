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

        return Wrap(
          alignment: WrapAlignment.start,

          spacing: 10.0,
          runSpacing: 8.0,
          children: options.map((job) {
            final bool isSelected = selectedValue == job;

            return GestureDetector(
              onTap: () => onSelected(job),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: height > 750 ? 25 : 24,
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
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  '#$job',
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                    fontSize: height > 750 ? (width > 400 ? 14 : 13) : 11.5,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.black : Colors.grey.shade800,
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
      orElse: () => const SizedBox(),
    );
  }
}
