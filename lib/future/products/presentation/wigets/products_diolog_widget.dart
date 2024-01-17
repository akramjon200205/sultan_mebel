// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sultan_mebel/common/app_colors.dart';
// import 'package:sultan_mebel/common/app_text_styles.dart';
// import 'package:sultan_mebel/common/components/custom_dialog_text_field.dart';
// import 'package:sultan_mebel/future/products/presentation/bloc/products_bloc.dart';

// import '../../../../common/enums/bloc_status.dart';

// Future<void> showMyProductsDialog(BuildContext context) async {
//   return await showDialog(
//     context: context,
//     builder: (context) {
//       return const SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Padding(
//           padding: EdgeInsets.only(top: 50),
//           child: Dialog(
//             backgroundColor: AppColors.textColorBlack,
//             alignment: Alignment.topCenter,
//             insetPadding: EdgeInsets.symmetric(horizontal: 25),
//             child: ProductsDialogWidget(),
//           ),
//         ),
//       );
//     },
//   );
// }

// class ProductsDialogWidget extends StatefulWidget {
//   const ProductsDialogWidget({
//     super.key,
//   });

//   @override
//   State<ProductsDialogWidget> createState() => _ProductsDialogWidgetState();
// }

// class _ProductsDialogWidgetState extends State<ProductsDialogWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           CustomDialogTextFieldContainer(
//             textFieldName: "Maxsulot nomi",
//             hintTextTextField: "Input something",
//             controller: productNameController,
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           CustomDialogTextFieldContainer(
//             textFieldName: "Narx",
//             hintTextTextField: "Input something",
//             controller: productPriceController,
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           CustomDialogTextFieldContainer(
//             textFieldName: "O'lcham",
//             hintTextTextField: "Input something",
//             controller: productSizeController,
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Kategoriya",
//                 style: AppTextStyles.body18w4.copyWith(
//                   color: AppColors.greyTextColor,
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               BlocConsumer<ProductsBloc, ProductsState>(
//                 listener: (context, state) {},
//                 builder: (context, state) {
//                   if (state.statusGetProductCategory == BlocStatus.inProgress ||
//                       state.statusGetProductCategory == BlocStatus.inProgress) {
//                     return const Center(
//                       child: CircularProgressIndicator(
//                         color: AppColors.white,
//                       ),
//                     );
//                   }
//                   return Container(
//                     height: 40,
//                     width: double.infinity,
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       color: AppColors.textColorBlack,
//                       border: Border.all(color: AppColors.grey, width: 1),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: DropdownButtonHideUnderline(
//                       child: DropdownButton<String>(
//                         dropdownColor: AppColors.textColorBlack,
//                         value: dropValue1 ?? '',
//                         isDense: true,
//                         style: AppTextStyles.body14w4.copyWith(color: AppColors.white),
//                         items: dropListValue.map<DropdownMenuItem<String>>((String value) {
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text(
//                               value,
//                               style: AppTextStyles.body18w4.copyWith(
//                                 color: AppColors.white,
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                         isExpanded: true,
//                         onChanged: (value) {
//                           dropValue1 = value!;
//                           setState(() {});
//                           context.read<ProductsBloc>().add(
//                                 ProductsEvent(
//                                   findIdByName(dropValue!, result),
//                                 ),
//                               );
//                           // ignore: invalid_use_of_visible_for_testing_member
//                           context.read<ProductsBloc>().emit(state);
//                         },
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           CustomButtonContainer(
//             width: double.infinity,
//             height: 48.h,
//             color: AppColors.yellow,
//             textButton: "Saqlash",
//             textColor: AppColors.textColorBlack,
//             onTap: () {
//               int id = findIdByName(dropValue1!, result);
//               context.read<ProductsBloc>().add(
//                     ProductPostEvent(
//                       productNameController.text,
//                       productSizeController.text,
//                       id,
//                       double.parse(productPriceController.text),
//                     ),
//                   );
//               productNameController.clear();
//               productPriceController.clear();
//               productSizeController.clear();
//               Navigator.of(context).pop();
//             },
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           CustomButtonContainer(
//             height: 48.h,
//             width: double.infinity,
//             color: AppColors.textColorBlack,
//             textButton: "Bekor qilish",
//             textColor: AppColors.white,
//             onTap: () {
//               productNameController.clear();
//               productPriceController.clear();
//               productSizeController.clear();
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
