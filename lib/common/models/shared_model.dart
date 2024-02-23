import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sultan_mebel/common/models/products_model.dart';

class SharedModel {
  static String accessToken = 'accessToken';
  static String refreshToken = 'refreshToken';
}

class SharedPrefSave {
  static String saveMOdel = 'saveModel';
}

class SharedPreferencesHelper {
  static Future<void> saveProduct(ProductsModel product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> productList = prefs.getStringList(SharedPrefSave.saveMOdel) ?? [];
    productList.add(jsonEncode(product.toJson()));
    await prefs.setStringList(SharedPrefSave.saveMOdel, productList);
  }

  static Future<List<ProductsModel>> getProductsList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? productJsonList = prefs.getStringList(SharedPrefSave.saveMOdel);
     List<ProductsModel> products = [];
    if (productJsonList != null) {
      products = productJsonList.map((productJson) {
        Map<String, dynamic> json = jsonDecode(productJson);
        return ProductsModel.fromJson(json);
      }).toList();
    }
    return products;
  }
}
