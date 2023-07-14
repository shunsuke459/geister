import 'package:flutter/material.dart';

class CustomTextFormField extends TextFormField {
  final String hintText;
  final ValueNotifier<String?> inputValue;
  final bool canSend;

  CustomTextFormField({
    super.key,
    this.hintText = '',
    required this.inputValue,
    required this.canSend,
  }) : super(
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
