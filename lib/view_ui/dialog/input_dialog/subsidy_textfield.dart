import 'package:calendar_project_240727/base_consumer.dart';
import '../../../core/export_package.dart';
import '../dialog_text.dart';

class SubsidyTextfield extends ConsumerStatefulWidget {

  final TextEditingController? controller6;
  final FocusNode? focusNode6;
  final TextInputAction textInputAction;

  const SubsidyTextfield(this.controller6, this.focusNode6, this.textInputAction,  {super.key});

  @override
  ConsumerState<SubsidyTextfield> createState() => _SubsidyTextfieldState();
}

class _SubsidyTextfieldState extends ConsumerState<SubsidyTextfield> {
  @override
  Widget build(BuildContext context) {

    final appWidth = MediaQuery.of(context).size.width;
    double screenUtilSize(double size) => Platform.isAndroid ? (size - 1.0).sp : size.sp;
    final formzRefread = ref.formzRead;

    return Container(
      decoration: BoxDecoration(
      ),
      height: 47.sp,
      child: TextFormField(
        controller: widget.controller6,
        focusNode: widget.focusNode6,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 13,
        ),
        inputFormatters: [
          ThousandsFormatter(),
        ],
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
          prefixText: '',
          prefixStyle: ContractFontStyle(),
          hintText: '20,000',
          hintStyle: TextStyle(
            fontSize:  screenUtilSize(14),
            color: Colors.grey[600],
          ),
          labelText: '✨일비',
          labelStyle: ContractFontStyle().copyWith(color: Colors.grey[900],),
        ),
        onChanged: (val){
          FocusScope.of(context).requestFocus(widget.focusNode6);
          formzRefread.onChangeSubsidy(val);
        },

      ),

    );
  }
}
