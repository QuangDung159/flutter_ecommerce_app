// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';

class LoadingButtonWidget extends StatefulWidget {
  final String title;
  final TextStyle? titleStyle;
  final Function() onTap;
  final Color? backgroundColor;

  const LoadingButtonWidget({
    Key? key,
    required this.title,
    this.titleStyle,
    required this.onTap,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<LoadingButtonWidget> createState() => _LoadingButtonWidgetState();
}

class _LoadingButtonWidgetState extends State<LoadingButtonWidget> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: 12,
              ),
              backgroundColor: AppColors.primary,
            ),
            onPressed: _isLoading ? null : _loadFuture,
            child: _isLoading
                ? SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Future<void> _loadFuture() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await widget.onTap();
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      showSnackBar(
        content: 'Error $e',
        isSuccess: false,
      );
      return;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
