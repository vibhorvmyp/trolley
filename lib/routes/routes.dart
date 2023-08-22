import 'package:get/get.dart';
import 'package:trolley/bindings/change_password/change_password_bindings.dart';
import 'package:trolley/bindings/contact_us/contact_us_bindings.dart';
import 'package:trolley/bindings/edit_profile/edit_profile_bindings.dart';
import 'package:trolley/bindings/register/register_bindings.dart';
import 'package:trolley/bindings/reset_password/reset_password_bindings.dart';
import 'package:trolley/bindings/trolley_credits/trolley_credits_bindings.dart';
import 'package:trolley/views/add_address/add_address_screen.dart';
import 'package:trolley/views/address/address_screen.dart';
import 'package:trolley/views/bottom_app_bar/bottom_app_bar_screen.dart';
import 'package:trolley/views/coupons/coupons_screen.dart';
import 'package:trolley/views/enquiries/enquiries_screen.dart';
import 'package:trolley/views/enquiry_chat/enquiry_chat_screen.dart';
import 'package:trolley/views/forgot_password/forgot_password_screen.dart';
import 'package:trolley/views/login/login_screen.dart';
import 'package:trolley/views/otp_verification/otp_verification_screen.dart';
import 'package:trolley/views/product_details/product_details_screen.dart';
import 'package:trolley/views/profile/profile_screen.dart';
import 'package:trolley/views/register/register_screen.dart';
import 'package:trolley/views/sub_categories/sub_categories_screen.dart';

import '../bindings/checkout/checkout_bindings.dart';
import '../bindings/forgot_password/forgot_password_bindings.dart';
import '../bindings/login/login_bindings.dart';
import '../views/about_us/about_us_screen.dart';
import '../views/cancel_order/cancel_order_screen.dart';
import '../views/cart/cart_screen.dart';
import '../views/change_password/change_password_screen.dart';
import '../views/checkout/checkout_screen.dart';
import '../views/contact_us/contact_us_screen.dart';
import '../views/edit_address/edit_address_screen.dart';
import '../views/edit_profile/edit_profile_screen.dart';
import '../views/order_details/order_details_screen.dart';
import '../views/order_successfully_placed/order_successfully_placed_screen.dart';
import '../views/orders/orders_screen.dart';
import '../views/product_listing/product_listing_screen.dart';
import '../views/raise_enquiry/raise_enquiry_screen.dart';
import '../views/reset_password/reset_password_screen.dart';
import '../views/search/search_screen.dart';
import '../views/terms_and_conditions/terms_and_conditions.dart';
import '../views/trolley_credit/trolley_credit_screen.dart';
import '../views/trolley_credit_transactions/trolley_credit_transactions_screen.dart';

const String loginScreen = '/loginScreen';
const String forgotPasswordScreen = '/forgotPasswordScreen';
const String otpVerificationScreen = '/otpVerificationScreen';
const String resetPasswordScreen = '/resetPasswordScreen';
const String changePasswordScreen = '/changePasswordScreen';
const String profileScreen = '/profileScreen';
const String editProfileScreen = '/editProfileScreen';
const String registerScreen = '/registerScreen';
const String contactUsScreen = '/contactUsScreen';
const String enquiriesScreen = '/enquiriesScreen';
const String aboutUsScreen = '/aboutUsScreen';
const String termsAndConditionsScreen = '/termsAndConditionsScreen';
const String ordersScreen = '/ordersScreen';
const String ordersDetailsScreen = '/ordersDetailsScreen';
const String cartScreen = '/cartScreen';
const String addressScreen = '/addressScreen';
const String editAddressScreen = '/editAddressScreen';
const String addAddressScreen = '/addAddressScreen';
const String checkoutScreen = '/checkoutScreen';
const String couponsScreen = '/couponsScreen';
const String bottomAppBarScreen = '/bottomAppBarScreen';
const String trolleyCreditScreen = '/trolleyCreditScreen';
const String subCategoriesScreen = '/subCategoryScreen';
const String productDetailsScreen = '/productDetailsScreen';
const String productListingScreen = '/productListingScreen';
const String raiseEnquiryScreen = '/raiseEnquiryScreen';
const String enquiryChatScreen = '/enquiryChatScreen';
const String searchScreen = '/searchScreen';
const String cancelOrderScreen = '/cancelOrderScreen';
const String orderSuccessfullyPlacedScreen = '/orderSuccessfullyPlacedScreen';
const String trolleyCreditTransactionsScreen =
    '/trolleyCreditTransactionsScreen';

