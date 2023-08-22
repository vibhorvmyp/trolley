import 'package:get/get.dart';
import 'package:trolley/controllers/edit_Profile/edit_profile_controller.dart';

class EditProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileController());
  }
}
