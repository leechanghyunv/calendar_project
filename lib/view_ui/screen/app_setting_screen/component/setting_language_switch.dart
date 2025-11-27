import 'package:calendar_project_240727/core/widget/toast_msg.dart';

import '../../../../base_app_size.dart';
import '../../../../core/export_package.dart';
import '../../../../core/extentions/theme_color.dart';
import '../../../../core/widget/text_widget.dart';

class SettingLanguageSwitch extends HookWidget {
  const SettingLanguageSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final languages = {
      '한국어': {
        'name': 'Korean',
        'label': '언어선택',
        'preparing': '서비스 준비중',
        'language': '언어',
        'currency': '환율',
        'holiday': '기념일'
      },
      'English': {
        'name': 'English',
        'label': 'Language',
        'preparing': 'Service in preparation',
        'language': 'Language',
        'currency': 'Exchange Rate',
        'holiday': 'Holiday'
      },
      '中文': {
        'name': 'Chinese',
        'label': '语言',
        'preparing': '服务准备中',
        'language': '语言',
        'currency': '汇率',
        'holiday': '节日'
      },
      'Filipino': {
        'name': 'Filipino',
        'label': 'Wika',
        'preparing': 'Inihahanda ang serbisyo',
        'language': 'Wika',
        'currency': 'Palitan',
        'holiday': 'Pista'
      },
      'Русский': {
        'name': 'Russian',
        'label': 'Язык',
        'preparing': 'Сервис в разработке',
        'language': 'Язык',
        'currency': 'Курс',
        'holiday': 'Праздник'
      },
    };

    final selectedLanguage = useState('한국어');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  languages[selectedLanguage.value]!['label']!,
                  15,
                  context.width,
                  color: context.textColor,
                ),
                Text(
                  selectedLanguage.value,
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(
                    fontSize: 11,
                    color: context.subTextColor,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuButton<String>(
            color: Theme.of(context).scaffoldBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                width: 0.5,
                color: Colors.grey.shade200,
              ),
            ),
            onSelected: (value) {
              selectedLanguage.value = value;
              if (value != '한국어'){
                final lang = languages[value]!;
                customMsg('${lang['preparing']}\n[${lang['language']}, ${lang['currency']}, ${lang['holiday']}]');
              }

            },
            itemBuilder: (context) => languages.keys
                .map(
                  (language) => PopupMenuItem<String>(
                value: language,
                child: Text(
                  language,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: context.subTextColor,
                  ),
                ),
              ),
            )
                .toList(),
            child: Icon(Icons.text_fields, color: Colors.grey),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}