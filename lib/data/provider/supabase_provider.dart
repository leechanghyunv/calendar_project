import 'dart:math';

import '../../repository/repository_import.dart';
import '../entities/electric_job_stats.dart';
import '../entities/pay_statistics.dart';
import '../entities/site_ratio.dart';
import '../repositories/supabase_service.dart';

part 'supabase_provider.g.dart';

@riverpod
class PayStatsNotifier extends _$PayStatsNotifier {
  @override
  Future<PayStatistics> build() async {
    final repository = ref.read(supaBaseServiceProvider);
    return await repository.getAllPayStats();
  }

  // UI에서 호출할 메서드들
  Future<void> showAllStats() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(supaBaseServiceProvider);
      return await repository.getAllPayStats();
    });
  }

  Future<void> showSiteStats(String siteName) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(supaBaseServiceProvider);
      return await repository.getPayStatsBySite(siteName);
    });
  }
}



@riverpod
class SiteRatioNotifier extends _$SiteRatioNotifier {

  final _sites = ['조선소', '하이테크', '플랜트', '일반현장'];

  @override
  Future<SiteRatio> build() async {
    final repository = ref.read(supaBaseServiceProvider);
    final randomSite = _sites[Random().nextInt(_sites.length)];
    return await repository.getSiteRatio(randomSite);
  }

  Future<void> fetchBySite(String site) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(supaBaseServiceProvider);
      return await repository.getSiteRatio(site);
    });
  }
}


@riverpod
class JobRatioNotifier extends _$JobRatioNotifier {

  final _job = ['전기', '덕트', '비계', '배관','용접'];

  @override
  Future<JobRatio> build() async {
    final repository = ref.read(supaBaseServiceProvider);
    final randomSite = _job[Random().nextInt(_job.length)];

    return await repository.getJobRatio(randomSite);
  }
}

@riverpod
class ElectricJobStatsNotifier extends _$ElectricJobStatsNotifier {
  @override
  Future<ElectricJobStats> build() async {
    final repository = ref.read(supaBaseServiceProvider);
    return await repository.getElectricJobStatsBySite('');
  }

  Future<void> fetchBySite(String site) async {
    state = const AsyncLoading();
    print('site $site');
    state = await AsyncValue.guard(() async {
      final repository = ref.read(supaBaseServiceProvider);
      return await repository.getElectricJobStatsBySite(site);
    });
  }
}

