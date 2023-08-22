import 'package:get/get.dart';
import 'package:trolley/controllers/contact_us/contact_us_controller.dart';

class ContactUsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactUsController());
  }
}
