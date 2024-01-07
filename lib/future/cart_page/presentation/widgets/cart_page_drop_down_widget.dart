// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';

// ignore: must_be_immutable
class CartListDropDownWidget extends StatefulWidget {
  String dropValue;
  List<String> dropListValue;

  CartListDropDownWidget({
    Key? key,
    required this.dropValue,
    required this.dropListValue,
  }) : super(key: key);

  @override
  State<CartListDropDownWidget> createState() => _CartListDropDownWidgetState();
}

class _CartListDropDownWidgetState extends State<CartListDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 50),
      child: Column(
        children: [
          CartDropDownWidget(dropValue: widget.dropValue, dropListValue: widget.dropListValue, text: "Mijoz"),
          const SizedBox(
            height: 20,
          ),
          CartDropDownWidget(dropValue: widget.dropValue, dropListValue: widget.dropListValue, text: "Filial"),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Summa:",
                style: AppTextStyles.body15w4.copyWith(
                  color: AppColors.white,
                ),
              ),
              Container(
                height: 25,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.customContainerColor,
                  border: Border.all(
                    color: AppColors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: Text(
                  "100000",
                  style: AppTextStyles.body13w4.copyWith(
                    color: AppColors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CartDropDownWidget extends StatefulWidget {
  String text;
  String dropValue;
  List<String> dropListValue;
  CartDropDownWidget({
    Key? key,
    required this.text,
    required this.dropValue,
    required this.dropListValue,
  }) : super(key: key);

  @override
  State<CartDropDownWidget> createState() => _CartDropDownWidgetState();
}

class _CartDropDownWidgetState extends State<CartDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.text,
          style: AppTextStyles.body15w4.copyWith(
            color: AppColors.white,
          ),
        ),
        Container(
          height: 35,
          width: 200,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.textColorBlack,
            border: Border.all(color: AppColors.grey, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: AppColors.textColorBlack,
              value: widget.dropValue,
              isDense: true,
              style: AppTextStyles.body14w4.copyWith(color: AppColors.white),
              items: widget.dropListValue.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: AppTextStyles.body13w4.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                );
              }).toList(),
              isExpanded: true,
              onChanged: (value) {
                setState(() {
                  widget.dropValue = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
