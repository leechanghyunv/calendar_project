import 'package:calendar_project_240727/repository/repository_import.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'model/contract_model.dart';

part 'supabase_service.g.dart';

@riverpod
SupabaseClient supabaseClient(ref) {
  return Supabase.instance.client;
}

@riverpod
Future<void> insertNote(ref, LabourCondition contract) async {

  final client = ref.read(supabaseClientProvider);
  await client.from('user_statistics').insert({
    'pay': contract.normal,     // normal -> pay로 매핑
    'tax': contract.tax,
    'subsidy': contract.subsidy,
    'site': contract.site,
    'job': contract.job,
  });
}