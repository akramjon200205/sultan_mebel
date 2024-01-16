import 'package:flutter/cupertino.dart';
import 'package:sultan_mebel/future/client/presentation/pages/client_page.dart';
import 'package:sultan_mebel/future/home/presentation/pages/home_page.dart';
import 'package:sultan_mebel/future/login/presentation/pages/login_page.dart';
import 'package:sultan_mebel/future/main/main_page.dart';
import 'package:sultan_mebel/future/product/presentation/pages/product_page.dart';
import 'package:sultan_mebel/future/cart_page/presentation/pages/cart_page.dart';
import 'package:sultan_mebel/future/products/presentation/pages/products_page.dart';

class Routes {
  static const home = '/home';
  static const login = '/';
  static const cartPage = '/cartPage';
  static const productPage = '/productPage';
  static const clientPage = "/clientPage";
  static const productsPage = '/productsPage';
  static const mainPage = '/mainPage';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    try {
      final Map<String, dynamic>? args = settings.arguments as Map<String, dynamic>?;
      args ?? <String, dynamic>{};
      switch (settings.name) {
        case mainPage:
          return CupertinoPageRoute(
            settings: const RouteSettings(),
            builder: (_) => const MainPage(),
          );
        case login:
          return CupertinoPageRoute(
            settings: const RouteSettings(),
            builder: (_) => const LoginPage(),
          );
        case home:
          return CupertinoPageRoute(
            settings: const RouteSettings(),
            builder: (_) => const HomePage(),
          );
        case cartPage:
          return CupertinoPageRoute(
            settings: const RouteSettings(),
            builder: (_) => const CartPage(),
          );
        case productPage:
          return CupertinoPageRoute(
            settings: const RouteSettings(),
            builder: (_) => const ProductPage(),
          );
        case clientPage:
          return CupertinoPageRoute(
            settings: const RouteSettings(),
            builder: (_) => const ClientPage(),
          );
        case productsPage:
          return CupertinoPageRoute(
            settings: const RouteSettings(),
            builder: (_) =>  ProductsPage(
              index: args?['index'],
              productsCategoriesName: args?['productName'],
            ),
          );

        default:
          return CupertinoPageRoute(
            settings: const RouteSettings(),
            builder: (_) => const ClientPage(),
          );
      }
    } catch (e) {
      return CupertinoPageRoute(
        settings: const RouteSettings(),
        builder: (_) => const HomePage(),
      );
    }
  }
}
