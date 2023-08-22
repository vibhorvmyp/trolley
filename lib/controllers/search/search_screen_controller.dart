import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController {
  RxList recentSearchList = ['Grocery', 'Mango', 'Carrot', 'Cadbury'].obs;

  TextEditingController recentSearchTextEditingController =
      TextEditingController();

  String recentSearchText = '';

  addToTextList() {
    final enteredText = recentSearchTextEditingController.text;
    if (enteredText.isNotEmpty) {
      recentSearchList.add(enteredText);
      // recentSearchTextEditingController.clear();
    }
  }

  removeRecentSearchText(String recentSearchedText) {
    recentSearchList.remove(recentSearchedText);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   // TextEditingController? recentSearchTextEditingController;
  // }

  @override
  void onClose() {
    recentSearchTextEditingController.dispose();
    super.onClose();
  }
}
