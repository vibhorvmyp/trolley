import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  TextEditingController firstNameController =
      TextEditingController(text: 'Vivi');
  TextEditingController lastNameController =
      TextEditingController(text: 'Boney');
  TextEditingController emailController =
      TextEditingController(text: 'viviboney123@gmail.com');
  TextEditingController phoneController =
      TextEditingController(text: '142367894');

  String firstName = 'Vivi';
}
