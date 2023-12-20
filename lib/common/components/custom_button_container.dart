// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';

// ignore: must_be_immutable
class CustomButtonContainer extends StatefulWidget {
  EdgeInsets margin;
  Color color;
  String textButton;
  Color textColor;
  Function onTap;
  CustomButtonContainer({
    Key? key,
    this.margin = EdgeInsets.zero,
    required this.color,
    required this.textButton,
    required this.textColor,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomButtonContainer> createState() => _CustomButtonContainerState();
}

class _CustomButtonContainerState extends State<CustomButtonContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      onTap: () => widget.onTap(),
      child: Container(
        height: 48.h,
        margin: widget.margin,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.w,
            color: AppColors.grey,
          ),
          borderRadius: BorderRadius.circular(10.r),
          color: widget.color,
        ),
        child: Text(
          widget.textButton,
          style: AppTextStyles.body16w7.copyWith(color: widget.textColor),
        ),
      ),
    );
  }
}
