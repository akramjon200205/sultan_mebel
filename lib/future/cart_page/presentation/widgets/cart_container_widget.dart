// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/models/products_model.dart';
import 'package:sultan_mebel/common/models/shared_model.dart';

// ignore: must_be_immutable
class CartContainerWidget extends StatefulWidget {
  String nameProduct;
  int index;

  CartContainerWidget({
    Key? key,
    required this.nameProduct,
    required this.index,
  }) : super(key: key);

  @override
  State<CartContainerWidget> createState() => _CartContainerWidgetState();
}

class _CartContainerWidgetState extends State<CartContainerWidget> {
  TextEditingController controller = TextEditingController();
  List<ProductsModel> productList = [];

  String separateVariable = '';

  @override
  void initState() {
    super.initState();

    // Add a listener to the controller
    controller.addListener(() {
      setState(() {
        separateVariable = controller.text;
        print(controller.text);
      });
    });
  }

  Future<void> saveData(int integer) async {
    productList = await SharedPreferencesHelper.getProductsList();

    await SharedPreferencesHelper.saveProductWithQuantity(productList[widget.index], integer);
    log("${productList.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.textColorBlack,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.nameProduct,
                style: AppTextStyles.body18w5.copyWith(
                  color: AppColors.white,
                ),
              ),
              SizedBox(
                width: 150,
                height: 30,
                child: TextField(
                  style: AppTextStyles.body14w4.copyWith(
                    color: AppColors.grey,
                  ),
                  controller: controller,
                  onEditingComplete: () {
                    log(controller.text);
                    // saveData((int.parse(controller.text)));
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: AppColors.grey,
                        width: 1,
                      ),
                    ),
                    hintText: "Maxsulot miqdori",
                    hintStyle: AppTextStyles.body14w4.copyWith(
                      color: AppColors.grey,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            style: AppTextStyles.body20w5.copyWith(
              color: AppColors.grey,
            ),
            decoration: InputDecoration(
              fillColor: AppColors.customContainerColor,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.greyTextColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "Izoh",
              hintStyle: AppTextStyles.body20w5.copyWith(
                color: AppColors.grey,
              ),
            ),
            minLines: 3,
            maxLines: 10,
          ),
        ],
      ),
    );
  }
}
