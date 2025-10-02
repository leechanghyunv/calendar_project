import 'package:calendar_project_240727/base_app_size.dart';
import '../../core/export_package.dart';
import '../screen/search_screen/search_screen.dart';

class PopupWidget extends ConsumerWidget {


  const PopupWidget( {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appWidth = context.width;

    return IconButton(
      onPressed: (){
        showModalBottomSheet(
          useRootNavigator: true,
          isScrollControlled: true,
          context: context,
          isDismissible: true,
          enableDrag: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          builder: (context){
            final screenHeight = context.height;
            return Container(
                height: screenHeight * 0.88,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
                child: Column(
                  children: [
                    Container(
                      width: 30,
                      height: 4,
                      margin: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    Expanded(
                        child: SearchScreen(),
                    ),
                  ],
                ),

            );
          }
        );
      },
      icon: Icon(
        Icons.calendar_today_outlined,
        size: appWidth >= 450 ? 27 : appWidth > 400 ? 25 : 22.5,
        color: Colors.grey.shade900,
      ),
    );
  }
}
