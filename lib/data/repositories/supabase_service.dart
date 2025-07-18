import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../model/contract_model.dart';
import '../entities/pay_statistics.dart';
import '../entities/site_ratio.dart';

part 'supabase_service.g.dart';



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
        .select('pay, job')  // job도 함께 조회
        .neq('job', '')
        .neq('site', '');

    final pays = response.map<int>((item) => item['pay'] as int).toList();

    // job별 데이터 분류
    final electricPays = <int>[];
    final pipePays = <int>[];
    final ductPays = <int>[];

    for (final item in response) {
      final pay = item['pay'] as int;
      final job = item['job'] as String;

      if (job.startsWith('전기')) {
        electricPays.add(pay);
      } else if (job == '배관') {
        pipePays.add(pay);
      } else if (job == '덕트') {
        ductPays.add(pay);
      }
    }

    return _calculateStats(pays,electricPays, pipePays, ductPays);
  }

  // 특정 사이트만 통계
  Future<PayStatistics> getPayStatsBySite(String site) async {
    final response = await _supabase
        .from('user_statistics')
        .select('pay, job')  // job도 함께 조회
        .eq('site', site);

    final pays = response.map<int>((item) => item['pay'] as int).toList();

    // job별 데이터 분류
    final electricPays = <int>[];
    final pipePays = <int>[];
    final ductPays = <int>[];

    for (final item in response) {
      final pay = item['pay'] as int;
      final job = item['job'] as String;

      if (job.startsWith('전기')) {
        electricPays.add(pay);
      } else if (job == '배관') {
        pipePays.add(pay);
      } else if (job == '덕트') {
        ductPays.add(pay);
      }
    }

    return _calculateStats(pays,electricPays, pipePays, ductPays);
  }

  PayStatistics _calculateStats(
      List<int> pays,
      List<int> electricPays,
      List<int> pipePays,
      List<int> ductPays,
      ) {
    if (pays.isEmpty) return const PayStatistics();

    return PayStatistics(
      average: pays.reduce((a, b) => a + b) / pays.length,
      minimum: pays.reduce((a, b) => a < b ? a : b),
      maximum: pays.reduce((a, b) => a > b ? a : b),
      count: pays.length,
      electricAverage: electricPays.isEmpty
          ? 0.0
          : electricPays.reduce((a, b) => a + b) / electricPays.length,
      pipeAverage: pipePays.isEmpty
          ? 0.0
          : pipePays.reduce((a, b) => a + b) / pipePays.length,
      ductAverage: ductPays.isEmpty
          ? 0.0
          : ductPays.reduce((a, b) => a + b) / ductPays.length,
    );
  }


  Future<SiteRatio> getSiteRatio(String targetSite) async {
    final response = await _supabase
        .from('user_statistics')
        .select('site')
        .neq('site', '');

    final totalCount = response.length;
    final targetCount = response
        .where((item) => item['site'] == targetSite)
        .length;

    return SiteRatio(
      siteName: targetSite,
      count: targetCount,
      percentage: totalCount > 0 ? (targetCount / totalCount) * 100 : 0,
    );
  }


  Future<JobRatio> getJobRatio(String targetJob) async {
    final response = await _supabase
        .from('user_statistics')
        .select('job')
        .neq('job', '');

    final totalCount = response.length;

    // 전기직무 통합 처리하면서 카운트
    int targetCount = 0;
    for (final item in response) {
      String job = item['job'] as String;

      // 전기- 로 시작하는 것들 처리
      if (job.startsWith('전기-')) {
        job = '전기';
      }

      if (job == targetJob) {
        targetCount++;
      }
    }

    return JobRatio(
      jobName: targetJob,
      percentage: totalCount > 0 ? (targetCount / totalCount) * 100 : 0,
    );
  }


}

