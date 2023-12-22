import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/assets.dart';
import 'package:sultan_mebel/common/components/custom_app_bar_action_widget.dart';
import 'package:sultan_mebel/common/local_data.dart';
import 'package:sultan_mebel/future/notifications/presentation/pages/notifications_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  PageController controller = PageController(initialPage: 0);

  nextPage(int index) {
    selectedIndex = index;
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.textColorBlack,
        leading: Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              Assets.icons.arrowBackIcon,
              height: 20,
              width: 20,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Sultan Mebel",
          style: AppTextStyles.body18w6.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          CustomAppBarActionWidget(
            iconTextAssets: Assets.icons.iconNotification,
            function: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const NotificationsPage();
                  },
                ),
              );
            },
          ),
          const SizedBox(
            width: 10,
          ),
          CustomAppBarActionWidget(
            margin: const EdgeInsets.only(right: 15),
            iconTextAssets: Assets.icons.iconUser,
            function: () {},
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: pages,
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.textColorBlack,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            bottomIcons.length,
            (index) => InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                nextPage(index);
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.customContainerColor,
                ),
                child: SvgPicture.asset(
                  bottomIcons[index],
                  width: 20,
                  height: 20,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
