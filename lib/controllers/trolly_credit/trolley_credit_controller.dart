import 'package:get/get.dart';
import 'package:trolley/models/trolley_credit/trolley_credit_model.dart';

class TrolleyCreditController extends GetxController {
  RxString selectedTransationTab = 'All'.obs;

  RxList<dynamic> selectedTransactionList = TrolleyCreditModel.tsListAll.obs;

  fetchTransactionList(selectedtransations) {
    if (selectedTransationTab.value == 'All') {
      selectedTransactionList.value = TrolleyCreditModel.tsListAll;
    } else if (selectedTransationTab.value == 'Debits') {
      selectedTransactionList.value = TrolleyCreditModel.tsListDebits;
    } else if (selectedTransationTab.value == 'Credits') {
      selectedTransactionList.value = TrolleyCreditModel.tsListCredits;
    }
  }
}
