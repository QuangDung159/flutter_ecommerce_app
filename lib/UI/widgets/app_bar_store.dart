// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AppBarStore extends StatelessWidget {
  const AppBarStore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26),
      width: MediaQuery.of(context).size.width,
      color: Colors.amber,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.search,
              size: 32,
            ),
          ),
          Text(
            'Store',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  size: 32,
                ),
                Positioned(
                  top: 14,
                  left: 8,
                  child: Text(
                    '99+',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
