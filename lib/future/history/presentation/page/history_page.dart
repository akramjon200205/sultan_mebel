import 'package:flutter/material.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/utills/extensions.dart';
import 'package:sultan_mebel/future/history/presentation/widgets/history_custom_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  TextEditingController beginDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

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
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Savdo",
                    style: AppTextStyles.body22w4.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 130,
                        child: TextField(
                          controller: beginDateController,
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
                                (value) => beginDateController.text = selectedDate.toString().formatDate(),
                              ),
                              icon: const Icon(
                                Icons.calendar_month,
                                size: 20,
                              ),
                            ),
                            suffixIconColor: AppColors.white,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: 130,
                        child: TextField(
                          controller: endDateController,
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
                                (value) => endDateController.text = selectedDate.toString().formatDate(),
                              ),
                              icon: const Icon(
                                Icons.calendar_month,
                                size: 20,
                              ),
                            ),
                            suffixIconColor: AppColors.white,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero.copyWith(
                  bottom: 25,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const HistoryCustomWidget();
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
