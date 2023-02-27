import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/loading_button_widget.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';

class BottomButton extends StatefulWidget {
  const BottomButton({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final Function()? onTap;

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 93,
      color: Colors.white,
      padding: EdgeInsets.only(
        left: AppDimension.contentPadding,
        right: AppDimension.contentPadding,
        bottom: 30,
        top: 15,
      ),
      child: LoadingButtonWidget(
        label: widget.title,
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
      ),
    );
  }
}
