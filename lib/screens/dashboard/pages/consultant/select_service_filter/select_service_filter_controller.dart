import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectServiceFilterController extends GetxController {

  late BuildContext context;

  List<String> serviceList = [
    'Home Interiors','Property Lawyers','Carpenter','Interior designer',
    'Home Interiors','Property Lawyers','Carpenter','Interior designer',
    'Home Interiors','Property Lawyers','Carpenter','Interior designer',
    'Home Interiors','Property Lawyers','Carpenter','Interior designer',
  ];

  List<bool> isSelected = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,];

}