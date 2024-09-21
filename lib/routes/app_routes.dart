// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/shop/screens/wishList/wishlist.dart';

import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/password_configuration/forget_password.dart';
import '../features/authentication/screens/password_configuration/reset_password.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/authentication/screens/signup/verify_email.dart';
import '../features/personalzation/screens/address/address.dart';
import '../features/personalzation/screens/profile/profile.dart';
import '../features/personalzation/screens/settings/settings.dart';
import '../features/shop/screens/all_products/all_products.dart';
import '../features/shop/screens/cart/cart.dart';
import '../features/shop/screens/checkout/checkout.dart';
import '../features/shop/screens/home/home.dart';
import '../features/shop/screens/order/order.dart';
import '../features/shop/screens/store/store.dart';
import '../features/shop/screens/subCategories/sub_categories.dart';
import 'routes.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(name: TRoutes.home, page: () => HomeScreen()),
    GetPage(name: TRoutes.store, page: () => StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => WishlistScreen()),
    GetPage(name: TRoutes.settings, page: () => SettingsScreen()),
    GetPage(name: TRoutes.subCategories, page: () => SubCategoriesScreen(parentId: '')),
    // GetPage(name: TRoutes.search, page: () => SearchScreen()),
    // GetPage(name: TRoutes.productReviews, page: () => ProductReviewsScreen()),
    // GetPage(name: TRoutes.productDetail, page: () => ProductDetailScreen()),
    GetPage(name: TRoutes.order, page: () => OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => CartScreen()),
    // GetPage(name: TRoutes.brand, page: () => BrandScreen()),
    GetPage(name: TRoutes.allProducts, page: () => AllProductsScreen()),
    GetPage(name: TRoutes.userProfile, page: () => ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => SignupScreen()),
    // GetPage(name: TRoutes.signupSuccess, page: () => SignupSuccessScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => VerifyEmailScreen(email: '')),
    GetPage(name: TRoutes.signIn, page: () => LoginScreen()),
    GetPage(name: TRoutes.resetPassword, page: () => ResetPasswordScreen(email: '')),
    GetPage(name: TRoutes.forgetPassword, page: () => ForgetPasswordScreen()),
    GetPage(name: TRoutes.onBoarding, page: () => OnBoardingScreen()),
  ];
}
