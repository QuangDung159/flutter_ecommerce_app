import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_order.dart';
import 'package:flutter_ecommerce_app/core/data/order_model.dart';

class ListOrderAll extends StatefulWidget {
  const ListOrderAll({
    super.key,
    required this.listOrder,
  });

  final List<OrderModel> listOrder;

  @override
  State<ListOrderAll> createState() => _ListOrderAllState();
}

class _ListOrderAllState extends State<ListOrderAll>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListOrder(
      listOrderModel: widget.listOrder,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
