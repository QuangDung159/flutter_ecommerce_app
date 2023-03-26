// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/UI/widgets/app_bar.dart';
import 'package:flutter_ecommerce_app/UI/widgets/common/loading_button_widget.dart';
import 'package:flutter_ecommerce_app/core/constants/app_dimension.dart';
import 'package:flutter_ecommerce_app/core/helpers/asset_helper.dart';
import 'package:flutter_ecommerce_app/core/helpers/common_helper.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ScanQRScreen extends StatefulWidget {
  const ScanQRScreen({super.key});

  @override
  State<ScanQRScreen> createState() => _ScanQRScreenState();
}

class _ScanQRScreenState extends State<ScanQRScreen> {
  MobileScannerController cameraController = MobileScannerController();
  bool isModalShown = false;

  @override
  Widget build(BuildContext context) {
    void showModal(String url) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => Container(
          padding: MediaQuery.of(context).viewInsets,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Container(
            color: Colors.white,
            height: 200,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  AssetHelper.iconBottomSheet,
                  width: 40,
                  height: 4,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        url,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: AppDimension.contentPadding,
                      ),
                      LoadingButtonWidget(
                        label: 'Process',
                        onTap: () async {
                          await triggerLaunchUrl(
                            parseUri(url),
                            LaunchMode.externalApplication,
                          );

                          if (!mounted) {
                            return;
                          }
                          return Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

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
            title: 'Scanner',
          ),
          Expanded(
            child: MobileScanner(
              controller: cameraController,
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                final Uint8List? image = capture.image;
                for (final barcode in barcodes) {
                  if (!isModalShown) {
                    setState(() {
                      isModalShown = true;
                    });
                    showModal(barcode.rawValue.toString());
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
