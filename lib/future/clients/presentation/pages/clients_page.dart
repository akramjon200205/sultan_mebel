import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/assets.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';
import 'package:sultan_mebel/common/components/custom_text_field_container.dart';
import 'package:sultan_mebel/future/clients/presentation/widgets/client_container_widget.dart';
import 'package:sultan_mebel/future/clients/presentation/widgets/phone_number_text_field.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  TextEditingController ismFamiliyaController = TextEditingController();
  TextEditingController yashashManziliController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Future<void> showMyDialog() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          backgroundColor: AppColors.textColorBlack,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Ma'lumotlar",
                  style: AppTextStyles.body24w5.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFieldContainer(
                  textFieldName: "Ism, familiya, otasining ismi",
                  hintTextTextField: "Input something",
                  controller: ismFamiliyaController,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFieldContainer(
                  textFieldName: "Yashash manzili",
                  hintTextTextField: "Input something",
                  controller: yashashManziliController,
                ),
                const SizedBox(
                  height: 20,
                ),
                PhoneNumberTextField(
                  textFieldName: "Telefon raqami",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtonContainer(
                  color: AppColors.yellow,
                  textButton: "Saqlash",
                  textColor: AppColors.textColorBlack,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  width: 200,
                  height: 48,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButtonContainer(
                  color: Colors.transparent,
                  textButton: "Tozalash",
                  textColor: AppColors.white,
                  onTap: () {
                    setState(() {
                      ismFamiliyaController.clear();
                      yashashManziliController.clear();
                      phoneNumberController.clear();
                    });
                  },
                  width: 200,
                  height: 48,
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
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 30, bottom: 25),
        itemBuilder: (context, index) {
          if (index < 5) {
            return const ClientContainerWidget();
          } else {
            return InkWell(
              onTap: () {
                showMyDialog();
              },
              borderRadius: BorderRadius.circular(15),
              child: Container(
                alignment: Alignment.center,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.textColorBlack,
                ),
                child: SvgPicture.asset(
                  Assets.icons.plusIcon,
                  height: 25,
                  width: 25,
                  fit: BoxFit.scaleDown,
                ),
              ),
            );
          }
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 15,
          );
        },
        itemCount: 6,
      ),
    );
  }
}
