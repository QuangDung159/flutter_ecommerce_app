// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_order.dart';

class ListOrderShipping extends StatefulWidget {
  const ListOrderShipping({super.key});

  @override
  State<ListOrderShipping> createState() => _ListOrderShippingState();
}

class _ListOrderShippingState extends State<ListOrderShipping>
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
