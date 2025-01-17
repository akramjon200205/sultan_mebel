import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';
import 'package:sultan_mebel/common/models/products_model.dart';
import 'package:sultan_mebel/common/models/shared_model.dart';
import 'package:sultan_mebel/future/cart_page/presentation/widgets/cart_container_widget.dart';
import 'package:sultan_mebel/future/cart_page/presentation/widgets/cart_page_drop_down_widget.dart';
import 'package:sultan_mebel/future/clients_page/presentation/bloc/clients_bloc_bloc.dart';
import 'package:sultan_mebel/future/products/presentation/bloc/warehouse_bloc/warehouse_bloc.dart';

import '../../../../common/components/app_bar_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  TextEditingController controller = TextEditingController();
  int productItmCount = 5;
  List<ProductsModel> productList = [];

  List<String> dropListValue = [
    "Umumiy",
    "Oshhona",
    "Uy",
    "Mebel",
    "Savdo",
  ];

  String dropValue = "";
  String dropValue1 = "";

  Future<void> fetchProducts() async {
    productList = await SharedPreferencesHelper.getProductsList();
    log("${productList.length}");
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchProducts();
    });
    dropValue = dropListValue[0];
    dropValue1 = dropListValue[0];
  }

  Future<void> showMyDialog() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: AppColors.textColorBlack,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Ushbu amalni tasdqilaysizmi?",
                  style: AppTextStyles.body18w4.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButtonContainer(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: 120,
                      height: 40.h,
                      color: AppColors.textColorBlack,
                      textButton: "Bekor qilish",
                      textColor: AppColors.white,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomButtonContainer(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: 120,
                      height: 40.h,
                      color: AppColors.yellow,
                      textButton: "Tasdiqlash",
                      textColor: AppColors.textColorBlack,
                      onTap: () {
                        setState(() {
                          productItmCount += 1;
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBarWidget(
          arrowBackIcon: false,
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Xarid",
                  style: AppTextStyles.body24w5.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: fetchProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CartContainerWidget(
                          index: index,
                          nameProduct: productList[index].name ?? '',
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 25,
                        );
                      },
                      itemCount: productList.length,
                    );
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CartListDropDownWidget(
                dropValue: dropValue,
                dropListValue: dropListValue,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButtonContainer(
                width: double.infinity,
                height: 48,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                color: AppColors.yellow,
                textButton: "Sotish",
                textColor: AppColors.textColorBlack,
                onTap: () {
                  showMyDialog();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButtonContainer(
                width: double.infinity,
                height: 48.h,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                color: AppColors.textColorBlack,
                textButton: "Tozalash",
                textColor: AppColors.redColor,
                onTap: () {
                  setState(() {
                    productItmCount = 0;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
