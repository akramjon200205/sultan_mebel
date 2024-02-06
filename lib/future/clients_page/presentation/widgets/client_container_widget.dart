import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/future/clients_page/presentation/bloc/clients_bloc_bloc.dart';

class ClientContainerWidget extends StatelessWidget {
  final int? index;
  ClientContainerWidget({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    var contextClient = context.read<ClientsBloc>().state.clientsList;
    return Container(
      height: 70,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.textColorBlack,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${contextClient?[index!].firstName} ${contextClient?[index!].lastName}" ?? "null",
                style: AppTextStyles.body14w5.copyWith(
                  color: AppColors.white,
                ),
              ),
              Text(
                "${contextClient?[index!].phone}" ?? '0',
                style: AppTextStyles.body13w5.copyWith(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${contextClient?[index!].address}" ?? "",
            style: AppTextStyles.body11w4.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
