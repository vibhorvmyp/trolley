import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trolley/constants/colors.dart';
import 'package:trolley/controllers/change_password/change_password_controller.dart';
import 'package:trolley/widgets/dialogs/custom_dialog_simple.dart';

import '../../widgets/common/custom_app_bar_with_back.dart';
import '../../widgets/common/custom_simple_button.dart';
import '../../widgets/custom_simple_textfield_widget.dart';
// import '../../widgets/dialogs/custom_dialog_large_size.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final changePasswordController = Get.find<ChangePasswordController>();
  final changePasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBg,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                //App bar
                CustomAppBarWithBack(
                  title: 'Change Password'.tr,
                ),

                //Change Password Fields
                Expanded(
                  child: Form(
                    key: changePasswordFormKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25.h,
                        ),

                        //Enter old password field
                        CustomSimpleTextFieldWidget(
                          validator: (value) {
                            String passwordPattern =
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
                            RegExp passwordRegex = RegExp(passwordPattern);

                            if (!passwordRegex.hasMatch(value!)) {
                              return "Please enter valid password";
                            } else {
                              return null;
                            }
                          },
                          controller:
                              changePasswordController.oldPasswordController,
                          iconUrl: 'assets/images/auth/confirm_password.png',
                          hintText: 'Enter Old Password'.tr,
                        ),

                        SizedBox(
                          height: 35.h,
                        ),

                        //Enter new password field
                        CustomSimpleTextFieldWidget(
                          validator: (value) {
                            String passwordPattern =
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
                            RegExp passwordRegex = RegExp(passwordPattern);

                            if (!passwordRegex.hasMatch(value!)) {
                              return "Please enter valid password";
                            } else if (changePasswordController
                                    .oldPasswordController.text ==
                                changePasswordController
                                    .newPasswordPasswordController.text) {
                              return "New password cannot be the same as your old password";
                            } else {
                              return null;
                            }
                          },
                          controller: changePasswordController
                              .newPasswordPasswordController,
                          iconUrl: 'assets/images/auth/password.png',
                          hintText: 'Enter a New Password'.tr,
                        ),

                        SizedBox(
                          height: 35.h,
                        ),

                        //Re-Enter new password field
                        CustomSimpleTextFieldWidget(
                          validator: (value) {
                            if (value !=
                                    changePasswordController
                                        .newPasswordPasswordController.text ||
                                changePasswordController
                                        .confirmNewPasswordController.text ==
                                    '') {
                              return "New Password and confirmation password do not match";
                            }
                            {
                              return null;
                            }
                          },
                          controller: changePasswordController
                              .confirmNewPasswordController,
                          iconUrl: 'assets/images/auth/confirm_password.png',
                          hintText: 'Re-Enter New Password'.tr,
                        ),

                        SizedBox(
                          height: 35.h,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

            //Update Button
            Positioned(
              bottom: 20.h,
              left: 0.h,
              right: 0.w,
              child: GestureDetector(
                onTap: () {
                  if (changePasswordFormKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          CustomDialogCongratsSimple(
                        dialogTitle: 'Congratulations'.tr,
                        dialogDescription:
                            'Your Password has been updated successfully'.tr,
                        imgUrl: 'assets/images/dialogs/congrats.png',
                      ),
                    );
                    print('open congrats dialog');
                  } else {
                    log('not valid');
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.w),
                  child: CustomSimpleButton(
                    buttonTitle: 'Update'.tr,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
