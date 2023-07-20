import 'package:flutter/material.dart';

class CustomTextFormField extends TextFormField {
  final String hintText;
  final String? initialValue;
  final ValueNotifier<String?> inputValue;
  final bool canSend;

  CustomTextFormField({
    super.key,
    this.hintText = '',
    this.initialValue,
    required this.inputValue,
    required this.canSend,
  }) : super(
          initialValue: initialValue,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: inputValue.value == null || canSend
                    ? Colors.blueAccent
                    : Colors.red,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: inputValue.value == null || canSend
                    ? Colors.blueAccent
                    : Colors.red,
              ),
            ),
          ),
          onChanged: (value) {
            inputValue.value = value;
          },
        );
}
