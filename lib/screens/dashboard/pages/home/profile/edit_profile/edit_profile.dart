import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/global.dart';
import 'edit_profile_controller.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  final editProfileController = Get.put(EditProfileController());

  @override
  void dispose() {
    Get.delete<EditProfileController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: EditProfileController(),
        builder: (cont) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              leading: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios_new)),
              title: const Text('Edit Profile',
                  style: TextStyle(
                      color: AppColors.black2Color,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: AppConstants.fontFamily)),
            ),
            body: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              color: Colors.white,
              padding: const EdgeInsets.all(AppConstants.screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: editProfileController.nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter Name',
                      hintStyle: const TextStyle(
                        fontFamily: AppConstants.fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyTextColor
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                        color: AppColors.grey4Color
                      ))
                    ),
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: editProfileController.mailController,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: const TextStyle(
                            fontFamily: AppConstants.fontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyTextColor
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                color: AppColors.grey4Color
                            ))
                    ),
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.lightBlue2,
                        hintText: '+91 7694  356 362',
                        hintStyle: const TextStyle(
                            fontFamily: AppConstants.fontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.btnColor
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                color: AppColors.btnColor
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                color: AppColors.btnColor
                            ))
                    ),
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: editProfileController.addressController,
                    decoration: InputDecoration(
                        hintText: 'Address',
                        hintStyle: const TextStyle(
                            fontFamily: AppConstants.fontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyTextColor
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                color: AppColors.grey4Color
                            ))
                    ),
                  ),

                  Expanded(child: Container()),

                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(50.0)))),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontFamily: AppConstants.fontFamily),
                        )),
                  )
                ],
              ),
            ),
          );
        });
  }
}
