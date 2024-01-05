import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';
import 'package:sultan_mebel/common/components/custom_dialog_text_field.dart';
import 'package:sultan_mebel/common/components/custom_grid_add_container_widget.dart';
import 'package:sultan_mebel/common/enums/bloc_status.dart';
import 'package:sultan_mebel/future/home/data/datasourses/local_type_mebel_data.dart';
import 'package:sultan_mebel/future/home/presentation/bloc/home_bloc.dart';
import 'package:sultan_mebel/future/home/presentation/widgets/carusel_slider_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController showDialogController = TextEditingController();
  int itemCount = 6;

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
                CustomDialogTextFieldContainer(
                  textFieldName: "Description",
                  hintTextTextField: "Input something",
                  controller: showDialogController,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButtonContainer(
                  height: 40.h,
                  width: 200,
                  color: AppColors.yellow,
                  textButton: "Saqlash",
                  textColor: AppColors.textColorBlack,
                  onTap: () {
                    setState(() {
                      DataTypesMebelList.mebel.add(showDialogController.text);
                      itemCount += 1;
                    });
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtonContainer(
                  height: 40.h,
                  width: 200,
                  color: AppColors.textColorBlack,
                  textButton: "Bekor qilish",
                  textColor: AppColors.white,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
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
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.statusCategory == BlocStatus.completed) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Bloc is Completed"),
              ),
            );
          }
          // if (state.statusCategory == BlocStatus.completed) {
          //   print('completed');
          //   Navigator.pushReplacementNamed(context, Routes.mainPage);
          // } else if (state.statusCategory == BlocStatus.failed) {
          //   print('failed');
          // } else if (state.statusCategory == BlocStatus.unAutorized) {
          //   print('unautorized');
          //   // CustomToast.toast(state.message ?? '');
          // }
        },
        builder: (context, state) {
          if (state.statusCategory == BlocStatus.inProgress) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.yellow,
              ),
            );
          } else if (state.statusCategory == BlocStatus.connectionFailed) {
            return Center(
              child: Text(state.message ?? ""),
            );
          } else if (state.statusCategory == BlocStatus.completed) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const CarouselSliderWidget(),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: itemCount,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.0,
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        if (index < itemCount - 1) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: AppColors.grey,
                                ),
                                color: AppColors.yellow,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                DataTypesMebelList.mebel[index],
                                style: AppTextStyles.body16w5,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        } else {
                          return InkWell(
                            onTap: () {
                              showMyDialog();
                              log(DataTypesMebelList.mebel.last);
                              showDialogController.clear();
                              setState(() {});
                            },
                            child: const CustomGridViewAddContainerWidget(),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Text(state.message ?? "");
          }
        },
      ),
    );
  }
}
