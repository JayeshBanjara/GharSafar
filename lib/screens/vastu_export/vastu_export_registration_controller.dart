import 'package:flutter/material.dart';
import 'package:get/get.dart';


class VastuExportRegistrationController extends GetxController {

  late BuildContext context;

  TextEditingController companyNameController = TextEditingController();
  TextEditingController localityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactPersonNameController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController agencyNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController operationController = TextEditingController();

  List<String> propertyList = [
    'Home Interiors','Property Lawyers','Commercial Shop',
    'Home Interiors','Villa','Property Lawyers'];

}
