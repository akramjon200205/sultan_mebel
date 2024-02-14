import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';
import 'package:sultan_mebel/common/components/custom_text_field_container.dart';
import 'package:sultan_mebel/future/client/presentation/bloc/client_bloc.dart';
import 'package:sultan_mebel/future/clients_page/presentation/bloc/clients_bloc_bloc.dart';

class InformationContainer extends StatefulWidget {
  const InformationContainer({super.key});

  @override
  State<InformationContainer> createState() => _InformationContainerState();
}

class _InformationContainerState extends State<InformationContainer> {
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  List<String> firstNameLaseName = [];

  scrapText(TextEditingController controller) {
    if (firstNameLaseName.isNotEmpty) {
      firstNameLaseName = [];
    } else {
      firstNameLaseName = controller.text.split(' ');
      for (var element in firstNameLaseName) {
        log(element);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var contextBloc = context.read<ClientBloc>().state.clientGet;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      // margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColors.grey,
        ),
        borderRadius: BorderRadius.circular(15),
        color: AppColors.textColorDark,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ma'lumotlar",
            style: AppTextStyles.body20w5.copyWith(
              color: AppColors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextFieldContainer(
            textFieldName: "Ism, familiya",
            hintTextTextField: "${contextBloc?.firstName} ${contextBloc?.lastName}",
            controller: nameController,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFieldContainer(
            textFieldName: "Yashash manzili",
            hintTextTextField: "${contextBloc?.address}",
            controller: locationController,
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Telefon raqami",
                style: AppTextStyles.body18w4.copyWith(color: AppColors.greyTextColor),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: phoneController,
                style: AppTextStyles.body18w4.copyWith(
                  color: AppColors.grey,
                ),
                inputFormatters: [
                  MaskTextInputFormatter(
                    mask: '+998 (##) ### ## ##',
                    filter: {"#": RegExp(r'[0-9]')},
                  ),
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.customContainerColor,
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: AppColors.grey,
                      width: 1,
                    ),
                  ),
                  hintText: '${contextBloc?.phone}',
                  hintStyle: AppTextStyles.body18w4.copyWith(
                    color: AppColors.grey,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          CustomButtonContainer(
            color: AppColors.yellow,
            textButton: "Saqlash",
            textColor: AppColors.textColorBlack,
            onTap: () {
              scrapText(nameController);
              if (nameController.text.isEmpty && phoneController.text.isEmpty && locationController.text.isEmpty) {
                return;
              }

              if (nameController.text.isNotEmpty ||
                  phoneController.text.isNotEmpty ||
                  locationController.text.isNotEmpty) {
                context.read<ClientBloc>().add(ClientPatchEvent(
                      contextBloc?.id,
                      double.parse(contextBloc!.loan!),
                      nameController.text.isEmpty
                          ? contextBloc.lastName
                          : (firstNameLaseName.length == 1 ? '' : firstNameLaseName.last),
                      nameController.text.isEmpty ? contextBloc.firstName : firstNameLaseName.first,
                      phoneController.text.isEmpty ? contextBloc.phone : phoneController.text,
                      locationController.text.isEmpty ? contextBloc.address : locationController.text,
                    ));
              }
              // context.read<ClientBloc>().add(ClientEvent(contextBloc?.id));              
              context.read<ClientsBloc>().add(const ClientsBlocEvent());
              // context.read<ClientsBloc>().emit(context.read<ClientsBloc>().state);
            },
            width: double.infinity,
            height: 42,
          ),
        ],
      ),
    );
  }
}
