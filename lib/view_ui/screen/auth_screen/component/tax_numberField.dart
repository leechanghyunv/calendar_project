import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'auth_textField/auth_field_decoration.dart';

class TaxNumberField extends StatelessWidget {
  final String name;
  final FocusNode? focusNode;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String?>? onSubmitted;
  final Function(String?)? onChanged;
  final ValueSetter<double>? onSelected;

  const TaxNumberField({
    super.key,
    required this.name,
    this.focusNode,
    this.hintText,
    this.inputFormatters,
    this.onSubmitted,
    this.onChanged,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Autocomplete<double>(
      optionsBuilder: (textValue) {
        final values = [3.3, 10.0];
        return values.where((value) =>
        textValue.text.isEmpty || value.toString().contains(textValue.text)
        );
      },

      onSelected: onSelected ?? (value) {},

      fieldViewBuilder: (context, controller, _, onSubmitted) {
        return authContainer(
          child: FormBuilderTextField(
            name: name,
            controller: controller,
            focusNode: focusNode,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
            cursorColor: Colors.grey.shade700,
            cursorWidth: 4.0,
            decoration: customInputDecoration(
              hintText: hintText,
            ),
            inputFormatters: inputFormatters,
            onSubmitted: this.onSubmitted,
            onChanged: onChanged,
          ),
        );
      },

      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4,
            child: Container(
              width: 220, // 👈 폭 제한
              constraints: BoxConstraints(maxHeight: 250),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true, // 👈 내용만큼만 크기 조정
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final suggestion = options.elementAt(index);
                  return InkWell( // 👈 ListTile 대신 InkWell 사용
                    onTap: () => onSelected(suggestion),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Row(
                        children: [
                          Text(
                            '${suggestion.toString()}%',
                            textScaler: TextScaler.noScaling,
                            style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}