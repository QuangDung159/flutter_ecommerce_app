// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/list_product_screen.dart';
import 'package:flutter_ecommerce_app/UI/screens/search_product_screen.dart';
import 'package:flutter_ecommerce_app/UI/widgets/cart_icon.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/loading_button_widget.dart';
import 'package:flutter_ecommerce_app/UI/widgets/list_product_horizontal.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/constants/commons.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/product_image_model.dart';
import 'package:flutter_ecommerce_app/core/data/product_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/services/cart_services.dart';
import 'package:flutter_ecommerce_app/core/services/dynamic_link_services.dart';
import 'package:flutter_ecommerce_app/core/services/product_service.dart';
import 'package:flutter_ecommerce_app/core/services/profile_services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    super.key,
    this.product,
    this.productId,
  });

  final ProductModel? product;
  final String? productId;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final PageController _pageController = PageController();
  GetxAppController getxApp = Get.find<GetxAppController>();
  ProductModel? product;
  bool isLoading = true;

  void updateRecentlyViewed() {
    if (widget.product == null) {
      return;
    }

    List<ProductModel> listRecentlyViewed = getxApp.listRecentlyViewed;
    int index = listRecentlyViewed
        .indexWhere((element) => element.id == widget.product!.id);

    if (index == -1) {
      listRecentlyViewed.insert(0, widget.product!);
    }
  }

  void getProduct() async {
    if (widget.product != null) {
      setState(() {
        product = widget.product!;
        isLoading = false;
      });

      return;
    }

    if (widget.productId != null) {
      ProductModel? productDetail =
          await ProductService.getProductById(widget.productId!);
      setState(() {
        product = productDetail;
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    getProduct();
    Future.delayed(Duration(seconds: 1), () => updateRecentlyViewed());

    // timeout
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (product == null) {
      return Scaffold(
        body: Center(
          child: isLoading
              ? CupertinoActivityIndicator()
              : Text('Product not found'),
        ),
      );
    }

    bool isSale = product!.originalPrice != '';
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - (93 + 13),
            child: Stack(
              children: [
                renderMainContent(context, product!, isSale),
                renderTopBar(statusBarHeight),
              ],
            ),
          ),
          Expanded(child: Container()),
          Container(
            padding: EdgeInsets.only(
              left: AppDimension.contentPadding,
              right: AppDimension.contentPadding,
              bottom: MediaQuery.of(context).padding.bottom + 12,
              top: 12,
            ),
            color: Colors.white,
            child: LoadingButtonWidget(
              label: 'Add to cart',
              onTap: () async {
                if (getxApp.userLogged.value == null) {
                  // user doesn't login
                  return ProfileService.showSigninBottomSheet(context,
                      onSignInSuccess: () {
                    Navigator.pop(context);
                    CartServices.addToCart(
                      product: product!,
                      quantity: 1,
                    );
                  });
                } else {
                  return CartServices.addToCart(
                    product: product!,
                    quantity: 1,
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget renderMainContent(
    BuildContext context,
    ProductModel product,
    bool isSale,
  ) {
    return Positioned.fill(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  child: PageView(
                    controller: _pageController,
                    children: renderListImage(product.productImages),
                  ),
                ),
                renderDotIndicator(context, product),
                // renderTopBar(statusBarHeight),
              ],
            ),
            Container(
              height: AppDimension.contentPadding,
              color: Colors.white,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: AppDimension.contentPadding,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            if (isSale)
                              Text(
                                '${formatPrice(product.originalPrice)} ',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 16,
                                ),
                              ),
                            Text(
                              formatPrice(product.price),
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppDimension.contentPadding,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      String dynamicLink =
                          await DynamicLinkServices.buildDynamicLink(
                        link: Uri.parse(
                            '$deepLinkDomain/product_detail_screen/${product.id}'),
                      );
                      share(
                        title: 'Product detail',
                        text: product.name,
                        linkUrl: dynamicLink,
                      );
                    },
                    child: Image.asset(
                      AssetHelper.iconShare,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            renderInfoSection(
              'Product Information',
              product.description,
            ),
            renderInfoSection(
              'Delivery & Return Policy',
              product.shippingInfo,
            ),
            Obx(
              () => renderListRecentlyViewed(),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderListRecentlyViewed() {
    List<ProductModel> listRecentlyViewed = getxApp.listRecentlyViewed;

    if (listRecentlyViewed.isEmpty) {
      return Container();
    }

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: AppDimension.contentPadding,
      ),
      margin: EdgeInsets.only(bottom: 12),
      child: ListProductHorizontal(
        title: 'Recently Viewed',
        listProduct: listRecentlyViewed,
        isShowSeeAll: true,
        onTapSeeAll: () => Get.to(
          () => ListProductScreen(title: 'Recently Viewed'),
        ),
      ),
    );
  }

  Widget renderDotIndicator(BuildContext context, ProductModel product) {
    return Positioned(
      bottom: 7,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmoothPageIndicator(
              controller: _pageController,
              count: product.productImages.length,
              effect: ExpandingDotsEffect(
                dotWidth: 4,
                dotHeight: 4,
                activeDotColor: AppColors.primary,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget renderTopBar(double statusBarHeight) {
    bool isAndroid = Theme.of(context).platform == TargetPlatform.android;
    return Positioned(
      top: statusBarHeight + (isAndroid ? AppDimension.contentPadding : 0),
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimension.contentPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                width: 34,
                height: 34,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: AppColors.greyDark.withOpacity(0.6),
                ),
                child: Image.asset(
                  AssetHelper.iconChevronLeft,
                  width: 8,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppColors.greyDark.withOpacity(0.6),
                  ),
                  child: GestureDetector(
                    onTap: () => Get.to(() => SearchProductScreen()),
                    child: Image.asset(
                      AssetHelper.iconSearch,
                      width: 14,
                    ),
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Container(
                  width: 34,
                  height: 34,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppColors.greyDark.withOpacity(0.6),
                  ),
                  child: CartIcon(
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Widget> renderListImage(List<ProductImageModel> listImage) {
    List<Widget> listRender = [];
    for (ProductImageModel item in listImage) {
      listRender.add(
        Image.network(
          item.url,
        ),
      );
    }
    return listRender;
  }

  Widget renderHtml(String productDesc) {
    if (productDesc == '') {
      return Text('No information');
    }
    Widget html = Html(
      data: productDesc,
      style: {
        'body': Style(
          padding: EdgeInsets.zero,
          margin: Margins.zero,
        ),
        'p': Style(
          padding: EdgeInsets.zero,
          margin: Margins.zero,
        ),
      },
    );
    return html;
  }

  Widget renderInfoSection(String title, String content) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimension.contentPadding,
            vertical: AppDimension.contentPadding,
          ),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 12,
                margin: EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: AppColors.border,
                    ),
                  ),
                ),
              ),
              renderHtml(content),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
