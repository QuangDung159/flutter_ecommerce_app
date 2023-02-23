import 'package:flutter_ecommerce_app/core/controllers/getx_app_controller.dart';
import 'package:flutter_ecommerce_app/core/data/user_model.dart';
import 'package:flutter_ecommerce_app/core/helpers/local_storage_helper.dart';
import 'package:get/get.dart';

class ProfileService {
  static final GetxAppController getxApp = Get.find<GetxAppController>();

  static void getInitAccountLogged() {
    var displayName = LocalStorageHelper.getValue('DISPLAY_NAME');

    if (displayName != null && displayName != '') {
      getxApp.setUserLogged(
        UserModel(
          email: LocalStorageHelper.getValue('EMAIL'),
          displayName: displayName ?? 'No name',
          photoUrl: LocalStorageHelper.getValue('PHOTO_URL'),
          id: LocalStorageHelper.getValue('OPEN_ID'),
        ),
      );
    }
  }
}
