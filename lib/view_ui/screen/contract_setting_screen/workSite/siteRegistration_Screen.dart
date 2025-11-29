import '../../../widgets/elevated_button.dart';
import '../component/number_picker_modal.dart';
import '/../../core/export_package.dart';

class SiteRegistrationScreen extends StatelessWidget {
  const SiteRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: CustomElevatedButton(
                text: '현장등록',
                onPressed: (){
                  HapticFeedback.selectionClick();
                  Navigator.pop(context);
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    NumberPickerModal(context);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
