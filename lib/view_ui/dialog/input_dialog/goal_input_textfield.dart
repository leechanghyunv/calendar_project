import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../core/export_package.dart';
import '../../../repository/formz/formz_model.dart';
import '../dialog_text.dart';

class GoalInputTextfield extends ConsumerStatefulWidget {
  final bool? autofocus;
  final FocusNode? focusNode;
  final String? hintMsg;
  final String? labelMsg;
  final String? initialValue;
  final double edgeValue;
  final void Function(String)? onChanged;
  final TextInputAction textInputAction;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final TextEditingController? controller;

  const GoalInputTextfield(
      {super.key,
      this.autofocus,
      this.focusNode,
      this.hintMsg,
      this.labelMsg,
      this.initialValue,
      required this.edgeValue,
      this.onChanged,
      required this.textInputAction,
      this.suffixIcon,
      this.suffixIconColor,
      this.controller});

  @override
  ConsumerState<GoalInputTextfield> createState() => _GoalInputTextfieldState();
}

class _GoalInputTextfieldState extends ConsumerState<GoalInputTextfield> {


  @override
  Widget build(BuildContext context) {

    final appWidth = MediaQuery.of(context).size.width;

    final formzRefread = ref.read(formzValidatorProvider.notifier);


    return Padding(
      padding:  EdgeInsets.symmetric(vertical: widget.edgeValue),
      child: SizedBox(
        height: appWidth > 500 ? 23.5.sp : 47.sp,
        child:
        TextFormField(
          controller: widget.controller,
          textInputAction: widget.textInputAction,
          autofocus: widget.autofocus ?? false,
          focusNode: widget.focusNode,
          onChanged: widget.onChanged,
          keyboardType: TextInputType.number,
          initialValue: widget.initialValue,
          inputFormatters: [
            ThousandsFormatter(),
          ],
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            prefixText: '₩ ',
            prefixStyle: ContractFontStyle(),
            suffixIcon: widget.suffixIcon,
            suffixIconColor: widget.suffixIconColor,
            hintText: widget.hintMsg,
            hintStyle: ContractFontStyle().copyWith(color: Colors.grey[600]),
            labelText: widget.labelMsg,
            labelStyle: ContractFontStyle().copyWith(color: Colors.grey[900]),
          ),
        ),
      ),
    );
  }
}
