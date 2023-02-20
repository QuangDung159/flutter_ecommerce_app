import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_order.dart';
import 'package:flutter_ecommerce_app/core/constants/commons.dart';

class ListOrderAll extends StatefulWidget {
  const ListOrderAll({super.key});

  @override
  State<ListOrderAll> createState() => _ListOrderAllState();
}

class _ListOrderAllState extends State<ListOrderAll>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListOrder(
      listOrderModel: listOrderDummy,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
