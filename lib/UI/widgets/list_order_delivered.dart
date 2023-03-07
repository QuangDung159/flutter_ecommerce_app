// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_order.dart';

class ListOrderDelivered extends StatefulWidget {
  const ListOrderDelivered({super.key});

  @override
  State<ListOrderDelivered> createState() => _ListOrderDeliveredState();
}

class _ListOrderDeliveredState extends State<ListOrderDelivered>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListOrder(
      orderStatus: 'all',
    );
  }

  @override
  bool get wantKeepAlive => true;
}
