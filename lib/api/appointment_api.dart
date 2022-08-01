import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nailroom/api/httpservies.dart';
import 'package:nailroom/model/book_appointment.dart';
import 'package:nailroom/model/date_time.dart';
import 'package:nailroom/response/appointment_dt_response.dart';
import 'package:nailroom/response/appointment_response.dart';
import 'package:nailroom/response/book_appointment_response.dart';
import 'package:nailroom/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentApi {
  Future<List<DateAndTime?>> loadAppointmentHDT() async {
    List<DateAndTime?> appointmentDTList = [];
    Response response;
    var url = baseUrl + loadAppointmentDT;

    var dio = HttpServices().getDioInstance();

    try {
      response = await dio.get(url);

      if (response.statusCode == 201) {
        AppointmentDTResponse appointmentHDTResponse =
            AppointmentDTResponse.fromJson(response.data);

        for (var data in appointmentHDTResponse.data!) {
          appointmentDTList.add(
            DateAndTime(
              id: data.id,
              date: data.date,
              time: data.time,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to get category $e');
    }

    return appointmentDTList;
  }

  Future<bool> bookAppointment(BookAppointment appointment) async {
    bool? isBooked = false;
    Response response;
    String url = baseUrl + bookAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("customertoken");
      response = await dio.post(
        url,
        data: appointment.toJson(),
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isBooked;
  }

  Future<bool> deleteTime(String date, String time) async {
    bool isDeleted = false;
    Response response;
    String url = baseUrl + deleteAppointmentTimeUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      response = await dio.put(
        url,
        data: {
          "date": date,
          "time": time,
        },
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isDeleted;
  }

  Future<List<AppointmentResponse?>> getBookedAppointment() async {
    List<AppointmentResponse?> appointmentResponseList = [];
    Response response;
    String? url = baseUrl + getBookedAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("customertoken");
      debugPrint("Token: " + token!);
      response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      debugPrint("GetBookedAppointment Response :" + response.data.toString());
      if (response.statusCode == 201) {
        BookAppointmentResponse bookAppointmentResponse =
            BookAppointmentResponse.fromJson(response.data);
        for (var data in bookAppointmentResponse.data!) {
          appointmentResponseList.add(AppointmentResponse(
            date: data.date,
            email: data.email,
            fullname: data.fullname,
            id: data.id,
            mobile: data.mobile,
            customerId: data.customerId,
            time: data.time,
          ));
        }
      }
    } catch (e) {
      debugPrint("Failed to get data:: ${e.toString()}");
    }
    return appointmentResponseList;
  }

  Future<bool> reAddAppointmentTime(String date, String time) async {
    bool? isAdded = false;
    String url = baseUrl + reAddAppointmentTimeUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      Response response = await dio.put(
        url,
        data: {
          "date": date,
          "time": time,
        },
      );
      // debugPrint("Response: " + response.data.toString());
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isAdded;
  }

  Future<bool> deleteAppointment(String appointmentId) async {
    bool isDeleted = false;
    String url = baseUrl + deleteAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("customertoken");
      Response response = await dio.delete(
        url + appointmentId,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      // debugPrint(response.toString());
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isDeleted;
  }

  Future<bool> updateAppointment(
      AppointmentResponse appointmentResponse) async {
    bool isUpdated = false;
    Response response;
    String url = baseUrl + updateAppointmentUrl;
    Dio dio = HttpServices().getDioInstance();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("customertoken");
      response = await dio.put(
        url + appointmentResponse.id!,
        data: {
          "fullname": appointmentResponse.fullname,
          "mobile": appointmentResponse.mobile,
          "email": appointmentResponse.email,
        },
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      // debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return isUpdated;
  }
}
