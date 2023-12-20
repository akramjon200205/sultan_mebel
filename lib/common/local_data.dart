import 'package:flutter/material.dart';
import 'package:sultan_mebel/common/assets.dart';
import 'package:sultan_mebel/future/choose_category/presentation/pages/choose_category.dart';
import 'package:sultan_mebel/future/choosen_product/presentation/pages/choosen_product.dart';
import 'package:sultan_mebel/future/clients/presentation/pages/clients_page.dart';
import 'package:sultan_mebel/future/history/presentation/page/history_page.dart';
import 'package:sultan_mebel/future/home/presentation/pages/home_page.dart';
import 'package:sultan_mebel/future/notifications/presentation/pages/notifications_page.dart';
import 'package:sultan_mebel/future/orders/presentation/pages/orders_page.dart';
import 'package:sultan_mebel/future/product_list/presentation/pages/product_list_page.dart';

// List<String> menuNames = ['Home', 'Statistics', 'Tips', 'Profile'];
List<String> bottomIcons = [
  Assets.icons.home,
  Assets.icons.basket,
  Assets.icons.leddingIcon,
  Assets.icons.summaIcon,
  Assets.icons.clients,
  Assets.icons.saleIcon,
];
List<Widget> pages = [
  const HomePage(),
  const ChooseCategory(),
  const ProductListPage(),
  // const ChoosenProductPage(),
  const HistoryPage(),
  const ClientsPage(),
  const OrdersPage(),
];
