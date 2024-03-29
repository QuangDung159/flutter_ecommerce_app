// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/smart_refresher_custom.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_product_2_col.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/data/sort_item_model.dart';
import 'package:flutter_ecommerce_app/core/services/product_service.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
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
  int page = 1;
  GetxAppController getxApp = Get.find<GetxAppController>();

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();

    getxApp.setData(isLoading: true);
    fetchListListProduct(widget.category ?? '', 1);

    getxApp.sortSelected.listen((p0) {
      setState(() {
        listProduct = [];
      });
      fetchListListProduct(widget.category ?? '', 1);
    });

    getxApp.listFilterItemSelected.listen((p0) {
      setState(() {
        listProduct = [];
      });
      fetchListListProduct(widget.category ?? '', 1);
    });
  }

  @override
  void dispose() {
    super.dispose();
    // getxApp.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Future<void> fetchListListProduct(String category, int page) async {
    SortItemModel sortSelected = getxApp.sortSelected.value;
    List<String> listFilterId = getxApp.listFilterItemSelected;

    List<ProductModel> list = await ProductService.fetchListProductHome(
      category: category,
      page: page,
      sortValue: sortSelected.value,
      listFilterId: listFilterId,
    );

    setState(() {
      listProduct = [...listProduct, ...list];
    });

    getxApp.setData(isLoading: false);
  }

  void _onRefresh() async {
    setState(() {
      listProduct = [];
      page = 1;
    });

    await fetchListListProduct(widget.category ?? '', 1);
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await fetchListListProduct(widget.category ?? '', page + 1);

    setState(() {
      page = page + 1;
    });
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      child: Scaffold(
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
              child: SmartRefresherCustom(
                enablePullDown: true,
                enablePullUp: true,
                refreshController: _refreshController,
                onRefresh: _onRefresh,
                onLoading: _onLoading,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListProduct2Col(
                        listProduct: listProduct,
                        paddingBottom: MediaQuery.of(context).padding.bottom,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
