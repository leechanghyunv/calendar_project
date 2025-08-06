import '../../../core/export_package.dart';

class InitialDayOffDialog extends StatelessWidget {
  const InitialDayOffDialog({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final baseStyle = TextStyle(
      height: Platform.isAndroid ? 1.75 : 1.30,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

    return AlertDialog(

      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0,vertical: 8.0),
          child: Row(
            children: [
              Spacer(),
              TextButton(
                onPressed: (){
                Navigator.pop(context);
              },
                child: Text('확인',
                    style: baseStyle,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
