// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';

class FilterItemLevel2 extends StatefulWidget {
  const FilterItemLevel2({
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  final bool isSelected;

  @override
  State<FilterItemLevel2> createState() => _FilterItemLevel2State();
}

class _FilterItemLevel2State extends State<FilterItemLevel2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.isSelected ? AppColors.yellowLight : Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: 1,
          color: widget.isSelected ? AppColors.primary : AppColors.greyMid,
        ),
      ),
      width: 102,
      height: 24,
      child: Center(
        child: Text(
          'Bike',
        ),
      ),
    );
  }
}
