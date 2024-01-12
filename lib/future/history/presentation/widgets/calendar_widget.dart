// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/utills/extensions.dart';

// ignore: must_be_immutable
class CalendarWidget extends StatefulWidget {
  TextEditingController controller;
  CalendarWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context, initialDate: selectedDate, firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: TextField(
        controller: widget.controller,
        style: AppTextStyles.body12w4.copyWith(
          color: AppColors.greyTextColor,
        ),
        readOnly: true,
        decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.greyTextColor,
            ),
          ),
          hintText: DateTime.now().toString().formatDate(),
          hintStyle: AppTextStyles.body12w4.copyWith(
            color: AppColors.greyTextColor,
          ),
          suffixIcon: IconButton(
            onPressed: () => _selectDate(context).then(
              (value) => widget.controller.text = selectedDate.toString().formatDate(),
            ),
            icon: const Icon(
              Icons.calendar_month,
              size: 20,
            ),
          ),
          suffixIconColor: AppColors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        ),
      ),
    );
  }
}
