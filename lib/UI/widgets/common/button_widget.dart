// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    Key? key,
    required this.title,
    this.titleStyle,
    required this.opTap,
    this.backgroundColor,
  }) : super(key: key);

  final String title;
  final TextStyle? titleStyle;
  final Function() opTap;
  final Color? backgroundColor;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.opTap(),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.backgroundColor ?? AppColors.primary,
        ),
        child: Center(
          child: Text(
            widget.title,
            style: widget.titleStyle ??
                TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
