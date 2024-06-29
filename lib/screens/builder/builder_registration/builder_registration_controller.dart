import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/global.dart';

class BuilderRegistrationController extends GetxController {

  late BuildContext context;

  TextEditingController companyNameController = TextEditingController();
  TextEditingController localityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactPersonNameController = TextEditingController();
  TextEditingController agencyNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController operationController = TextEditingController();

  List<String> propertyList = [
    'Multistory  Apartment','Villa','Studio Apartment','Commercial Shop',
    'Builder Floor Apartment','Residential Plot','Commercial Office Space','Commercial Showroom',
    'Residential House','Penthouse','Office in park/SEZ','Commercial Land',];

}
