// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/assets.dart';

// ignore: must_be_immutable
class CarouselSliderWidget extends StatelessWidget {
  CarouselSliderWidget({
    Key? key,
  }) : super(key: key);

  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: controller,
      itemCount: 10,
      itemBuilder: (context, index, realIndex) {
        return Container(
          width: 280,
          height: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.mebel),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: AppColors.grey,
              width: 1,
            ),
            color: AppColors.carouselSliderContainerColor,
          ),
        );
      },
      options: CarouselOptions(
        aspectRatio: 2,
        reverse: false,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        initialPage: 1,
        autoPlay: false,       
        scrollPhysics: const BouncingScrollPhysics(),
      ),
    );
  }
}
