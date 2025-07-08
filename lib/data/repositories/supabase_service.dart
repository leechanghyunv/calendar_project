import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../model/contract_model.dart';
import '../entities/pay_statistics.dart';
import '../entities/site_ratio.dart';

part 'supabase_service.g.dart';

// @riverpod
// SupabaseClient supabaseClient(ref) {
//   return Supabase.instance.client;
// }
//
// @riverpod
// Future<void> insertNote(ref, LabourCondition contract) async {
//
//   final client = ref.read(supabaseClientProvider);
//   await client.from('user_statistics').insert({
//     'pay': contract.normal,     // normal -> pay로 매핑
//     'tax': contract.tax,
//     'subsidy': contract.subsidy,
//     'site': contract.site,
//     'job': contract.job,
//   });
// }


@riverpod
SupaBaseRepository supaBaseService(SupaBaseServiceRef ref) {
  return SupaBaseRepository(ref);
}

class SupaBaseRepository{
  final SupaBaseServiceRef _ref;
  final _supabase = Supabase.instance.client;

  SupaBaseRepository(this._ref);

  Future<void> insertNote( LabourCondition contract) async {

    await _supabase.from('user_statistics').insert({
      'pay': contract.normal,     // normal -> pay로 매핑
      'tax': contract.tax,
      'subsidy': contract.subsidy,
      'site': contract.site,
      'job': contract.job,
    });
  }

  // 전체 통계
  Future<PayStatistics> getAllPayStats() async {
    final response = await _supabase
        .from('user_statistics')
        .select('pay')
        .neq('job', '')
        .neq('site', '');


    final pays = response.map<int>((item) => item['pay'] as int).toList();
    return _calculateStats(pays);
  }

  // 특정 사이트만 통계
  Future<PayStatistics> getPayStatsBySite(String site) async {
    final response = await _supabase
        .from('user_statistics')
        .select('pay')
        .eq('site', site);

    final pays = response.map<int>((item) => item['pay'] as int).toList();
    return _calculateStats(pays);
  }

  PayStatistics _calculateStats(List<int> pays) {
    if (pays.isEmpty) return const PayStatistics();

    return PayStatistics(
      average: pays.reduce((a, b) => a + b) / pays.length,
      minimum: pays.reduce((a, b) => a < b ? a : b),
      maximum: pays.reduce((a, b) => a > b ? a : b),
      count: pays.length,
    );
  }


  Future<List<SiteRatio>> getSiteRatios() async {
    final response = await _supabase
        .from('user_statistics')
        .select('site')
        .neq('site', '');

    final sites = response.map<String>((item) => item['site'] as String).toList();
    final totalCount = sites.length;

    // 사이트별 카운트
    final Map<String, int> siteCountMap = {};
    for (final site in sites) {
      siteCountMap[site] = (siteCountMap[site] ?? 0) + 1;
    }

    // 비율 계산
    return siteCountMap.entries
        .map((entry) => SiteRatio(
      siteName: entry.key,
      count: entry.value,
      percentage: (entry.value / totalCount) * 100,
    ))
        .toList()
      ..sort((a, b) => b.percentage.compareTo(a.percentage)); // 비율 높은 순
  }


  Future<List<JobRatio>> getJobRatios() async {
    final response = await _supabase
        .from('user_statistics')
        .select('job')
        .neq('job', ''); // 빈 값 제외

    final jobs = response.map<String>((item) => item['job'] as String).toList();
    final totalCount = jobs.length;

    // 전기직무 통합 처리
    final processedJobs = jobs.map((job) {
      if (job.startsWith('전기-')) {
        return '전기';
      }
      return job;
    }).toList();

    // job별 카운트
    final Map<String, int> jobCountMap = {};
    for (final job in processedJobs) {
      jobCountMap[job] = (jobCountMap[job] ?? 0) + 1;
    }

    // 비율 계산
    return jobCountMap.entries
        .map((entry) => JobRatio(
      jobName: entry.key,
      percentage: (entry.value / totalCount) * 100,
    ))
        .toList()
      ..sort((a, b) => b.percentage.compareTo(a.percentage));
  }


}

