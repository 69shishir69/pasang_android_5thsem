import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nailroom/api/httpservies.dart';
import 'package:nailroom/response/productresponse.dart';
import 'package:nailroom/utils/url.dart';

class ProductApi {
  Future<ProductResponse?> getProduct() async {
    Future.delayed(const Duration(seconds: 2), () {});
    var url = baseUrl + productUrl;
    ProductResponse? productResponse;

    try {
      var dio = HttpServices().getDioInstance();
      Response response = await dio.get(url);
      debugPrint(response.data.toString());
      if (response.statusCode == 201) {
        productResponse = ProductResponse.fromJson(response.data);
        // debugPrint("RRRRRRRRRRRRRRRRRRRRRRRR" +productResponse.toString());
      } else {
        productResponse = null;
      }
    } catch (e) {
      throw Exception(e);
    }
    return productResponse;
  }
}