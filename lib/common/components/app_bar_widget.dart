// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/assets.dart';
import 'package:sultan_mebel/common/routes.dart';

// ignore: must_be_immutable
class CustomAppBarWidget extends StatelessWidget {
  bool arrowBackIcon;
  CustomAppBarWidget({
    Key? key,
    required this.arrowBackIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        height: 60,
        decoration: const BoxDecoration(
          color: AppColors.textColorBlack,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            arrowBackIcon
                ? InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                      Assets.icons.arrowBackIcon,
                      alignment: Alignment.center,
                      width: 25,
                      height: 25,
                      fit: BoxFit.scaleDown,
                    ),
                  )
                : const SizedBox.shrink(),
            Text(
              "Sultan Mebel",
              style: AppTextStyles.body22w4.copyWith(
                color: AppColors.white,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(Routes.notification);
              },
              child: Container(
                width: 35,
                height: 35,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.yellow,
                ),
                child: SvgPicture.asset(
                  Assets.icons.iconNotification,
                  width: 20,
                  height: 20,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
