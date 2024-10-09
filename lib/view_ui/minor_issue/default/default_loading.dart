import 'package:calendar_project_240727/core/export.dart';
import '../widget/qr_container.dart';
import 'default_dialog.dart';


Widget DefaultLoading() => DefaultDialog(
  title: const QrContainer(
    msg: '로딩중 ......',
    textColor: Colors.black,
  ),
  children: [
    const Spacer(),
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: LoadingAnimationWidget.staggeredDotsWave(
        size: 25, color: Colors.black,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: LoadingAnimationWidget.staggeredDotsWave(
        size: 25, color: Colors.black,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: LoadingAnimationWidget.staggeredDotsWave(
        size: 25, color: Colors.black,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: LoadingAnimationWidget.staggeredDotsWave(
        size: 25, color: Colors.black,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: LoadingAnimationWidget.staggeredDotsWave(
        size: 25, color: Colors.black,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: LoadingAnimationWidget.staggeredDotsWave(
        size: 25, color: Colors.black,
      ),
    ),
    const Spacer(),
  ],
);