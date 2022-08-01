import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nailroom/api/httpservies.dart';
import 'package:nailroom/model/user.dart';
import 'package:nailroom/response/loginresponse.dart';
import 'package:nailroom/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {
  Future<bool> registerUser(User user) async {
    bool isSignup = false;
    Response response;
    var url = baseUrl + registerUrl;
    var dio = HttpServices().getDioInstance();

    try {
      response = await dio.post(
        url,
        data: user.toJson(),
      );
      print("ssssss");

      if (response.statusCode == 200) {
        // print("ssssss");
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isSignup;
  }

  // for login user
  Future<bool> login(String username, String password) async {
    bool isLogin = false;
    try {
      var url = baseUrl + loginUrl;
      var dio = HttpServices().getDioInstance();
      debugPrint("Tryyyyyyyyyyyyyyyyyyyyyyyyyyy");
      Response response = await dio.post(
        url,
        data: {
          "Email": username,
          "Password": password,
        },
      );
      debugPrint("Response" + response.data.toString());
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        token = loginResponse.token;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("customertoken", loginResponse.token!);
        isLogin = true;
      }
    } catch (e) {
      debugPrint("Responseeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      debugPrint(e.toString());
    }
    // debugPrint(isLogin.toString());
    return isLogin;
  }
}
