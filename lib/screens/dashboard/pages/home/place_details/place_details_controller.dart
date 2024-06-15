import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/global.dart';

class PlaceDetailsController extends GetxController {

  late BuildContext context;

  int currentIndex = 0;

  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController availabilityController = TextEditingController();
  TextEditingController questionController = TextEditingController();

}
