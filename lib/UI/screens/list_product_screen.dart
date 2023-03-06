// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_product_2_col.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/services/product_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListProductScreen extends StatefulWidget {
  const ListProductScreen({
    super.key,
    required this.title,
    this.category,
  });

  final String title;
  final String? category;

  @override
  State<ListProductScreen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  List<ProductModel> listProduct = [];

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();

    fetchListListProduct(widget.category ?? '');
  }

  Future<void> fetchListListProduct(String category) async {
    List<ProductModel> list =
        await ProductService.fetchListProductHome(category: category);
    setState(() {
      listProduct = list;
    });
  }

  void _onRefresh() async {
    await fetchListListProduct(widget.category ?? '');
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await fetchListListProduct(widget.category ?? '');
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).padding.top,
          ),
          MyAppBar(
            hasBackButton: true,
            title: widget.title,
          ),
          Expanded(
            child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              header: WaterDropHeader(),
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              footer: CustomFooter(
                loadStyle: LoadStyle.ShowWhenLoading,
                builder: (context, mode) {
                  Widget body = Text('No more Data');
                  if (mode == LoadStatus.idle) {
                    body = CupertinoActivityIndicator();
                  }
                  if (mode == LoadStatus.loading) {
                    body = CupertinoActivityIndicator();
                  }
                  if (mode == LoadStatus.failed) {
                    body = Text('Load Failed!Click retry!');
                  }
                  if (mode == LoadStatus.canLoading) {
                    body = Text('Release to load more');
                  }

                  return SizedBox(
                    height: 55.0,
                    child: Center(child: body),
                  );
                },
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListProduct2Col(
                        listProduct: listProduct,
                        paddingBottom: MediaQuery.of(context).padding.bottom),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
