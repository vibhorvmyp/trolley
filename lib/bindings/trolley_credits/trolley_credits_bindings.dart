import 'package:get/get.dart';
import 'package:trolley/controllers/trolly_credit/trolley_credit_controller.dart';

class TrolleyCreditsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrolleyCreditController());
  }
}
