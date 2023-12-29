import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';
import 'package:sultan_mebel/common/components/custom_text_field_container.dart';
import 'package:sultan_mebel/future/login/presentation/widgets/background_ellipses.dart';
import 'package:sultan_mebel/future/main/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController useNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          const BackgroundEllipsesWidget(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sulatan Mebel",
                  style: AppTextStyles.body24w5.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 50.h,
                ),
                CustomTextFieldContainer(
                  textFieldName: "Foydalanuvchi nomi",
                  hintTextTextField: "Input",
                  controller: useNameController,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextFieldContainer(
                  textFieldName: "Parol",
                  hintTextTextField: "Input",
                  controller: passwordController,
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomButtonContainer(
                  height: 48.h,
                  width: double.infinity,
                  color: AppColors.yellow,
                  textButton: "Kirish",
                  textColor: AppColors.textColorBlack,
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return const MainPage();
                      },
                    ));
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomButtonContainer(
                  height: 48.h,
                  width: double.infinity,
                  color: AppColors.textColorBlack,
                  textButton: "Tozalash",
                  textColor: AppColors.white,
                  onTap: () {
                    setState(() {
                      useNameController.clear();
                      passwordController.clear();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
