import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/models/shared_model.dart';

abstract class HomeRemoteDataSource {
  Future<dynamic> login(String? phone, String? password);
}

class LoginRemoteDataSourceImpl extends HomeRemoteDataSource {
  Dio dio;

  LoginRemoteDataSourceImpl({required this.dio});

  @override
  Future login(String? username, String? password) async {
    final prefs = await SharedPreferences.getInstance();

    var json = {
      'username': username,
      'password': password,
    };
    final responce = await dio.request(
      'api/token/',
      data: jsonEncode(json),
      options: Options(
        method: 'POST',
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    prefs.setString(SharedModel.accessToken, responce.data['access']);
    prefs.setString(SharedModel.resfreshToken, responce.data['refresh']);
    return responce.data['access'];
  }
}
