import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostPropertyController extends GetxController {

  late BuildContext context;

  int currentPage = 1;
  String? selectedItem;
  final List<String> dropdownItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  String? selectedCoveredItem;
  final List<String> coveredItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  String? selectedCarpetItem;
  final List<String> carpetItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  String? selectedCityItem;
  final List<String> cityItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  String? selectedLocalityItem;
  final List<String> localityItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  String? selectedProjectItem;
  final List<String> projectItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  TextEditingController rentController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController totalPriceController = TextEditingController();


}
