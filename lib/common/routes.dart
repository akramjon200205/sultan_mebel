import 'package:flutter/cupertino.dart';
import 'package:sultan_mebel/future/client/presentation/pages/client_page.dart';
import 'package:sultan_mebel/future/home/presentation/pages/home_page.dart';
import 'package:sultan_mebel/future/product/presentation/pages/product_page.dart';
import 'package:sultan_mebel/future/product_list/presentation/pages/products_page.dart';

class Routes {
  static const home = '/';
  static const productsPage = '/productsPage';
  static const productPage = '/productPage';
  static const clientPage = "/clientPage";

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    try {
      final Map<String, dynamic>? args = settings.arguments as Map<String, dynamic>?;
      args ?? <String, dynamic>{};
      switch (settings.name) {
        case productsPage:
          return CupertinoPageRoute(
            settings: const RouteSettings(),
            builder: (_) => const ProductsPage(),
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
