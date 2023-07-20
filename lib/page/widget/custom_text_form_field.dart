import 'package:flutter/material.dart';
import 'package:geister/theme/app_text_style.dart';
import 'package:geister/theme/app_theme_color.dart';

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
            hintStyle: textStyle(
              AppTextStyle.bodyRegular,
              AppThemeColor.graySub.color,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: inputValue.value == null || canSend
                    ? AppThemeColor.grayBorder.color
                    : AppThemeColor.red.color,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: inputValue.value == null || canSend
                    ? AppThemeColor.grayBorder.color
                    : AppThemeColor.red.color,
              ),
            ),
          ),
          onChanged: (value) {
            inputValue.value = value;
          },
        );
}
