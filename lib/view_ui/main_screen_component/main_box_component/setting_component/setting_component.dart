
import '../../../../core/export_package.dart';


class SettingComponent extends StatelessWidget {
  const SettingComponent({super.key});

  @override
  Widget build(BuildContext context) {

    Decoration infoBoxDeco = BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: Colors.grey.shade900,
        width: 0.55,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 4,
          offset: const Offset(0, 4),
        ),
      ],
    );

    return Container(
      height: 150,
      decoration: infoBoxDeco,
    );
  }
}
