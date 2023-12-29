import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/assets.dart';
import 'package:sultan_mebel/common/components/custom_app_bar_action_widget.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';
import 'package:sultan_mebel/future/choosen_product/presentation/widgets/choosen_category_container_widget.dart';
import 'package:sultan_mebel/future/choosen_product/presentation/widgets/kirim_dialog.dart';
import 'package:sultan_mebel/future/notifications/presentation/pages/notifications_page.dart';

class ChoosenProductPage extends StatefulWidget {
  const ChoosenProductPage({super.key});

  @override
  State<ChoosenProductPage> createState() => _ChoosenProductPageState();
}

class _ChoosenProductPageState extends State<ChoosenProductPage> {
  Future<void> showMyDialogKirim() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: AppColors.textColorBlack,
          alignment: Alignment.center,
          child: KirimDialog(),
        );
      },
    );
  }

  Future<void> showMyDialog() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: AppColors.textColorBlack,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Ushbu amalni tasdqilaysizmi?",
                  style: AppTextStyles.body18w4.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButtonContainer(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: 120,
                      height: 40.h,
                      color: AppColors.textColorBlack,
                      textButton: "Bekor qilish",
                      textColor: AppColors.white,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomButtonContainer(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: 120,
                      height: 40.h,
                      color: AppColors.yellow,
                      textButton: "Tasdiqlash",
                      textColor: AppColors.textColorBlack,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.textColorBlack,
        leading: Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
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
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: AppColors.yellow,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.plus_one,
                    size: 20,
                    color: AppColors.textColorBlack,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.carouselSliderContainerColor,
                  border: Border.all(
                    color: AppColors.grey,
                    width: 1,
                  ),
                ),
                child: SvgPicture.asset(
                  Assets.icons.plusIcon,
                  width: 30,
                  height: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ChoosenCategoryContainerWidget(
                onTap: () {
                  showMyDialog();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButtonContainer(
                height: 48.h,
                width: double.infinity,
                color: AppColors.yellow,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                textButton: "Kirim qilish",
                textColor: AppColors.textColorBlack,
                onTap: () {
                  showMyDialogKirim();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButtonContainer(
                height: 48.h,
                width: double.infinity,
                color: AppColors.textColorBlack,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                textButton: "Maxsulotni o'chirib yuborish",
                textColor: AppColors.redColor,
                onTap: () {},
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
