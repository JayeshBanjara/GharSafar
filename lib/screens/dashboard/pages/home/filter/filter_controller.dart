import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {

  late BuildContext context;
  int currentPage = 1;
  int bedroomValue = 1;
  int bedValue = 1;
  int amenitiesValue = 1;

  int isBuyRentSelected = 1;

  RangeValues currentPriceRange = const RangeValues(3000, 60000);
  RangeValues currentAreaRange = const RangeValues(100, 2000);

}
