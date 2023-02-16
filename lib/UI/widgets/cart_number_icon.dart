import 'package:flutter/material.dart';

class CartNumberIcon extends StatefulWidget {
  const CartNumberIcon({
    super.key,
    required this.numberOfCartItem,
  });

  final int numberOfCartItem;

  @override
  State<CartNumberIcon> createState() => _CartNumberIconState();
}

class _CartNumberIconState extends State<CartNumberIcon> {
  Widget renderNumberCartItem(int numberCartItem) {
    double fontSize = 10;
    if (numberCartItem > 99) {
      fontSize = 7.5;
    }

    return Text(
      numberCartItem > 99 ? '99+' : numberCartItem.toString(),
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return renderNumberCartItem(widget.numberOfCartItem);
  }
}
