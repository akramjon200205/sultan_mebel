// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/custom_grid_add_container_widget.dart';

class ChooseCategoryGridViewWidget extends StatelessWidget {
  Function onTap;
  ChooseCategoryGridViewWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        if (index < 5) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                15,
              ),
              color: AppColors.textColorBlack,
              border: Border.all(
                width: 1,
                color: AppColors.grey,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Divider(
                  color: AppColors.grey,
                  height: 2,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "product $index",
                        style: AppTextStyles.body13w4.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "100",
                        style: AppTextStyles.body16w5.copyWith(
                          color: AppColors.white,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          );
        } else {
          return InkWell(
            onTap: ()=> onTap(),
            borderRadius: BorderRadius.circular(15),
            child: const CustomGridViewAddContainerWidget(),
          );
        }
      },
    );
  }
}
