import 'package:flutter/material.dart';
import 'package:sultan_mebel/common/assets.dart';
import 'package:sultan_mebel/future/clients_page/presentation/pages/clients_page.dart';
import 'package:sultan_mebel/future/history/presentation/page/history_page.dart';
import 'package:sultan_mebel/future/home/presentation/pages/home_page.dart';
import 'package:sultan_mebel/future/orders/presentation/pages/orders_page.dart';
import 'package:sultan_mebel/future/product_list/presentation/pages/products_page.dart';

// List<String> menuNames = ['Home', 'Statistics', 'Tips', 'Profile'];
List<String> bottomIcons = [
  Assets.icons.home,
  Assets.icons.basket,
  Assets.icons.leddingIcon,
  // Assets.icons.summaIcon,
  Assets.icons.clients,
  Assets.icons.saleIcon,
];
List<Widget> pages = [
  const HomePage(),
  const ProductsPage(),
  const OrdersPage(),
  const ClientsPage(),
  // const ClientsManagmentsPage(),
  const HistoryPage(),
];
