import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/custom_text_form_field.dart';
import '../../../../../utils/global.dart';
import 'broker_edit_profile_controller.dart';

class BrokerEditProfilePage extends StatefulWidget {
  const BrokerEditProfilePage({super.key});

  @override
  State<BrokerEditProfilePage> createState() => _BrokerEditProfilePageState();
}

class _BrokerEditProfilePageState extends State<BrokerEditProfilePage> {
  final brokerEditProfileController =
  Get.put(BrokerEditProfileController());

  @override
  void dispose() {
    Get.delete<BrokerEditProfileController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: BrokerEditProfileController(),
        builder: (cont) {
          brokerEditProfileController.context = context;
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
                                  controller: brokerEditProfileController.companyNameController,
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
                            controller: brokerEditProfileController.localityController,
                            keyboardType: TextInputType.text,
                            hintText: "Locality",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: brokerEditProfileController.numberController,
                            keyboardType: TextInputType.number,
                            hintText: "Mobile Number",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: brokerEditProfileController.addressController,
                            keyboardType: TextInputType.text,
                            hintText: "Address",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: brokerEditProfileController.contactPersonNameController,
                            keyboardType: TextInputType.text,
                            hintText: "Contact Person Name",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: brokerEditProfileController.agencyNameController,
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
                            controller: brokerEditProfileController.descriptionController,
                            keyboardType: TextInputType.text,
                            hintText: "Brief Description Of Your Business",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: brokerEditProfileController.operationController,
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
