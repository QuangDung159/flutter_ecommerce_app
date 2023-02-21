// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/signin_method_button.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/services/google_services.dart';

class ListSigninMethod extends StatelessWidget {
  const ListSigninMethod({
    Key? key,
    this.onSignInSuccess,
  }) : super(key: key);

  final Function()? onSignInSuccess;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            GoogleServices.handleGoogleSignIn(context, onSignInSuccess).then(
              (googleSigninAccount) {
                if (googleSigninAccount != null) {
                  GoogleServices.showReferCodeInputBottomSheet(context);
                }
              },
            );
          },
          child: SignInMethodButton(
            title: 'Sign in with Google',
            icon: Image.asset(
              AssetHelper.iconGoogle,
              width: 30,
              height: 30,
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        SignInMethodButton(
          icon: Image.asset(
            AssetHelper.iconFacebook,
            width: 30,
            height: 30,
          ),
          title: 'Sign in with Facebook',
        ),
      ],
    );
  }
}
