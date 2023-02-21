import 'package:flutter_ecommerce_app/core/controllers/getx_google_info_controller.dart';
import 'package:get/get.dart';

class ProfileService {
  static GetxGoogleInfoController getxGoogle = Get.find<GetxGoogleInfoController>();

  static String generateReferCode() {
    String prefix = getxGoogle.email.split('@')[0];
    String referCode = 'refer-${getxGoogle.openid}';
    return referCode;
  }
}
