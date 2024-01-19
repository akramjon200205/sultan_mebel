import 'package:flutter/material.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/future/history/presentation/widgets/history_custom_widget.dart';

import '../../../../common/components/app_bar_widget.dart';
import '../widgets/calendar_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  TextEditingController beginDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBarWidget(
          arrowBackIcon: false,
        ),
      ),
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
                      CalendarWidget(controller: beginDateController),
                      const SizedBox(
                        width: 5,
                      ),
                      CalendarWidget(controller: endDateController),
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
