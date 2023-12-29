// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';

// ignore: must_be_immutable
class CustomButtonContainer extends StatelessWidget {
  EdgeInsets margin;
  Color color;
  String textButton;
  Color textColor;
  Function onTap;
  double width;
  double height;
  EdgeInsets padding;
  CustomButtonContainer({
    Key? key,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    required this.color,
    required this.textButton,
    required this.textColor,
    required this.onTap,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: InkWell(
        borderRadius: BorderRadius.circular(10.r),
        onTap: () => onTap(),
        child: Container(
          height: height.h,
          padding: padding,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.w,
              color: AppColors.grey,
            ),
            borderRadius: BorderRadius.circular(10.r),
            color: color,
          ),
          child: Text(
            textButton,
            style: AppTextStyles.body16w7.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
