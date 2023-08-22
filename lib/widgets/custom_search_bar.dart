import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:trolley/controllers/search/search_screen_controller.dart';
import 'package:trolley/routes/routes.dart';

import '../constants/colors.dart';
import '../constants/textstyles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    required this.hintText,
    this.navigateFlag = false,
    this.keyboardType,
    this.readOnlyFlag = false,
    this.controller,
    this.onEditingComplete,
    this.onFieldSubmitted,
    super.key,
  });

  final String hintText;
  final bool navigateFlag;
  final TextInputType? keyboardType;
  final bool readOnlyFlag;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;

  // final searchScreenController =

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnlyFlag,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      onTap: () {
        if (navigateFlag != false) {
          Get.toNamed(searchScreen);
          FocusScope.of(context).unfocus();
        }
      },
      // onChanged: (value) {},

      style: kTextStyleRegular.copyWith(
          color: kColorBlack, fontSize: mediaQuery.height * 0.018),
      decoration: InputDecoration(
        // labelText: 'Densed TextField',
        isDense: false,
        contentPadding: EdgeInsets.all(mediaQuery.height * 0.02),
        fillColor: kColorMainTheme.withOpacity(0.04),
        // fillColor: Colors.blue,
        filled: true,
        prefixIcon: Container(
          height: mediaQuery.height * 0.03,
          width: mediaQuery.height * 0.03,
          margin: EdgeInsets.only(
            left: mediaQuery.width * 0.039,
            right: mediaQuery.width * 0.026,
            top: mediaQuery.height * 0.012,
            bottom: mediaQuery.height * 0.0125,
          ),
          child: Image.asset('assets/images/home/search_icon.png'),
        ),
        hintText: hintText,
        hintStyle: kTextStyleMedium.copyWith(
          fontSize: mediaQuery.height * 0.015,
          color: kColorBlack.withOpacity(0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(mediaQuery.height * 0.0125),
          borderSide: const BorderSide(
            color: kColorMainTheme,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(mediaQuery.height * 0.0125),
          borderSide: BorderSide(
            color: kColorMainTheme.withOpacity(0.5),
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
