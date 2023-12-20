import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/assets.dart';
import 'package:sultan_mebel/common/components/custom_app_bar_action_widget.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';
import 'package:sultan_mebel/future/choosen_product/presentation/pages/choosen_product.dart';
import 'package:sultan_mebel/future/product_list/presentation/widgets/product_container_widget.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  TextEditingController controller = TextEditingController();
  List<String> dropListValue = [
    "Umumiy",
    "Oshhona",
    "Uy",
    "Mebel",
    "Savdo",
  ];
  String dropValue = "";
  String dropValue1 = "";

  @override
  void initState() {
    super.initState();
    dropValue = dropListValue[0];
    dropValue1 = dropListValue[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ProductContainerWidget(
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ChoosenProductPage();
                          },
                        ),
                      );
                    },
                    number: 1,
                    controller: controller,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 25,
                  );
                },
                itemCount: 5,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Mijoz",
                        style: AppTextStyles.body15w4.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 200,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.textColorBlack,
                          border: Border.all(color: AppColors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: AppColors.textColorBlack,
                            value: dropValue,
                            isDense: true,
                            style: AppTextStyles.body14w4.copyWith(color: AppColors.white),
                            items: dropListValue.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: AppTextStyles.body13w4.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                              );
                            }).toList(),
                            isExpanded: true,
                            onChanged: (value) {
                              setState(() {
                                dropValue = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Filial",
                        style: AppTextStyles.body15w4.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 200,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.textColorBlack,
                          border: Border.all(color: AppColors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: AppColors.textColorBlack,
                            value: dropValue1,
                            isDense: true,
                            style: AppTextStyles.body14w4.copyWith(color: AppColors.white),
                            items: dropListValue.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: AppTextStyles.body13w4.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                              );
                            }).toList(),
                            isExpanded: true,
                            onChanged: (value) {
                              setState(() {
                                dropValue1 = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Summa:",
                        style: AppTextStyles.body15w4.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Container(
                        height: 25,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.customContainerColor,
                          border: Border.all(
                            color: AppColors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Text(
                          "100000",
                          style: AppTextStyles.body13w4.copyWith(
                            color: AppColors.grey,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonContainer(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              color: AppColors.yellow,
              textButton: "Saqlash",
              textColor: AppColors.textColorBlack,
              onTap: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonContainer(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              color: AppColors.textColorBlack,
              textButton: "Tozalash",
              textColor: AppColors.redColor,
              onTap: () {},
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
