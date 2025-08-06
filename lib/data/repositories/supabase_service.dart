import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../model/contract_model.dart';
import '../entities/electric_job_stats.dart';
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
    final scaffoldPays = <int>[];
    final partitionPays = <int>[];
    final weldingPays = <int>[];  // 용접 🔥
    final facilityPays = <int>[]; // 설비 ⚙️

    for (final item in response) {
      final pay = item['pay'] as int;
      final job = item['job'] as String;

      if (job.startsWith('전기')) {
        electricPays.add(pay);
      } else if (job == '배관') {
        pipePays.add(pay);
      } else if (job == '덕트') {
        ductPays.add(pay);
      } else if (job == '비계') {
        scaffoldPays.add(pay);
      } else if (job == '칸막이') {
        partitionPays.add(pay);
      } else if (job == '용접') {
        weldingPays.add(pay);
      } else if (job == '설비') {
        facilityPays.add(pay);
      }
    }

    return _calculateStats(
        pays,
        electricPays,
        pipePays,
        ductPays,
        scaffoldPays,
        partitionPays,
        weldingPays,
        facilityPays);
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
    final scaffoldPays = <int>[];
    final partitionPays = <int>[];
    final weldingPays = <int>[];  // 용접 🔥
    final facilityPays = <int>[]; // 설비 ⚙️


    for (final item in response) {
      final pay = item['pay'] as int;
      final job = item['job'] as String;

      if (job.startsWith('전기')) {
        electricPays.add(pay);
      } else if (job == '배관') {
        pipePays.add(pay);
      } else if (job == '덕트') {
        ductPays.add(pay);
      } else if (job == '비계') {
        scaffoldPays.add(pay);
      } else if (job == '칸막이') {
        partitionPays.add(pay);
      } else if (job == '용접') {
        weldingPays.add(pay);
      } else if (job == '설비') {
        facilityPays.add(pay);
      }
    }

    return _calculateStats(
        pays,
        electricPays,
        pipePays,
        ductPays,
        scaffoldPays,
        partitionPays,
        weldingPays,
        facilityPays);
  }

  PayStatistics _calculateStats(
      List<int> pays,
      List<int> electricPays,
      List<int> pipePays,
      List<int> ductPays,
      List<int> scaffoldPays,
      List<int> partitionPays,
      List<int> weldingPays,
      List<int> facilityPays,
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
      scaffoldAverage: scaffoldPays.isEmpty
          ? 0.0
          : scaffoldPays.reduce((a, b) => a + b) / scaffoldPays.length,
      partitionAverage: partitionPays.isEmpty
          ? 0.0
          : partitionPays.reduce((a, b) => a + b) / partitionPays.length,
      weldingAverage: weldingPays.isEmpty
          ? 0.0
          : weldingPays.reduce((a, b) => a + b) / weldingPays.length,
      facilityAverage: facilityPays.isEmpty
          ? 0.0
          : facilityPays.reduce((a, b) => a + b) / facilityPays.length,
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

  Future<ElectricJobStats> getElectricJobStatsBySite(String site) async {
    final response = await _supabase
        .from('user_statistics')
        .select('pay, job')
        .eq('site', site);

    // 필요한 job만 필터링
    final targetJobs = ['전기-포설', '전기-트레이', '전기-내선,단말', '전기-기타'];
    final filteredResponse = response.where((item) =>
        targetJobs.contains(item['job'] as String)
    ).toList();

    // 각 직종별 pay 리스트
    final poselPays = <int>[];
    final trayPays = <int>[];
    final innerLineTerminalPays = <int>[];

    final etcPays = <int>[];

    // ✅ filteredResponse를 사용해야 합니다!
    for (final item in filteredResponse) {
      final pay = item['pay'] as int;
      final job = item['job'] as String;

      switch (job) {
        case '전기-포설':
          poselPays.add(pay);
          break;
        case '전기-트레이':
          trayPays.add(pay);
          break;
        case '전기-내선,단말':
          innerLineTerminalPays.add(pay);
          break;
        case '전기-기타':
          etcPays.add(pay);
          break;
      }
    }

    return ElectricJobStats(
      site: site,
      poselAverage: _calculateAverage(poselPays),
      trayAverage: _calculateAverage(trayPays),
      innerLineTerminalAverage: _calculateAverage(innerLineTerminalPays),
      etcAverage: _calculateAverage(etcPays),
    );
  }

}

double _calculateAverage(List<int> values) {
  if (values.isEmpty) return 0.0;
  return values.reduce((a, b) => a + b) / values.length;
}

