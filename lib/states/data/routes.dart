import 'package:dogventurehq/states/bindings/auth.dart';
import 'package:dogventurehq/states/bindings/initial.dart';
import 'package:dogventurehq/states/bindings/products.dart';
import 'package:dogventurehq/ui/screens/add_address/add_address.dart';
import 'package:dogventurehq/ui/screens/address_book/address_book.dart';
import 'package:dogventurehq/ui/screens/cart/cart.dart';
import 'package:dogventurehq/ui/screens/categories/categories.dart';
import 'package:dogventurehq/ui/screens/checkout/checkout.dart';
import 'package:dogventurehq/ui/screens/forgot_password/forgot_password.dart';
import 'package:dogventurehq/ui/screens/home/home.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/screens/orders/orders.dart';
import 'package:dogventurehq/ui/screens/product_details/product_details.dart';
import 'package:dogventurehq/ui/screens/products/products.dart';
import 'package:dogventurehq/ui/screens/profile/profile.dart';
import 'package:dogventurehq/ui/screens/register/register.dart';
import 'package:dogventurehq/ui/screens/splash/splash.dart';
import 'package:dogventurehq/ui/screens/thankyou/thankyou.dart';
import 'package:get/route_manager.dart';

class AllRoutes {
  static List<GetPage> allroutes = [
    GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: LoginScreen.routeName,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: RegisterScreen.routeName,
      page: () => const RegisterScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: CategoriesScreen.routeName,
      page: () => const CategoriesScreen(),
    ),
    GetPage(
      name: ProductsScreen.routeName,
      page: () => const ProductsScreen(),
      binding: ProductsBinding(),
    ),
    GetPage(
      name: AddressBookScreen.routeName,
      page: () => const AddressBookScreen(),
    ),
    GetPage(
      name: AddAddress.routeName,
      page: () => const AddAddress(),
    ),
    GetPage(
      name: CartScreen.routeName,
      page: () => const CartScreen(),
      binding: ProductsBinding(),
    ),
    GetPage(
      name: CheckoutScreen.routeName,
      page: () => const CheckoutScreen(),
    ),
    GetPage(
      name: ThankyouScreen.routeName,
      page: () => const ThankyouScreen(),
    ),
    GetPage(
      name: Orders.routeName,
      page: () => const Orders(),
    ),
    GetPage(
      name: ForgotPasswordScreen.routeName,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: ProfileScreen.routeName,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: ProductDetails.routeName,
      page: () => const ProductDetails(),
      binding: ProductsBinding(),
    ),
  ];
}
