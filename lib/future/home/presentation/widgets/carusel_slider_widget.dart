// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/assets.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
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
        // autoPlay: true,
        // autoPlayCurve: Curves.easeIn,
        // autoPlayInterval: const Duration(seconds: 5),
        scrollPhysics: const BouncingScrollPhysics(),
      ),
    );
  }
}
