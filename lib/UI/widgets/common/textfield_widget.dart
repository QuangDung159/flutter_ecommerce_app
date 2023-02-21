// ignore_for_file: prefer_const_constructors, unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.controller,
    this.hintText,
    this.height,
    this.cursorHeight,
    this.hintStyle,
    this.onChanged,
    this.keyboardType,
    this.autofocus,
  }) : super(key: key);

  final TextEditingController controller;
  final String? hintText;
  final double? height;
  final double? cursorHeight;
  final TextStyle? hintStyle;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool? autofocus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40,
      child: TextField(
        autofocus: autofocus ?? false,
        keyboardType: keyboardType ?? TextInputType.text,
        controller: controller,
        onChanged: (value) {
          if (onChanged != null) {
            onChanged!(value);
          }
        },
        cursorHeight: cursorHeight ?? 16,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.border,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.only(bottom: 11, left: 16, right: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: hintText ?? '',
          hintStyle: hintStyle ??
              TextStyle(
                color: AppColors.greyMid,
              ),
        ),
      ),
    );
  }
}
