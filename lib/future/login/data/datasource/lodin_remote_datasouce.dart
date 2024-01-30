import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/models/shared_model.dart';

abstract class HomeRemoteDataSource {
  Future<dynamic> login(String? username, String? password);
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
    
    log("access: ${responce.data['access']}");
    log("refresh: ${responce.data['refresh']}");
    prefs.setString(SharedModel.accessToken, responce.data['access']);
    prefs.setString(SharedModel.refreshToken, responce.data['refresh']);
    log("access: ${prefs.getString(SharedModel.accessToken)}");
    log("refresh: ${prefs.getString(SharedModel.refreshToken)}");
    return responce.data['access'];
  }
}
