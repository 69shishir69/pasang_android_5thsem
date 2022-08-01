import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nailroom/api/httpservies.dart';
import 'package:nailroom/model/user.dart';

import 'package:nailroom/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileApi {
  // Future<User?> getUserDetails() async {
  // User? user;
  // try {
  //   var url = baseUrl + profile;
  //   var dio = HttpServices().getDioInstance();
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString("token");
  //   var response = await dio.get(
  //     url,
  //     options: Options(
  //       headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
  //     ),
  //   );
  //   debugPrint(response.data.toString());
  //   if (response.statusCode == 201) {
  //     user = User.fromJson(response.data);
  //   }
  // } catch (e) {
  //   debugPrint("Error: ${e.toString()}");
  // }
  // return user;
// }

}