class AppRoute {
  static final routes = [
    // GetPage(name: joinNowScreen, page: () => const JoinNowScreen()),
    // GetPage(
    //     name: signUpScreen,
    //     page: () => SignUpScreen(),
    //     binding: SignUpBindings()),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      binding: ForgotPasswordBindings(),
    ),
    GetPage(
      name: otpVerificationScreen,
      page: () => const OtpVerificationScreen(),
    ),

    GetPage(
      name: resetPasswordScreen,
      page: () => ResetPasswordScreen(),
      binding: ResetPasswordBindings(),
    ),
    GetPage(
      name: changePasswordScreen,
      page: () => ChangePasswordScreen(),
      binding: ChangePasswordBindings(),
    ),
    GetPage(
      name: profileScreen,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: editProfileScreen,
      page: () => EditProfileScreen(),
      binding: EditProfileBindings(),
    ),
    GetPage(
      name: registerScreen,
      page: () => RegisterScreen(),
      binding: RegisterBindings(),
    ),
    GetPage(
      name: contactUsScreen,
      page: () => ContactUsScreen(),
      binding: ContactUsBindings(),
    ),
    GetPage(
      name: enquiriesScreen,
      page: () => const EnquiriesScreen(),
    ),
    GetPage(
      name: aboutUsScreen,
      page: () => const AboutUsScreen(),
    ),
    GetPage(
      name: ordersScreen,
      page: () => const OrdersScreen(),
    ),
    GetPage(
      name: cartScreen,
      page: () => const CartScreen(),
    ),
    GetPage(
      name: ordersDetailsScreen,
      page: () => const OrderDetailsScreen(),
    ),
    GetPage(
      name: addressScreen,
      page: () => const AddressScreen(),
    ),
    GetPage(
      name: editAddressScreen,
      page: () => const EditAddressScreen(),
    ),
    GetPage(
      name: addAddressScreen,
      page: () => const AddAddressScreen(),
    ),
    GetPage(
      name: trolleyCreditScreen,
      page: () => const TrolleyCreditScreen(),
    ),
    GetPage(
      name: trolleyCreditTransactionsScreen,
      page: () => const TrolleyCreditTransactionsScreen(),
      binding: TrolleyCreditsBindings(),
    ),
    GetPage(
      name: checkoutScreen,
      page: () => const CheckoutScreen(),
      binding: CheckoutBindings(),
    ),
    GetPage(
      name: couponsScreen,
      page: () => const CouponsScreen(),
    ),
    GetPage(
      name: bottomAppBarScreen,
      page: () => const BottomAppBarScreen(),
    ),
    GetPage(
      name: termsAndConditionsScreen,
      page: () => const TermsAndConditionsScreen(),
    ),
    GetPage(
      name: productDetailsScreen,
      page: () => const ProductDetailsScreen(),
    ),

    GetPage(
      name: subCategoriesScreen,
      page: () => const SubCategoriesScreen(),
    ),
    GetPage(
      name: orderSuccessfullyPlacedScreen,
      page: () => const OrderSuccessfullyPlacedScreen(),
    ),
    GetPage(
      name: productListingScreen,
      page: () => ProductListingScreen(),
    ),
    GetPage(
      name: raiseEnquiryScreen,
      page: () => const RaiseEnquiryScreen(),
    ),
    GetPage(
      name: enquiryChatScreen,
      page: () => const EnquiryChatScreen(),
    ),
    GetPage(
      name: searchScreen,
      page: () => const SearchScreen(),
    ),
    GetPage(
      name: cancelOrderScreen,
      page: () => CancelOrderScreen(),
    ),
  ];
}
