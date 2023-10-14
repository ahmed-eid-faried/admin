import 'package:adminapp/core/constant/routes.dart';
import 'package:adminapp/core/middleware/middlewares.dart';
import 'package:adminapp/view/screen/address/add.dart';
import 'package:adminapp/view/screen/address/add_address_details.dart';
import 'package:adminapp/view/screen/address/edit.dart';
import 'package:adminapp/view/screen/address/view.dart';
import 'package:adminapp/view/screen/categories/categoriesadd.dart';
import 'package:adminapp/view/screen/categories/categoriesedit.dart';
import 'package:adminapp/view/screen/categories/categoriesview.dart';
import 'package:adminapp/view/screen/contactus/contactus.dart';
import 'package:adminapp/view/screen/forgetpassword/forget_password.dart';
import 'package:adminapp/view/screen/forgetpassword/reset_password.dart';
import 'package:adminapp/view/screen/forgetpassword/success_resetpassword.dart';
import 'package:adminapp/view/screen/forgetpassword/verfiy_code.dart';
import 'package:adminapp/view/screen/auth/login.dart';
import 'package:adminapp/view/screen/home.dart';
import 'package:adminapp/view/screen/orders/orders_screen.dart';
import 'package:adminapp/view/screen/items/itemsadd.dart';
import 'package:adminapp/view/screen/items/itemsedit.dart';
import 'package:adminapp/view/screen/items/itemsview.dart';
import 'package:adminapp/view/screen/lang.dart';
import 'package:adminapp/view/screen/notifications.dart';
import 'package:adminapp/view/screen/onboarding.dart';
import 'package:adminapp/view/screen/orders/order_archive.dart';
import 'package:adminapp/view/screen/orders/orderdetails.dart';
import 'package:adminapp/view/screen/orders/orders.dart';
import 'package:adminapp/view/screen/settings.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/test", page: () => const OrderDetails()),

  //lang
  GetPage(
      name: AppRoute.lang,
      page: () => const Lang(),
      middlewares: [MiddlewaresLogin()]),

  //Auth
  // GetPage(name: AppRoute.singup, page: () => const SignUp()),
  // GetPage(
  //     name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  // GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.login, page: () => const Login()),

  //forgetpassword
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(
      name: AppRoute.verfiyCodeForgetPassword,
      page: () => const VerfiyCodeForgetPassword()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetpassword()),

  //onboarding
  GetPage(name: AppRoute.onboarding, page: () => const OnBoarding()),
  //home

  GetPage(name: AppRoute.home, page: () => const Home()),
  // Orders
  GetPage(name: AppRoute.orders, page: () => const Orders()),

  //items
  // GetPage(name: AppRoute.items, page: () => const Items()),
  // GetPage(name: AppRoute.itemsdetails, page: () => const ItemsDetails()),
  // favorite
  // GetPage(name: AppRoute.favorite, page: () => const Favorite()),
  // Settings
  GetPage(name: AppRoute.settings, page: () => const Settings()),
  // Cart
  // GetPage(name: AppRoute.cart, page: () => const Cart()),
  // Checkout
  // GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  // OrdersView
  GetPage(name: AppRoute.ordersView, page: () => const OrdersView()),
  // OrderArchive
  GetPage(name: AppRoute.orderarchive, page: () => const OrderArchive()),
  // OrderDetails
  GetPage(name: AppRoute.orderdetails, page: () => const OrderDetails()),
  // address
  GetPage(name: AppRoute.addaddress, page: () => const AddAddress()),
  GetPage(name: AppRoute.addressparttwo, page: () => const AddAddressDetails()),
  GetPage(name: AppRoute.addressedit, page: () => const AddAddressEdit()),
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  // ContactUs
  GetPage(name: AppRoute.contactus, page: () => const ContactUs()),
  // GetPage(
  //     name: AppRoute.customcustomersservice,
  //     page: () => const CustomCustomersService()),
  // Notifications
  GetPage(
      name: AppRoute.notifications,
      page: () => const Notifications(),
      bindings: const []),
  // Offers
  // GetPage(name: AppRoute.offers, page: () => const Offers(), bindings: [
  //   BindingsBuilder.put(() => SearchControllerImp())
  // ]),
  ////////=============================categories==============================//////
  GetPage(name: AppRoute.categoriesview, page: () => const CategoriesView()),
  GetPage(name: AppRoute.categoriesedit, page: () => const CategoriesEdit()),
  GetPage(name: AppRoute.categoriesadd, page: () => const CategoriesAdd()),
  ////////=============================items==============================//////
  GetPage(name: AppRoute.itemsview, page: () => const ItemsView()),
  GetPage(name: AppRoute.itemsedit, page: () => const ItemsEdit()),
  GetPage(name: AppRoute.itemsadd, page: () => const ItemsAdd()),
];
