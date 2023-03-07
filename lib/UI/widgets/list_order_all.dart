import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_order.dart';

class ListOrderAll extends StatefulWidget {
  const ListOrderAll({
    super.key,
    required this.orderStatus,
  });

  final String orderStatus;

  @override
  State<ListOrderAll> createState() => _ListOrderAllState();
}

class _ListOrderAllState extends State<ListOrderAll>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListOrder(
      orderStatus: widget.orderStatus,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
