import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class OtpController extends GetxController {
  final otpPinFieldController = GlobalKey<OtpPinFieldState>();
  String otp = '';
}