import 'package:flutter/material.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/future/history/presentation/widgets/row_text_history.dart';

class HistoryCustomWidget extends StatelessWidget {
  const HistoryCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.textColorBlack,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RowTextHistoryWidget(textNomi: "Mijoz", subNomi: "Ibrohimov Jamoliddin"),
          const SizedBox(
            height: 10,
          ),
          RowTextHistoryWidget(textNomi: "Sana", subNomi: "12.12.2200"),
          const SizedBox(
            height: 10,
          ),
          RowTextHistoryWidget(textNomi: "Vaqt", subNomi: "26:00"),
          const SizedBox(
            height: 10,
          ),
          RowTextHistoryWidget(textNomi: "Hodim", subNomi: "Ibrohimov Jamoliddin"),
          const SizedBox(
            height: 10,
          ),
          RowTextHistoryWidget(textNomi: "Filial", subNomi: "Mars"),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              "Maxsulotlar",
              style: AppTextStyles.body18w5.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                width: 1,
                color: AppColors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${index + 1} Product1",
                      style: AppTextStyles.body15w4.copyWith(
                        color: AppColors.greyTextColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      "1",
                      style: AppTextStyles.body15w4.copyWith(
                        color: AppColors.greyTextColor,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
