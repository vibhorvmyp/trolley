import 'package:get/get.dart';
import 'package:trolley/controllers/checkout/checkout_controller.dart';

class CheckoutBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckoutController());
  }
}
