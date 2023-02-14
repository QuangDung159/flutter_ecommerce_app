// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/filter_item_level_1.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyAppBar(
                  title: 'Filter',
                  action: Text(
                    'Reset all',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.orangeSecondary,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimension.contentPadding,
                  ),
                  child: Column(
                    children: [
                      FilterItemLevel1(),
                      FilterItemLevel1(),
                      FilterItemLevel1(),
                      FilterItemLevel1(),
                      FilterItemLevel1(),
                      FilterItemLevel1(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


