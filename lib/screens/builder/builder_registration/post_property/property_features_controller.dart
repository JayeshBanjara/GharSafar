import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PropertyFeaturesController extends GetxController {

  late BuildContext context;

  TextEditingController propertyNameController = TextEditingController();
  TextEditingController bedroomController = TextEditingController();
  TextEditingController bathroomPriceController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController facingController = TextEditingController();
  TextEditingController furnishedController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  File? image;
  final picker = ImagePicker();


}
