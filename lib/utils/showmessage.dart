import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

void displaySuccessMessage(BuildContext context, String message) {
  MotionToast.success(
    enableAnimation: true,
    description: Text(message),
    toastDuration: const Duration(seconds: 1),
  ).show(context);
}

void displayErrorMessage(BuildContext context, String message) {
  MotionToast.error(
    enableAnimation: true,
    description: Text(message),
    toastDuration: const Duration(seconds: 1),
  ).show(context);
}
