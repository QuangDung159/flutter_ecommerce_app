// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/screens/cart_screen.dart';
import 'package:flutter_ecommerce_app/UI/screens/delivery_address_screen.dart';
import 'package:flutter_ecommerce_app/UI/screens/list_order_screen.dart';
import 'package:flutter_ecommerce_app/UI/screens/payment_card_screen.dart';
import 'package:flutter_ecommerce_app/UI/screens/scan_qr_screen.dart';
import 'package:flutter_ecommerce_app/UI/screens/voucher_screen.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/profile_menu_item.dart';
import 'package:flutter_ecommerce_app/UI/widgets/sign_in_section.dart';
import 'package:flutter_ecommerce_app/UI/widgets/version_text.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:flutter_ecommerce_app/core/services/profile_services.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MainBottomBarProfileWidget extends StatefulWidget {
  const MainBottomBarProfileWidget({super.key});

  @override
  State<MainBottomBarProfileWidget> createState() =>
      _MainBottomBarProfileWidgetState();
}

class _MainBottomBarProfileWidgetState
    extends State<MainBottomBarProfileWidget> {
  GetxAppController getx = Get.find<GetxAppController>();
  final Uri _url =
      Uri.parse('https://www.linkedin.com/in/lu-quang-dung-884124152/');

  MobileScannerController cameraController = MobileScannerController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => MyAppBar(
                title: 'Profile',
                action: getx.userLogged.value != null
                    ? GestureDetector(
                        onTap: () {
                          ProfileService.logout();
                        },
                        child: Text(
                          'Log out',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.orangeSecondary,
                          ),
                        ),
                      )
                    : null,
              ),
            ),
            Obx(
              () => renderMainContentBySignedStatus(),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderMainContentBySignedStatus() {
    bool isSigned = getx.userLogged.value != null;

    if (isSigned) {
      return renderMainContent();
    }
    return SignInSection();
  }

  Widget renderMainContent() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            renderAvatarSection(),
            renderShoppingInfoSection(),
            SizedBox(
              height: AppDimension.contentPadding,
            ),
            renderReferCodeSection(),
            renderQRCodeReferFriends(),
            SizedBox(
              height: AppDimension.contentPadding,
            ),
            ProfileMenuItem(
              title: 'Scan code',
              onTap: () => Get.to(() => ScanQRScreen()),
            ),
            ProfileMenuItem(
              title: 'Enter refer code',
              onTap: () => ProfileService.showReferCodeInputBottomSheet(
                  context, mounted),
            ),
            ProfileMenuItem(
              title: 'Address book',
              onTap: () => Get.to(() => DeliveryAddressScreen()),
            ),
            ProfileMenuItem(
              title: 'Payment card',
              onTap: () => Get.to(() => PaymentCardScreen()),
            ),
            VersionText(
              textColor: AppColors.greyDark,
            )
          ],
        ),
      ),
    );
  }

  Widget renderQRCodeReferFriends() {
    String referCode = getx.referCode.value;
    if (referCode != '') {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimension.contentPadding,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Share with your friends to scan and get your code!',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            QrImage(
              data: referCode,
              version: QrVersions.auto,
              size: 150,
              gapless: false,
            ),
          ],
        ),
      );
    }
    return Container();
  }

  Widget renderReferCodeSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimension.contentPadding,
      ),
      child: Stack(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(AssetHelper.imageReferBackground),
            ),
          ),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(AssetHelper.imageGradientProfile),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Refer a friend and get reward.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      GestureDetector(
                        onTap: () {
                          triggerLaunchUrl(_url, LaunchMode.externalApplication);
                        },
                        child: Text(
                          'Terms and conditions apply.',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: renderReferCode(),
          )
        ],
      ),
    );
  }

  Widget renderShoppingInfoSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimension.contentPadding,
      ),
      child: Row(
        children: [
          renderAccountShoppingInfoItem(
            'Cart',
            getx.listCartItem.length.toString(),
            Image.asset(
              AssetHelper.iconCartBag,
              width: 20,
              height: 20,
              color: AppColors.primary,
            ),
            () => Get.to(() => CartScreen()),
          ),
          SizedBox(
            width: 10,
          ),
          renderAccountShoppingInfoItem(
            'Orders',
            getx.countOrder.value.toString(),
            Image.asset(
              AssetHelper.iconOrder,
              width: 20,
              height: 20,
              color: AppColors.primary,
            ),
            () => Get.to(() => ListOrderScreen()),
          ),
          SizedBox(
            width: 10,
          ),
          Obx(
            () => renderAccountShoppingInfoItem(
              'Vouchers',
              getx.listPromoCode.length.toString(),
              Image.asset(
                AssetHelper.iconPromo,
                width: 20,
                height: 20,
                color: AppColors.primary,
              ),
              () => Get.to(() => VoucherScreen()),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderAccountShoppingInfoItem(
    String title,
    String value,
    Widget icon,
    Function() onTap,
  ) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          alignment: Alignment.center,
          height: 54,
          decoration: BoxDecoration(
            color: AppColors.yellowLight.withOpacity(0.4),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: AppColors.primary,
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  Text(
                    ' $value',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget renderAvatarSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimension.contentPadding * 2,
        vertical: AppDimension.contentPadding,
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(85),
            child: Image.network(
              getx.userLogged.value!.photoUrl,
              width: 85,
              height: 85,
            ),
          ),
          SizedBox(
            width: AppDimension.contentPadding,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getx.userLogged.value!.displayName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  getx.userLogged.value!.email,
                  style: TextStyle(color: AppColors.greyScale, fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget renderReferCode() {
    String referCode = getx.referCode.value;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.center,
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => FlutterClipboard.copy(
              getx.userLogged.value!.id,
            ),
            child: Image.asset(
              AssetHelper.iconCopy,
              width: 24,
            ),
          ),
          Text(
            getx.userLogged.value!.id,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (referCode != '') {
                share(
                  title: 'Click link to get promotion',
                  text: 'Flutter E-Commerce App - Referrer link',
                  linkUrl: referCode,
                );
              } else {
                showSnackBar(
                  content: 'Something went wrong, please try again later',
                  isSuccess: false,
                );
              }
            },
            child: Image.asset(
              AssetHelper.iconShare,
              width: 24,
            ),
          ),
        ],
      ),
    );
  }
}
