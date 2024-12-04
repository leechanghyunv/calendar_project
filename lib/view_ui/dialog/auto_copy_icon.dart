import 'dart:async';
import 'package:calendar_project_240727/core/widget/toast_msg.dart';
import 'package:calendar_project_240727/firebase_analytics.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/export_package.dart';
import '../../repository/formz/formz_model.dart';
import '../../repository/view_controll/singlechild_scroll_repo.dart';
part 'auto_copy_icon.g.dart';


@riverpod
class AutoCopy extends _$AutoCopy {
  @override
  FutureOr<int> build() async {
    return 0;
  }

  Future<void> normalValue(String val) async {
    if (val.isEmpty) {
      state = const AsyncValue.data(0);
    }

    final cleanValue = val.replaceAll(',', '').trim();

    try{
      state = const AsyncValue.loading();
      final value = int.parse(cleanValue);
      state = AsyncValue.data(value);
    }catch(e){
      state = const AsyncValue.data(0);
    }
  }
}


class AutoCopyIcon extends ConsumerStatefulWidget {

  final FocusNode node3;
  final FocusNode node6;
  final TextEditingController controller4;
  final TextEditingController controller5;

  const AutoCopyIcon(this.node3,this.node6, this.controller4, this.controller5,   {super.key});

  @override
  ConsumerState<AutoCopyIcon> createState() => _AutoCopyIconState();
}

class _AutoCopyIconState extends ConsumerState<AutoCopyIcon> {

  @override
  Widget build(BuildContext context) {

    final autoValue = ref.watch(autoCopyProvider);
    final formzRefread = ref.read(formzValidatorProvider.notifier);

    final isSixOrMore = autoValue.whenOrNull(
        data: (value) => value.toString().length >= 6
    ) ?? false;

    final calculatedValues = autoValue.whenOrNull(
      data: (value) => {
        'original': value,
        'extended': (value * 1.5).round(),  // 1.5배, 정수로 반올림
        'night': (value * 2.0).round(),     // 2.0배, 정수로 반올림
      },
    );

     return IconButton(
       onPressed: () async {
         if (calculatedValues != null) {
           final formatter = NumberFormat('#,###');

           setState(() {
             widget.controller4.text = formatter.format(calculatedValues['extended']);
             widget.controller5.text = formatter.format(calculatedValues['night']);
           });

           formzRefread.onChangePay1(calculatedValues['original'].toString());
           formzRefread.onChangePay2(calculatedValues['extended'].toString());
           formzRefread.onChangePay3(calculatedValues['night'].toString());
           ref.read(firebaseAnalyticsClassProvider.notifier).autoCopyEvent();

           // 빌드 사이클이 완료될 때까지 대기
           WidgetsBinding.instance.addPostFrameCallback((_) {
             ref.read(scrollNotifierProvider.notifier).scrollToBottom();
             FocusScope.of(context).requestFocus(widget.node6);
           });
           await Future.delayed(Duration(milliseconds: 100));
           ref.read(scrollNotifierProvider.notifier).scrollToBottom();
           customMsg('👉 일비 입력란으로');
         }
       },
      icon: Icon(
        Icons.fingerprint,
        color: isSixOrMore
            ? Colors.blue.shade700
            : Colors.grey.shade100,
      ),
    );

  }
}
