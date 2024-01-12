import 'package:flutter/material.dart';
import 'package:sultan_mebel/common/assets.dart';
import 'package:sultan_mebel/future/clients_page/presentation/pages/clients_page.dart';
import 'package:sultan_mebel/future/history/presentation/page/history_page.dart';
import 'package:sultan_mebel/future/home/presentation/pages/home_page.dart';
import 'package:sultan_mebel/future/orders/presentation/pages/orders_page.dart';
import 'package:sultan_mebel/future/cart_page/presentation/pages/cart_page.dart';

import '../future/selected_orders/presentation/pages/scheluted_orders_page.dart';

// List<String> menuNames = ['Home', 'Statistics', 'Tips', 'Profile'];
List<String> bottomIcons = [
  Assets.icons.home,
  Assets.icons.basket,
  Assets.icons.leddingIcon,
  Assets.icons.clients,
  Assets.icons.saleIcon,
  Assets.icons.summaIcon,
];
List<Widget> pages = [
  const HomePage(),
  const CartPage(),
  const OrdersPage(),
  const ClientsPage(),
  // const ClientsManagmentsPage(),
  const HistoryPage(),
  const SchelutedOrderPage(),
];
