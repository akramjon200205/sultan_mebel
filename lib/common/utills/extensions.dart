import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sultan_mebel/common/app_colors.dart';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension DateFormatter on String {
  String formatDate() {
    DateTime dateTime = DateTime.parse(this);
    DateFormat dateFormat = DateFormat("dd-MM-yyyy");
    String output = dateFormat.format(dateTime);
    return output;
  }

  String formatTime() {
    DateTime dateTime = DateTime.parse(this);
    DateFormat dateFormat = DateFormat("HH:mm");
    String output = dateFormat.format(dateTime);
    return output;
  }

  String formatDateAndTime() {
    DateTime dateTime = DateTime.parse(this);
    DateFormat dateFormat = DateFormat("HH:mm dd.MM.yyyy");
    String output = dateFormat.format(dateTime);
    return output;
  }
}

extension WidgetShimmer on Widget {
  Widget toShimmer({Color? color}) {
    return Shimmer.fromColors(
      baseColor: color ?? AppColors.grey,
      highlightColor: color?.withOpacity(.7) ?? AppColors.grey.withOpacity(.7),
      child: this,
    );
  }
}

extension NumberFormatter on String {
  String formatAsNumber() {
    final number = num.tryParse(replaceAll(' ', ''));
    if (number != null) {
      final formatter = NumberFormat('#,##0');
      return formatter.format(number).replaceAll(',', ' ');
    }
    return this;
  }
}

num numParser(String? text) {
  var replaceText = text?.replaceAll(' ', '');
  if (text != null) {
    return num.parse((replaceText?.isNotEmpty ?? false) ? '${replaceText ?? 0}' : '0');
  }
  return 0;
}

extension PhoneFormatter on String {
  String get phone {
    var code = substring(0, 2);
    var h =   substring(2, 5);
    var s = substring(5, 7);
    var t = substring(7);
    return '+998 ($code) $h - $s - $t';
  }
}

extension PhoneFormatter2 on String {
  String get phone2 {
    var code = substring(0, 2);
    var h = substring(2, 5);
    var s = substring(5, 7);
    var t = substring(7);
    return '+998 ($code) $h-$s-$t';
  }
}

class NumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final String formattedText = newValue.text.replaceAll(RegExp(r'\s+'), '').replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match match) => '${match[1]} ',
        );

    return TextEditingValue(
      text: formattedText,
      selection: newValue.selection.copyWith(
        baseOffset: formattedText.length,
        extentOffset: formattedText.length,
      ),
    );
  }
}

String dateFormatter(DateTime time) {
  String formatterDate = DateFormat('dd-MM-yyyy').format(time);
  return formatterDate;
}

String dateFormatterReverse(DateTime time) {
  String formatterDate = DateFormat('yyyy-MM-dd').format(time);
  return formatterDate;
}

String capitalizeFirstLetter(String? text) {
  if (text == null || text.isEmpty) {
    return text ?? '';
  }
  return text[0].toUpperCase() + text.substring(1).toLowerCase();
}
