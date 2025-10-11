import 'package:calendar_project_240727/core/extentions/theme_color.dart';

import '../../../../core/export_package.dart';
import '../../../../data/usecases/supabase_provider.dart';

class StatisticsTotalRatio extends ConsumerWidget {
  const StatisticsTotalRatio({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    String siteName = '하이테크';
    String site_ratio = '00.0';
    String job = '전기';
    String job_ratio = '00.0';

    final ratiosAsync = ref.watch(siteRatioNotifierProvider);
    final jobRatiosAsync = ref.watch(jobRatioNotifierProvider);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    ratiosAsync.whenData((d) {
      siteName = d.siteName;
      site_ratio = d.percentage.toStringAsFixed(1);

    });

    jobRatiosAsync.whenData((d) {
      job = d.jobName;
      job_ratio = d.percentage.toStringAsFixed(1);

    });



    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text.rich(
            TextSpan(
              style: TextStyle(
                height: textHeight,
                fontSize: height > 800 ? 21 : 19,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: '${siteName}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,

                  ),
                ),
                TextSpan(text: ' 비율은 '),
                TextSpan(
                  text: '${site_ratio}%',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                TextSpan(text: ' 입니다.'),


              ],
            ),
          ),
        ),
        SizedBox(height: 5),
        Center(
          child: Text.rich(
              TextSpan(
                style: TextStyle(
                  height: textHeight,
                  fontSize: height > 800 ? 16 : 14.5,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: '${job}',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.75,
                      fontSize: height > 800 ? 17.5 : 15,
                    ),
                  ),
                  TextSpan(text: ' 공종은 ',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      letterSpacing: 0.75,
                    ),
                  ),
                  TextSpan(
                    text: '${job_ratio}%',
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 0.75,
                      fontSize: height > 800 ? 17.5 : 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  TextSpan(
                    text: ' 로 나타납니다',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      letterSpacing: 0.75,
                    ),
                  ),
                ]
              ),
          ),
        ),


      ],
    );
  }
}
