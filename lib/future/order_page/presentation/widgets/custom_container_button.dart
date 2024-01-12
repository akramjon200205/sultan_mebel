// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sultan_mebel/common/app_colors.dart';

// ignore: must_be_immutable
class CustomContainerButton extends StatelessWidget {
  EdgeInsets margin;
  Widget child;
  Function onTap;
  Color color;
  CustomContainerButton({
    Key? key,
    required this.margin,
    required this.child,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.greyTextColor,
              width: 1,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
