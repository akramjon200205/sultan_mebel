import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/assets.dart';
import 'package:sultan_mebel/common/components/app_bar_widget.dart';
import 'package:sultan_mebel/future/order_page/presentation/widgets/custom_container_button.dart';
import 'package:sultan_mebel/future/order_page/presentation/widgets/custom_dialog.dart';
import 'package:sultan_mebel/future/order_page/presentation/widgets/order_client_widget.dart';
import 'package:sultan_mebel/future/order_page/presentation/widgets/order_date_widget.dart';

import '../widgets/product_count_size_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 60),
          child: CustomAppBarWidget(arrowBackIcon: true),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    alignment: Alignment.center,
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.textColorBlack,
                      border: Border.all(color: AppColors.greyTextColor, width: 1),
                    ),
                    child: SvgPicture.asset(
                      Assets.icons.plusIcon,
                      width: 50,
                      height: 50,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const OrderClientWidget(),
                const SizedBox(
                  height: 20,
                ),
                const OrderDateWidget(),
                const SizedBox(
                  height: 20,
                ),
                const ProductCountSizeWidget(),
                const SizedBox(
                  height: 20,
                ),
                CustomContainerButton(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  onTap: () {
                    showMyDialog(context, padding: const EdgeInsets.only(top: 100));
                  },
                  color: AppColors.yellow,
                  child: Text(
                    "Qabul qilish",
                    style: AppTextStyles.body14w6.copyWith(
                      color: AppColors.textColorBlack,
                    ),
                  ),
                ),
                CustomContainerButton(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  onTap: () {
                    showMyDialog(context, padding: const EdgeInsets.only(top: 100));
                  },
                  color: AppColors.textColorBlack,
                  child: Text(
                    "O'chirish",
                    style: AppTextStyles.body14w6.copyWith(
                      color: AppColors.redColor,
                    ),
                  ),
                ),
                CustomContainerButton(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  onTap: () {
                    showMyDialog(context, padding: const EdgeInsets.only(top: 100));
                  },
                  color: AppColors.textColorBlack,
                  child: Text(
                    "Yakunlash",
                    style: AppTextStyles.body14w6.copyWith(
                      color: AppColors.white,
                    ),
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
