// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';
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
  List<String>? clientList = [];
  String dropValueBranchs = '';
  String dropValueNames = '';

  cardFunc() {
    final branchNames = context.read<WarehouseBloc>().state.branchList;
    final clientsNames = context.read<ClientsBloc>().state.clientsList;
    if (branchNames != null && clientsNames != null) {
      for (var element in branchNames) {
        branchList?.add(element.branch?.name ?? '');
      }
      for (var element in clientsNames) {
        String? names = "${element.firstName} ${element.lastName}";
        clientList?.add(names);
      }
    }

    if (branchList!.isNotEmpty && clientList!.isNotEmpty) {
      dropValueBranchs = branchList![0];
      dropValueNames = clientList![0];
    }
  }

  @override
  void initState() {
    super.initState();
    cardFunc();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 50),
      child: Column(
        children: [
          CartDropDownWidget(dropValue: dropValueNames, dropListValue: clientList ?? [], text: "Mijoz"),
          const SizedBox(
            height: 20,
          ),
          CartDropDownWidget(dropValue: dropValueBranchs, dropListValue: branchList ?? [], text: "Filial"),
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
          // height: 35,
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
              value: widget.dropValue,
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
                  widget.dropValue = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
