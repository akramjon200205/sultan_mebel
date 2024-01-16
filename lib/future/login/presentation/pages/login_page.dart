import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';
import 'package:sultan_mebel/common/components/custom_text_field_container.dart';
import 'package:sultan_mebel/common/enums/bloc_status.dart';
import 'package:sultan_mebel/common/models/shared_model.dart';
import 'package:sultan_mebel/future/login/presentation/widgets/background_ellipses.dart';
import 'package:sultan_mebel/future/main/main_page.dart';

import '../../../../common/routes.dart';
import '../bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SharedPreferences? sharedPreferences;

  Future sharedPreferencesGet(BuildContext context) async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences?.getString(SharedModel.accessToken) != null) {
      Navigator.of(context).pushNamed(Routes.mainPage);
    } else {
      
    }
  }

  @override
  void initState() {
    super.initState();
    sharedPreferencesGet(context);

    log("${sharedPreferences?.getString(SharedModel.accessToken)}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.statusLogin == BlocStatus.completed) {
            log('completed');
            Navigator.pushReplacementNamed(context, Routes.mainPage);
          } else if (state.statusLogin == BlocStatus.failed) {
            log('failed');
          } else if (state.statusLogin == BlocStatus.unAutorized) {
            log('unautorized');
          }
        },
        builder: (context, state) {
          if (state.statusLogin == BlocStatus.inProgress) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.greyTextColor,
              ),
            );
          }
          return Stack(
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
                      hintTextTextField: "User name",
                      controller: userNameController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFieldContainer(
                      textFieldName: "Parol",
                      hintTextTextField: "Password",
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
                        context.read<LoginBloc>().add(
                              LoginUserEvent(
                                number: userNameController.text,
                                password: passwordController.text,
                              ),
                            );
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
                          userNameController.clear();
                          passwordController.clear();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
