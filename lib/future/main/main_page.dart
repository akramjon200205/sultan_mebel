import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/local_data.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  PageController controller = PageController(initialPage: 0);
  bool canPop = false;

  nextPage(int index) {
    if (selectedIndex != index) {
      selectedIndex = index;
      controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (!didPop) {
          final result = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: AppColors.textColorBlack,
              title: Text(
                "Dasturdan chiqishni xohlaysizmi?",
                style: AppTextStyles.body15w4.copyWith(
                  color: AppColors.white,
                ),
              ),
              actions: [
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      AppColors.choosenProductContainerColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    "No",
                    style: AppTextStyles.body14w4.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      AppColors.choosenProductContainerColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(
                    "Yes",
                    style: AppTextStyles.body14w4.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          );

          if (result != null && result) {
            SystemNavigator.pop();
          }
        }
      },
      child: SafeArea(
        child: Scaffold(
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
      ),
    );
  }
}
