import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  String selectedCountryCode = '+91';
  String selectedCountryImage = 'assets/images/india.png';
  TextEditingController phoneNumberController = TextEditingController();

  Map<String, String> countryImages = {
    '+91': 'assets/images/india.png',
    '+1': 'assets/images/usa.png',
    '+44': 'assets/images/united_kingdom.png',
  };
}