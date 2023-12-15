import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sultan_mebel/common/assets.dart';

class BackgroundEllipsesWidget extends StatelessWidget {
  const BackgroundEllipsesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size sizeMediaQuery = MediaQuery.of(context).size;
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: SvgPicture.asset(
            Assets.images.ellipseBig,
            width: sizeMediaQuery.width * 0.7,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset(
            Assets.images.ellipseSmall,
            width: sizeMediaQuery.width * 0.33,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: sizeMediaQuery.height * 0.14),
          child: Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              Assets.images.ellipseMiddle,
              width: sizeMediaQuery.width * 0.35,
            ),
          ),
        )
      ],
    );
  }
}
