// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
import 'package:sultan_mebel/common/enums/bloc_status.dart';
import 'package:sultan_mebel/future/clients_page/presentation/bloc/clients_bloc_bloc.dart';
import 'package:sultan_mebel/future/products/presentation/bloc/warehouse_bloc/warehouse_bloc.dart';

// ignore: must_be_immutable
class CartListDropDownWidget extends StatefulWidget {
  String dropValue;
  List<String> dropListValue;

  CartListDropDownWidget({
    Key? key,
    required this.dropValue,
    required this.dropListValue,
  }) : super(key: key);

  @override
  State<CartListDropDownWidget> createState() => _CartListDropDownWidgetState();
}

class _CartListDropDownWidgetState extends State<CartListDropDownWidget> {
  List<String>? branchList = [];
  List<String>? nameList = [];
  String dropValueBranchs = '';
  String dropValueNames = '';
  
  Future<void> cardClientFunc() async {
    final clientsList = context.read<ClientsBloc>().state.clientsList;
    if (clientsList == null || clientsList.isEmpty) {
      // Add "Empty" only if the list is empty
      nameList?.add("Empty");
      dropValueNames = "Empty";
      return;
    }

    for (var element in clientsList) {
      nameList?.add(element.firstName ?? '');
    }

    if (nameList!.isNotEmpty) {
      dropValueNames = '';
      dropValueNames = nameList![0];
    }
  }

  Future<void> cardFunc() async {
    final branchNames = context.read<WarehouseBloc>().state.branchList;
    if (branchNames == null || branchNames.isEmpty) {
      // Add "Empty" only if the list is empty
      branchList?.add("Empty");
      dropValueBranchs = "Empty";
      return;
    }

    for (var element in branchNames) {
      branchList?.add(element.branch?.name ?? '');
    }

    if (branchList!.isNotEmpty) {
      dropValueBranchs = branchList![0];
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<WarehouseBloc>().add(
          const WarehouseEvent(),
        );
    context.read<ClientsBloc>().add(
          const ClientsBlocEvent(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 50),
      child: Column(
        children: [
          BlocConsumer<WarehouseBloc, WarehouseState>(
            listener: (context, state) {
              if (state.statusGetWarehouse == BlocStatus.completed) {
                cardClientFunc();
              }
            },
            builder: (context, state) {
              if (state.statusGetWarehouse == BlocStatus.inProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return CartDropDownWidget(dropValue: dropValueNames, dropListValue: nameList ?? [], text: "Mijoz");
            },
          ),
          const SizedBox(
            height: 20,
          ),
          BlocConsumer<ClientsBloc, ClientsState>(
            listener: (context, state) {
              if (state.statusGetClients == BlocStatus.completed) {
                cardFunc();
              }
            },
            builder: (context, state) {
              if (state.statusGetClients == BlocStatus.inProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return CartDropDownWidget(dropValue: dropValueBranchs, dropListValue: branchList ?? [], text: "Filial");
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Summa:",
                style: AppTextStyles.body15w4.copyWith(
                  color: AppColors.white,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                height: 30,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                  left: 5,
                  right: 15,
                ),
                decoration: BoxDecoration(
                  color: AppColors.customContainerColor,
                  border: Border.all(
                    color: AppColors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
                child: Text(
                  "100000",
                  style: AppTextStyles.body14w3.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CartDropDownWidget extends StatefulWidget {
  String text;
  String dropValue;
  List<String> dropListValue;
  CartDropDownWidget({
    Key? key,
    required this.text,
    required this.dropValue,
    required this.dropListValue,
  }) : super(key: key);

  @override
  State<CartDropDownWidget> createState() => _CartDropDownWidgetState();
}

class _CartDropDownWidgetState extends State<CartDropDownWidget> {
  String? _selectedValue; // Add this variable to hold the selected value

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.text,
          style: AppTextStyles.body17w5.copyWith(
            color: AppColors.white,
          ),
        ),
        Container(
          width: 200,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.textColorBlack,
            border: Border.all(color: AppColors.grey, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: AppColors.textColorBlack,
              value: _selectedValue ?? widget.dropValue, // Use _selectedValue if set, otherwise use widget.dropValue
              isDense: true,
              style: AppTextStyles.body14w4.copyWith(color: AppColors.white),
              items: widget.dropListValue.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: AppTextStyles.body14w4.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                );
              }).toList(),
              isExpanded: true,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value; // Update the selected value
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
