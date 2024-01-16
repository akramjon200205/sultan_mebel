import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/assets.dart';
import 'package:sultan_mebel/common/components/app_bar_widget.dart';
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
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBarWidget(
            arrowBackIcon: false,
          ),
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
                    color: selectedIndex == index ? AppColors.yellow : AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
