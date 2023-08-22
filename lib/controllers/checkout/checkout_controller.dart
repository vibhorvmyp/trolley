import 'package:get/get.dart';

class CheckoutController extends GetxController {
  RxString timeSlotSelected = '8:00 am to 9:00 am'.obs;

  timeSlotCheck(timeSlotTitle) {
    if (timeSlotSelected == timeSlotTitle) {
      return true;
    } else {
      return false;
    }
  }
}
