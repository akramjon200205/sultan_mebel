import 'package:flutter/material.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/assets.dart';
import 'package:sultan_mebel/common/components/custom_app_bar_action_widget.dart';

class NotificationsPage extends StatefulWidget {
  const   NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.textColorBlack,
        centerTitle: true,
        leading: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.yellow,
            size: 20,
          ),
        ),
        title: Text(
          "Sultan Mebel",
          style: AppTextStyles.body18w6.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          CustomAppBarActionWidget(
            iconTextAssets: Assets.icons.iconUser,
            function: () {},
          ),
          const SizedBox(
            width: 10,
          ),
          CustomAppBarActionWidget(
            margin: const EdgeInsets.only(right: 15),
            iconTextAssets: Assets.icons.iconNotification,
            function: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                // physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    decoration: BoxDecoration(
                      color: AppColors.textColorBlack,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Notification Notification",
                              style: AppTextStyles.body18w5.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Notification Notification",
                              style: AppTextStyles.body18w5.copyWith(
                                color: AppColors.white,
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            color: AppColors.yellow,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
