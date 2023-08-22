import 'package:get/get.dart';
import 'package:trolley/controllers/reset_password/reset_password_controller.dart';

class ResetPasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordController());
  }
}
