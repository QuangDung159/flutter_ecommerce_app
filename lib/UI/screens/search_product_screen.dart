// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/textfield_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/product_item_vertical.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/services/product_service.dart';
import 'package:get/get.dart';

class SearchProductScreen extends StatefulWidget {
  const SearchProductScreen({
    super.key,
    this.navigationFrom,
  });

  final String? navigationFrom;

  @override
  State<SearchProductScreen> createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  GetxAppController getxAppController = Get.find<GetxAppController>();
  String queryStringInput = '';

  final textFieldController = TextEditingController();

  List<ProductModel> listProduct = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    textFieldController.dispose();
    super.dispose();
  }

  Future<void> onSearch(String queryString) async {
    if (queryString == '') {
      return;
    }

    List<ProductModel> listProductSearched =
        await ProductService.onSearch(queryString);

    setState(() {
      listProduct = listProductSearched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).padding.top,
          ),
          MyAppBar(
            hasBackButton: true,
            title: 'Search',
          ),
          renderInputSearch(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: AppDimension.contentPadding / 2,
                  ),
                  Column(
                    children: renderListProductItem(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderInputSearch() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextFieldWidget(
              controller: textFieldController,
              hintText: 'Enter product name',
              onChanged: (value) {
                setState(() {
                  queryStringInput = value;
                });
              },
            ),
          ),
          SizedBox(
            width: 24,
          ),
          GestureDetector(
            onTap: () {
              onSearch(queryStringInput);
            },
            child: Text(
              'Search',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> renderListProductItem() {
    List<Widget> listRender = [];

    if (listProduct.isEmpty) {
      return [
        Container(
            margin: EdgeInsets.only(
              top: 12,
            ),
            child: Text('List product empty'))
      ];
    }

    for (var i = 0; i < listProduct.length; i++) {
      listRender.add(
        Container(
          margin: EdgeInsets.only(
            bottom: i == listProduct.length - 1 ? 12 : 0,
          ),
          child: ProductItemVertical(
            product: listProduct[i],
          ),
        ),
      );
    }

    return listRender;
  }
}
