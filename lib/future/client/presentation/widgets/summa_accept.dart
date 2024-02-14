import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';
import 'package:sultan_mebel/future/client/presentation/bloc/client_bloc.dart';

// ignore: must_be_immutable
class AcceptSummWidgetContainer extends StatefulWidget {
  TextEditingController textEditingController;
  AcceptSummWidgetContainer({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  @override
  State<AcceptSummWidgetContainer> createState() => _AcceptSummWidgetContainerState();
}

class _AcceptSummWidgetContainerState extends State<AcceptSummWidgetContainer> {
  double summaFunc(String summa) {
    double summ = double.parse(context.read<ClientBloc>().state.clientGet!.loan!) - double.parse(summa);
    return summ;
  }

  @override
  Widget build(BuildContext context) {
    final contextBloc = context.read<ClientBloc>();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColors.grey,
        ),
        color: AppColors.textColorDark,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            "Summa qabul qilish",
            style: AppTextStyles.body20w5.copyWith(
              color: AppColors.white,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Description",
                style: AppTextStyles.body14w3.copyWith(
                  color: AppColors.greyTextColor,
                ),
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  controller: widget.textEditingController,
                  style: AppTextStyles.body14w4.copyWith(
                    color: AppColors.grey,
                  ),
                  decoration: InputDecoration(
                    fillColor: AppColors.customContainerColor,
                    filled: true,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.grey,
                        width: 1,
                      ),
                    ),
                    hintText: "Input something",
                    hintStyle: AppTextStyles.body14w4.copyWith(
                      color: AppColors.grey,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          CustomButtonContainer(
            height: 42,
            width: double.infinity,
            color: AppColors.yellow,
            textButton: "Saqlash",
            textColor: AppColors.textColorBlack,
            onTap: () {
              if (widget.textEditingController.text.isNotEmpty) {
                if (summaFunc(widget.textEditingController.text) >= 0) {
                  contextBloc.add(
                    ClientPatchEvent(
                      contextBloc.state.clientGet?.id,
                      summaFunc(widget.textEditingController.text),
                      contextBloc.state.clientGet?.lastName,
                      contextBloc.state.clientGet?.firstName,
                      contextBloc.state.clientGet?.phone,
                      contextBloc.state.clientGet?.address,
                    ),
                  );
                  context.read<ClientBloc>().add(
                        ClientEvent(
                          context.read<ClientBloc>().state.clientGet?.id,
                        ),
                      );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: AppColors.backgroundColor,
                      content: Text(
                        "Siz kiritgan summa qarzdorlik summasidan ko'p",
                        style: AppTextStyles.body14w3.copyWith(
                          color: AppColors.redColor,
                        ),
                      ),
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
