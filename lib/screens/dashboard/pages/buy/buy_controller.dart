import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class BuyController extends GetxController {

  bool isHomeSelected = true;
  bool isApartmentsSelected = false;
  bool isFlatsSelected = false;
  bool isVillaSelected = false;

  List<bool> isFavouriteSelected = [false,false];
  List<bool> isFavouriteSelected1 = [false,false];
  List<bool> isRecentFavouriteSelected = [false,false,false,false,false];

}