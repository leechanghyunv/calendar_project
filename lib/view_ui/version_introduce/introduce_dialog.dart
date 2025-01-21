import '../../core/export_package.dart';
import '../../theme_color.dart';

class DialogStrings {
  static const String title = '워크캘린더 1.3.7 버전 변경 내용';

  static const String mainTitle = '️ 모습은 단순해졌고 기능은 풍성해졌습니다.';

  static const List<String> _contentListWithEmoji = [
    '🎈공수등록란은 삭제되었습니다. 메인화면에 버튼만으로도 간편하게 공수등록을 하실 수 있도록 변경했습니다',
    '🔥공수 데이터백업에 압축 로직을 추가했습니다. 이제 모든 데이터를 한번에 백업하실 수 있습니다',
    '🍀범위 설정기능이 추가되었습니다. 특정 기간을 입력하고 기록을 조회하실 수 있습니다',
    '🚀월 단위로 이동 버튼을 화면에 추가했습니다.',
    '⭐️오늘 날짜로 복귀하는 기능을 추가했습니다.',
    '️🎉 목표수정 기능이 추가되었습니다.',
    '️🔺모든 디자인을 다시 제작했습니다.',
  ];

  static const List<String> _contentListWithoutEmoji = [
    '- 공수등록란은 삭제되었습니다. 메인화면에 버튼만으로도 간편하게 공수등록을 하실 수 있도록 변경했습니다',
    '- 공수 데이터백업에 압축 로직을 추가했습니다. 이제 모든 데이터를 한번에 백업하실 수 있습니다',
    '- 범위 설정기능이 추가되었습니다. 특정 기간을 입력하고 기록을 조회하실 수 있습니다',
    '- 월 단위로 이동 버튼을 화면에 추가했습니다.',
    '- 오늘 날짜로 복귀하는 기능을 추가했습니다.',
    '- 목표수정 기능이 추가되었습니다.',
    '- 모든 디자인을 다시 제작했습니다.',
  ];

  static List<String> get contentList =>
      Platform.isAndroid ? _contentListWithoutEmoji : _contentListWithEmoji;

  static const String endMessage =
      '이번 업데이트가 어플리케이션의 완성은 아닙니다. 언제든 수정이나 기능추가 가능하니 많은 의견 부탁드립니다. 이용해주셔서 감사합니다.';

  static const String sendFeedback = '의견 보내기';
  static const String confirm = '️확인';
}



class IntroduceDialog extends StatelessWidget {
  const IntroduceDialog({super.key});

  TextStyle get contentStyle => TextStyle(
    height: textHeight,
    shadows: Platform.isAndroid ? [
      Shadow(
        blurRadius: 0.75,
        color: Colors.grey,
        offset: Offset(0.25, 0.25),
      ),
    ] : null,
    fontSize: 12,
    color: Colors.grey.shade900,
  );

  Widget contentTitleText(String text, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: contentStyle.copyWith(
            fontSize: width > 376 ? 13 : 11,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget contentText(String text, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        style: contentStyle.copyWith(
            fontSize: width > 376 ? 12 : 11
        ),
      ),
    );
  }

  Widget endText(String text, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        text,
        style: contentStyle.copyWith(
            fontSize: width > 376 ? 11.5 : 10,
            fontWeight: FontWeight.w100
        ),
      ),
    );
  }

  Widget actionText(String text, double width) {
    return Text(
      text,
      style: contentStyle.copyWith(
          fontSize: width > 376 ? 15 : 13,
          fontWeight: FontWeight.bold
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appWidth = MediaQuery.of(context).size.width;
    final InAppReview inAppReview = InAppReview.instance;

    return AlertDialog(
      backgroundColor: Colors.grey.shade100,
      title: Text(
        DialogStrings.title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Container(
        height: 400,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(6),
              ),
              height: 320,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    contentTitleText(DialogStrings.mainTitle, appWidth),
                    SizedBox(height: 10),
                    ...DialogStrings.contentList.map((text) =>
                        contentText(text, appWidth)
                    ).toList(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: endText(DialogStrings.endMessage, appWidth),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 0.0, 12.0, 8.0),
          child: Row(
            children: [
              Spacer(),
              TextButton(
                  onPressed: () async {
                    if (await inAppReview.isAvailable()) {
                      inAppReview.requestReview();
                    }
                  },
                  child: actionText(DialogStrings.sendFeedback, appWidth)
              ),
              SizedBox(width: 5),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: actionText(DialogStrings.confirm, appWidth)
              ),
            ],
          ),
        )
      ],
    );
  }
}