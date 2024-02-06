import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/assets.dart';
import 'package:sultan_mebel/common/components/custom_button_container.dart';
import 'package:sultan_mebel/common/components/custom_text_field_container.dart';
import 'package:sultan_mebel/common/enums/bloc_status.dart';
import 'package:sultan_mebel/future/client/presentation/pages/client_page.dart';
import 'package:sultan_mebel/future/clients_page/presentation/widgets/client_container_widget.dart';
import 'package:sultan_mebel/future/clients_page/presentation/widgets/phone_number_text_field.dart';

import '../../../../common/components/app_bar_widget.dart';
import '../bloc/clients_bloc_bloc.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  TextEditingController ismFamiliyaController = TextEditingController();
  TextEditingController yashashManziliController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
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

  Future<void> showMyDialog() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 16),
              backgroundColor: AppColors.textColorBlack,
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Ma'lumotlar",
                      style: AppTextStyles.body24w5.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFieldContainer(
                      textFieldName: "Ism, familiya",
                      hintTextTextField: "Input something",
                      controller: ismFamiliyaController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFieldContainer(
                      textFieldName: "Yashash manzili",
                      hintTextTextField: "Input something",
                      controller: yashashManziliController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PhoneNumberTextField(
                      controller: phoneNumberController,
                      textFieldName: "Telefon raqami",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButtonContainer(
                      color: AppColors.yellow,
                      textButton: "Saqlash",
                      textColor: AppColors.textColorBlack,
                      onTap: () {
                        scrapText(ismFamiliyaController);
                        context.read<ClientsBloc>().add(ClientsPostEvent(
                              firstName: firstNameLaseName.first ?? '',
                              lastName: firstNameLaseName.last ?? '',
                              address: yashashManziliController.text,
                              phone: phoneNumberController.text,
                            ));
                        ismFamiliyaController.clear();
                        yashashManziliController.clear();
                        phoneNumberController.clear();
                        context.read<ClientsBloc>().add(const ClientsBlocEvent());
                        Navigator.pop(context);
                      },
                      width: 200,
                      height: 48,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButtonContainer(
                      color: Colors.transparent,
                      textButton: "Bekor qilish",
                      textColor: AppColors.white,
                      onTap: () {
                        setState(() {
                          ismFamiliyaController.clear();
                          yashashManziliController.clear();
                          phoneNumberController.clear();
                        });
                        Navigator.of(context).pop();
                      },
                      width: 200,
                      height: 48,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<ClientsBloc>().add(const ClientsBlocEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppBarWidget(
            arrowBackIcon: false,
          ),
        ),
        body: BlocConsumer<ClientsBloc, ClientsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.statusGetClients == BlocStatus.inProgress) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.white,
                ),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 30, bottom: 25),
              itemBuilder: (context, index) {
                if (index < (state.clientsList?.length ?? 0)) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ClientPage();
                          },
                        ),
                      );
                    },
                    child: ClientContainerWidget(
                      index: index,
                    ),
                  );
                } else {
                  return InkWell(
                    onTap: () {
                      showMyDialog();
                    },
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
              itemCount: (state.clientsList?.length ?? 0) + 1,
            );
          },
        ),
      ),
    );
  }
}
