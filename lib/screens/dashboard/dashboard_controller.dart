import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class DashboardController extends GetxController {
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}