import 'package:dogventurehq/states/bindings/auth_binding.dart';
import 'package:dogventurehq/states/bindings/initial.dart';
import 'package:dogventurehq/ui/screens/add_address/add_address.dart';
import 'package:dogventurehq/ui/screens/address_book/address_book.dart';
import 'package:dogventurehq/ui/screens/cart/cart.dart';
import 'package:dogventurehq/ui/screens/categories/categories.dart';
import 'package:dogventurehq/ui/screens/checkout/checkout.dart';
import 'package:dogventurehq/ui/screens/home/home.dart';
import 'package:dogventurehq/ui/screens/login/login.dart';
import 'package:dogventurehq/ui/screens/products/products.dart';
import 'package:dogventurehq/ui/screens/register/register.dart';
import 'package:dogventurehq/ui/screens/splash/splash.dart';
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
    ),
    GetPage(
      name: CheckoutScreen.routeName,
      page: () => const CheckoutScreen(),
    ),
  ];
}
