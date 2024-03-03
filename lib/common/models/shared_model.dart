import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sultan_mebel/common/models/products_model.dart';

class SharedModel {
  static String accessToken = 'accessToken';
  static String refreshToken = 'refreshToken';
}

class SharedPrefSave {
  static String saveModel = 'saveModel';
  static String savePostModel = 'savePostModel';
}

class SharedPreferencesHelper {
  static Future<void> saveProduct(ProductsModel product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> productList = prefs.getStringList(SharedPrefSave.saveModel) ?? [];
    productList.add(jsonEncode(product.toJson()));
    await prefs.setStringList(SharedPrefSave.saveModel, productList);
  }

  static Future<List<ProductsModel>> getProductsList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? productJsonList = prefs.getStringList(SharedPrefSave.saveModel);
    List<ProductsModel> products = [];
    if (productJsonList != null) {
      products = productJsonList.map((productJson) {
        Map<String, dynamic> json = jsonDecode(productJson);
        return ProductsModel.fromJson(json);
      }).toList();
    }
    return products;
  }

  static Future<void> saveProductWithQuantity(ProductsModel product, int quantity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Create a map with product details and quantity
    Map<String, dynamic> productMap = product.toJson();
    productMap['quantity'] = quantity;

    // Encode the map to a JSON string and add it to the product list
    List<String> productString = [];

    productString.add(jsonEncode(productMap));
    log("${productString.length}");
    // Save the updated product list to SharedPreferences
    await prefs.setStringList(SharedPrefSave.savePostModel, productString);
  }
}
