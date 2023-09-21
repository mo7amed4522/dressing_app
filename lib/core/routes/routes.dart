import 'package:dressing_app/core/routes/app_route.dart';
import 'package:dressing_app/view/screen/collection_screen/collection_screen.dart';
import 'package:dressing_app/view/screen/edit_profile_screen/edit_profile_screen.dart';
import 'package:dressing_app/view/screen/forget_password_screen/forget_password_screen.dart';
import 'package:dressing_app/view/screen/get_start_screen/get_start_screen.dart';
import 'package:dressing_app/view/screen/home_screen/home_screen.dart';
import 'package:dressing_app/view/screen/login_screen/login_screen.dart';
import 'package:dressing_app/view/screen/make_order_screen/make_order_screen.dart';
import 'package:dressing_app/view/screen/product_screen/product_screen.dart';
import 'package:dressing_app/view/screen/register_screen/register_screen.dart';
import 'package:dressing_app/view/screen/verfiy_code_screen/verfiy_code_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRouter.start, page: () => const GetStartScreen(), transition: Transition.fadeIn),
  GetPage(name: AppRouter.loginScreen, page: () => const LoginScreen(), transition: Transition.fadeIn),
  GetPage(name: AppRouter.registerScreen, page: () => const RegisterScreen(), transition: Transition.fadeIn),
  GetPage(name: AppRouter.forgetPasswordScreen, page: () => const ForgetPasswordScreen(), transition: Transition.fadeIn),
  GetPage(name: AppRouter.homeScreen, page: () => const HomeScreen(), transition: Transition.fadeIn),
  GetPage(name: AppRouter.verfiyCodeScreen, page: () => const VerfiyCodeScreen(), transition: Transition.fadeIn),
  GetPage(name: AppRouter.productScreen, page: () => const ProductScreen(), transition: Transition.fadeIn),
  GetPage(name: AppRouter.editProfileScreen, page: () => const EditProfileScreen(), transition: Transition.fadeIn),
  GetPage(name: AppRouter.collectionScreen, page: () => const CollectionScreen(), transition: Transition.fadeIn),
  GetPage(name: AppRouter.makeOrderScreen, page: () => const MakeOrderScreen(), transition: Transition.fadeIn),
];
