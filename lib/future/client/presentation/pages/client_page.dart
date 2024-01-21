import 'package:flutter/material.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/app_bar_widget.dart';
import 'package:sultan_mebel/common/utills/extensions.dart';
import 'package:sultan_mebel/future/client/presentation/widgets/information.dart';
import 'package:sultan_mebel/future/client/presentation/widgets/scheduled_debt.dart';
import 'package:sultan_mebel/future/client/presentation/widgets/summa_accept.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  TextEditingController controller = TextEditingController();
  double summa = 100000;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBarWidget(
            arrowBackIcon: true,
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero.copyWith(bottom: 25, top: 25),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Jamoliddin Ibrohimov",
                  style: AppTextStyles.body22w5.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AcceptSummWidgetContainer(textEditingController: controller),
                const SizedBox(
                  height: 20,
                ),
                const ScheduletDebt(),
                const SizedBox(
                  height: 20,
                ),
                const InformationContainer(),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Umumiy qarz: ${summa.toString().formatAsNumber()}",
                    style: AppTextStyles.body20w4.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
