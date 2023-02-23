// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_signin_method.dart';
import 'package:flutter_ecommerce_app/UI/widgets/version_text.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';

class SignInSection extends StatelessWidget {
  const SignInSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // color: Colors.amber,
        padding: EdgeInsets.symmetric(
          horizontal: AppDimension.contentPadding,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              'Welcome!',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary),
            ),
            SizedBox(
              height: 100,
            ),
            ListSigninMethod(),
            SizedBox(
              height: AppDimension.contentPadding,
            ),
            VersionText(
              textColor: AppColors.greyDark,
            )
          ],
        ),
      ),
    );
  }
}
