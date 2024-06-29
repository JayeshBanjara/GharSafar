import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ghar_safar/screens/builder/profile/edit_profile/edit_profile_controller.dart';

import '../../../../utils/custom_text_form_field.dart';
import '../../../../utils/global.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final editProfileController =
  Get.put(EditProfileController());

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
          editProfileController.context = context;
          return Scaffold(
            body: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(AppConstants.screenPadding),
              child: Column(
                children: [
                  const SizedBox(height: 45),

                  Row(
                    children: [
                      InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios_new,size: 20,)),
                      const Expanded(
                        child: Text('Edit Profile',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.black2Color,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: AppConstants.fontFamily)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25.0),

                  Expanded(child:
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          children: [
                            Expanded(
                              child: CustomBoxTextFormField(
                                  controller: editProfileController.companyNameController,
                                  keyboardType: TextInputType.text,
                                  hintText: "Enter Company Name",
                                  borderRadius: BorderRadius.circular(25),
                                  validator: (value) {
                                    return null;
                                  }),
                            ),
                            const SizedBox(width: 10.0),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 11,horizontal: 20),
                              decoration: BoxDecoration(
                                  color: AppColors.btnColor,
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: AppColors.borderColor)
                              ),
                              child: SvgPicture.asset(ImageConstants.icCamera),
                            )
                          ],
                        ),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: editProfileController.localityController,
                            keyboardType: TextInputType.text,
                            hintText: "Locality",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: editProfileController.numberController,
                            keyboardType: TextInputType.number,
                            hintText: "Mobile Number",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: editProfileController.addressController,
                            keyboardType: TextInputType.text,
                            hintText: "Address",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: editProfileController.contactPersonNameController,
                            keyboardType: TextInputType.text,
                            hintText: "Contact Person Name",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: editProfileController.agencyNameController,
                            keyboardType: TextInputType.text,
                            hintText: "Agency/ Company Name",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        Container(
                          padding: const EdgeInsets.fromLTRB(20,8,5,8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: AppColors.borderColor)
                          ),
                          child: Row(
                            children: [
                              const Expanded(
                                child: Text('Upload your Certification',
                                    style: TextStyle(
                                        color: AppColors.grey10Color,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        fontFamily: AppConstants.fontFamily)),
                              ),
                              Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                      color: AppColors.btnColor,
                                      shape: BoxShape.circle
                                  ),
                                  child: SvgPicture.asset(ImageConstants.icUpload)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: editProfileController.descriptionController,
                            keyboardType: TextInputType.text,
                            hintText: "Brief Description Of Your Business",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: editProfileController.operationController,
                            keyboardType: TextInputType.text,
                            hintText: "Operation Since",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 40.0),

                        InkWell(
                          onTap: (){
                          },
                          child: Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            decoration: BoxDecoration(
                              color: AppColors.btnColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text('Save',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    fontFamily: AppConstants.fontFamily)),
                          ),
                        ),
                        const SizedBox(height: 5.0),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          );
        });
  }
}
