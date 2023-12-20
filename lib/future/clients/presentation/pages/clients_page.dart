import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/assets.dart';
import 'package:sultan_mebel/future/clients/presentation/widgets/client_container_widget.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 30, bottom: 25),
        itemBuilder: (context, index) {
          if (index < 5) {
            return const ClientContainerWidget();
          } else {
            return InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(15),
              child: Container(
                alignment: Alignment.center,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.textColorBlack,
                ),
                child: SvgPicture.asset(
                  Assets.icons.plusIcon,
                  height: 25,
                  width: 25,
                  fit: BoxFit.scaleDown,
                ),
              ),
            );
          }
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 15,
          );
        },
        itemCount: 6,
      ),
    );
  }
}
