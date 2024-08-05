
import 'package:flutter/cupertino.dart';

import 'intro_screen.dart';
import 'main_screen.dart';

Future<void> fetchData() async {
  await Future.delayed(Duration(milliseconds: 1100));
}

class PageControllWidget extends StatefulWidget {
  const PageControllWidget({super.key});

  @override
  State<PageControllWidget> createState() => _PageControllWidgetState();
}

class _PageControllWidgetState extends State<PageControllWidget> {


  late Future<void> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = fetchData();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _futureData,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return IntroScreen();
          } else {
            return MainScreen();
          }
        }
        );
  }
}
