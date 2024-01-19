import 'package:flutter/material.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/future/order_page/presentation/widgets/custom_dialog.dart';
import 'package:sultan_mebel/future/selected_orders/presentation/widgets/scheluted_orders_container_widget.dart';

import '../../../../common/components/app_bar_widget.dart';

class SchelutedOrderPage extends StatefulWidget {
  const SchelutedOrderPage({super.key});

  @override
  State<SchelutedOrderPage> createState() => _SchelutedOrderPageState();
}

class _SchelutedOrderPageState extends State<SchelutedOrderPage> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBarWidget(
            arrowBackIcon: false,
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  child: ListView.separated(
                    padding: EdgeInsets.zero.copyWith(
                      top: 0,
                      bottom: 30,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SchelutedOrdersContainerWidget(
                        mijozName: "Jamoliddin Ibrohimov",
                        qabulQilishSana: "02.01.2024",
                        royhatgaOlinganSana: "02.01.2024",
                        summa: "1000000000",
                        value: value,
                        function: () {
                          showMyDialog(context);
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
