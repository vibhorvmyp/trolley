import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trolley/constants/colors.dart';
import 'package:trolley/constants/textstyles.dart';
import 'package:trolley/models/address/address_model.dart';
import 'package:trolley/routes/routes.dart';
import 'package:trolley/widgets/common/custom_app_bar_with_back.dart';
import 'package:trolley/widgets/dialogs/custom_dialog_medium_size.dart';

import '../../widgets/common/custom_simple_button.dart';
import '../../widgets/dialogs/custom_dialog_large_size.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                //App Bar
                CustomAppBarWithBack(
                  title: "Address".tr,
                ),

                //Address List goes here
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25.h,
                        ),

                        //Addresses Lsit Goes here
                        MyAddressListWidget(
                          addressList: AddressModel.myAddressesList,
                        ),
                        SizedBox(
                          height: 80.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            //Update Button
            Positioned(
              bottom: 20.h,
              left: 0.h,
              right: 0.w,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(addAddressScreen);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.w),
                  child: CustomSimpleButton(
                    buttonTitle: 'Add Address'.tr,
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

class MyAddressListWidget extends StatelessWidget {
  const MyAddressListWidget({
    this.addressList = const [],
    super.key,
  });

  final List<AddressModel> addressList;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(left: 25.w, right: 25.w),
          padding: EdgeInsets.all(15.h),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.w,
              color: addressList[index].defaultFlag == true
                  ? const Color(
                      0xFF79A400,
                    )
                  : kColorWhite,
            ),
            color: kColorWhite,
            borderRadius: BorderRadius.circular(8.h),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 20.h,
                color: addressList[index].defaultFlag == true
                    ? const Color(
                        0xFF79A400,
                      ).withOpacity(0.05)
                    : kColorBlack.withOpacity(0.05),
              ),
            ],
          ),
          height: 189.h,
          width: screenSize.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    addressList[index].title,
                    style: kTextStyleMedium.copyWith(
                      fontSize: 16.sp,
                      color: kColorBlack2,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(editAddressScreen);
                    },
                    child: SizedBox(
                      height: 16.h,
                      width: 16.h,
                      child: Image.asset(
                        'assets/images/address/edit.png',
                      ),
                    ),
                  ),
                ],
              ),

              //Phone
              Text(
                addressList[index].phone,
                style: kTextStyleRegular.copyWith(
                  fontSize: 16.sp,
                  color: kColorBlack2withOpacity75,
                ),
              ),

              //Address
              Text(
                addressList[index].address,
                style: kTextStyleRegular.copyWith(
                  fontSize: 16.sp,
                  color: kColorBlack2withOpacity75,
                ),
              ),

              //Default tag
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  addressList[index].defaultFlag == true
                      ? Container(
                          alignment: Alignment.center,
                          height: 33.h,
                          width: 71.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.h),
                            color: const Color(0xFF79A400).withOpacity(0.05),
                          ),
                          // padding: EdgeInsets.symmetric(
                          //   horizontal: 16,
                          //   vertical: 8,
                          // ),

                          //Default Tag
                          child: Text(
                            'Default'.tr,
                            style: kTextStyleMedium.copyWith(
                              fontSize: 12.sp,
                              color: const Color(
                                0xFF79A400,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            CustomDialogMediumSize(
                          rightButtonTitle: 'Yes'.tr,
                          leftButtonTitle: 'No'.tr,
                          rightButtonSelectedFlag: true,
                          leftButtonSelectedFlag: false,
                          dialogDescription:
                              'Are you sure you want to delete Address?'.tr,
                          dialogTitle: 'Delete Address?'.tr,
                          imgUrl: 'assets/images/dialogs/delete_address.png',
                        ),
                      );
                      print('open delete address dialog');
                    },
                    child: SizedBox(
                      height: 16.h,
                      width: 16.w,
                      child: Image.asset(
                        'assets/images/address/delete.png',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 25.h,
        );
      },
      itemCount: AddressModel.myAddressesList.length,
    );
  }
}
