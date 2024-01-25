import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/assets.dart';
import 'package:sultan_mebel/common/components/app_bar_widget.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';
import 'package:sultan_mebel/common/enums/bloc_status.dart';
import 'package:sultan_mebel/future/product/presentation/bloc/product_bloc.dart';
import 'package:sultan_mebel/future/product/presentation/widgets/product_page_container_widget.dart';
import 'package:sultan_mebel/future/product/presentation/widgets/kirim_dialog.dart';

class ProductPage extends StatefulWidget {
  final int id;
  const ProductPage({super.key, required this.id});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<void> showMyDialogKirim() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          backgroundColor: AppColors.textColorBlack,
          alignment: Alignment.center,
          child: KirimDialog(),
        );
      },
    );
  }

  @override
  void initState() {
    context.read<ProductBloc>().add(ProductEvent(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBarWidget(arrowBackIcon: true),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          physics: const BouncingScrollPhysics(),
          child: BlocConsumer<ProductBloc, ProductState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state.statusGetProduct == BlocStatus.inProgress) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.white,
                  ),
                );
              }
              return Column(
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
                  const ChoosenCategoryContainerWidget(),
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
                    height: 48,
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
              );
            },
          ),
        ),
      ),
    );
  }
}
