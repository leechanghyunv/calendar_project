import '../../../core/export_package.dart';
import '../../../data/usecases/supabase_provider.dart';

void showElectricJobStatsDialog(BuildContext context, WidgetRef ref, String site) async {

  if (!context.mounted) return; // context가 여전히 유효한지 확인

  showDialog(
    context: context,
    builder: (context) => Consumer(
      builder: (context, ref, _) {
        final statsAsync = ref.watch(electricJobStatsNotifierProvider);

        return AlertDialog(
          content: statsAsync.maybeWhen(
            data: (stats) {
              print('Dialog stats: $stats'); // 디버깅용
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('현장: ${stats.site}'),
                  Text('포설: ${stats.poselAverage.toStringAsFixed(0)}원'),
                  Text('트레이: ${stats.trayAverage.toStringAsFixed(0)}원'),
                  Text('내선,단말: ${stats.innerLineTerminalAverage.toStringAsFixed(0)}원'),
                  Text('기타: ${stats.etcAverage.toStringAsFixed(0)}원'),
                ],
              );
            },
            loading: () => CircularProgressIndicator(),
            orElse: () => Text('데이터 없음'),
          ),
        );
      },
    ),
  );
}