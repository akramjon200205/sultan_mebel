// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sultan_mebel/common/app_colors.dart';
import 'package:sultan_mebel/common/app_text_styles.dart';

Future<void>  showMyDialog(
  BuildContext context,
  {EdgeInsets padding = EdgeInsets.zero}
) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return Padding(
        padding: padding,
        child: Dialog(
          backgroundColor: AppColors.textColorBlack,
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Ushbu amalni tasdiqlaysizmi?",
                  style: AppTextStyles.body18w5.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ShowDialogYesNoWidget(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      containerColor: AppColors.yellow,
                      text: "Ha",
                      textColor: AppColors.textColorBlack,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ShowDialogYesNoWidget(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      text: "Yo'q",
                      containerColor: AppColors.textColorBlack,
                      textColor: AppColors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

// ignore: must_be_immutable
class ShowDialogYesNoWidget extends StatelessWidget {
  String text;
  Color containerColor;
  Color textColor;
  Function onTap;
  ShowDialogYesNoWidget({
    Key? key,
    required this.text,
    required this.containerColor,
    required this.textColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 48,
        width: 65,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: containerColor,
          border: Border.all(
            color: AppColors.greyTextColor,
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.body16w5.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
