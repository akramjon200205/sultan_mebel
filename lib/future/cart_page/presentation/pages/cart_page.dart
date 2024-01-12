import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';
import 'package:sultan_mebel/future/product/presentation/pages/product_page.dart';
import 'package:sultan_mebel/future/cart_page/presentation/widgets/cart_container_widget.dart';
import 'package:sultan_mebel/future/cart_page/presentation/widgets/cart_page_drop_down_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  TextEditingController controller = TextEditingController();
  int productItmCount = 5;
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
              productItmCount == 0
                  ? Container(
                      height: 250,
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text(
                        "Maxsulotlar tanlanmagan",
                        style: AppTextStyles.body24w5.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    )
                  : SizedBox(
                      child: Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CartContainerWidget(
                              // function: () {},
                              number: 1,
                              controller: controller,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 25,
                            );
                          },
                          itemCount: productItmCount,
                        ),
                      ),
                    ),
              const SizedBox(
                height: 30,
              ),
              CartListDropDownWidget(dropValue: dropValue, dropListValue: dropListValue),
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
