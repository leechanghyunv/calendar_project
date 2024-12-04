import 'package:calendar_project_240727/core/export_package.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../core/utils/converter.dart';
import '../../../repository/formz/formz_model.dart';


class TaxinputTextfield extends ConsumerStatefulWidget {
  final void Function(String)? onChanged;
  final TextInputAction textInputAction;
  final TextEditingController controller2;
  final FocusNode? focusNode;

  const TaxinputTextfield(
      {super.key,
      this.onChanged,
      required this.textInputAction,
      this.focusNode, required this.controller2});

  @override
  ConsumerState<TaxinputTextfield> createState() => _TaxinputTextfieldState();
}

class _TaxinputTextfieldState extends ConsumerState<TaxinputTextfield> {

  String _hintText = '3.3';
  bool _isFocused = false;  // focus 상태 추적

  @override
  void initState() {
    super.initState();
    widget.focusNode?.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode?.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = widget.focusNode?.hasFocus ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {

    final appWidth = MediaQuery.of(context).size.width;
    double screenUtilSize(double size) => Platform.isAndroid ? (size - 1.0).sp : size.sp;
    final formzRefread = ref.read(formzValidatorProvider.notifier);


    return SizedBox(
      height: appWidth > 500 ? 23.5.sp : 47.sp,
      child: TypeAheadField<double>(
        controller: widget.controller2,
        focusNode: widget.focusNode,
        builder: (context,controller, focusNode) {
         return TextFormField(
           controller: controller,
           focusNode: focusNode,
           textInputAction: widget.textInputAction,
           keyboardType: const TextInputType.numberWithOptions(decimal: true),
           inputFormatters: [
             FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
             TwoDigitInputFormatter(), // 최대 길이 설정 (예: "12.34")
           ],
           onChanged: widget.onChanged,
           decoration: InputDecoration(
             border: const OutlineInputBorder(
               borderRadius: BorderRadius.zero,
               borderSide: BorderSide(
                 color: Colors.black,
                 width: 1,
               ),
             ),
             hintText: _hintText,
             hintStyle: TextStyle(
               fontSize: appWidth > 500 ? screenUtilSize(7.5) : screenUtilSize(15),
               color: Colors.grey[600],
             ),
             suffixText: '%',
             suffixStyle: TextStyle(
               fontSize: appWidth > 500 ? screenUtilSize(7.5) : screenUtilSize(15),
               fontWeight: FontWeight.bold,
             ),
           ),
           onFieldSubmitted: (value) {
             final parsedValue = double.tryParse(value);
             if (parsedValue != null && parsedValue >= 0 && parsedValue <= 100) {
               print('Entered value: $parsedValue');
             }
           },
         );
        },
        suggestionsCallback: (pattern) async {
          final values = [3.3, 10.0, 10.4];
          return values.where((value) =>
              value.toString().contains(pattern)
          ).toList();
        },
        itemBuilder: (context, double suggestion) {
          return ListTile(
            title: Text('${suggestion.toString()}%'
              , style: TextStyle(
                fontSize: appWidth > 500 ? screenUtilSize(7) : screenUtilSize(14),
                color: Colors.grey[600],
              ),
            ),
          );
        },
        onSelected: (double value) {
          setState(() {
            _hintText = value.toString();
            widget.controller2.text = value.toString();
          });
          formzRefread.onChangeTax(value.toString());
        },
        emptyBuilder: (context) {
          return const SizedBox();
        },
      ),
    );
  }
}


