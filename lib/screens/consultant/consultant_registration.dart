import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/custom_text_form_field.dart';
import '../../utils/global.dart';
import 'consultant_registration_controller.dart';

class ConsultantRegistrationPage extends StatefulWidget {
  const ConsultantRegistrationPage({super.key});

  @override
  State<ConsultantRegistrationPage> createState() => _ConsultantRegistrationPageState();
}

class _ConsultantRegistrationPageState extends State<ConsultantRegistrationPage> {
  final consultantRegistrationController =
  Get.put(ConsultantRegistrationController());

  @override
  void dispose() {
    Get.delete<ConsultantRegistrationController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ConsultantRegistrationController(),
        builder: (cont) {
          consultantRegistrationController.context = context;
          return Scaffold(
            body: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(AppConstants.screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: Text('Consultant Registration',
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
                        const Text('Enter Details',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.black1Color,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: AppConstants.fontFamily)),
                        const SizedBox(height: 15.0),

                        Row(
                          children: [
                            Expanded(
                              child: CustomBoxTextFormField(
                                  controller: consultantRegistrationController.companyNameController,
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
                            controller: consultantRegistrationController.localityController,
                            keyboardType: TextInputType.text,
                            hintText: "Locality",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: consultantRegistrationController.addressController,
                            keyboardType: TextInputType.text,
                            hintText: "Address",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: consultantRegistrationController.contactPersonNameController,
                            keyboardType: TextInputType.text,
                            hintText: "Contact Person Name",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: consultantRegistrationController.experienceController,
                            keyboardType: TextInputType.text,
                            hintText: "Year Of Experience",
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
                                child: Text('Add Language ',
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
                                  child: SvgPicture.asset(ImageConstants.plus)),
                            ],
                          ),
                        ),
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
                                child: Text('Add Social Media Link',
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
                                  child: SvgPicture.asset(ImageConstants.plus)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: consultantRegistrationController.agencyNameController,
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

                        const Text('Company Details',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.black1Color,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: AppConstants.fontFamily)),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: consultantRegistrationController.descriptionController,
                            keyboardType: TextInputType.text,
                            hintText: "Brief Description Of Your Business",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: consultantRegistrationController.operationController,
                            keyboardType: TextInputType.text,
                            hintText: "Operation Since",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: AppColors.borderColor)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Types of Property',
                                  style: TextStyle(
                                      color: AppColors.grey10Color,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      fontFamily: AppConstants.fontFamily)),
                              const SizedBox(height: 15.0),

                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: consultantRegistrationController.propertyList.length,
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return Container(
                                    width: double.maxFinite,
                                    padding: const EdgeInsets.fromLTRB(20,10,10,10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(color: AppColors.grey2BorderColor)
                                    ),
                                    child: Text(consultantRegistrationController  .propertyList[index],
                                        style: const TextStyle(
                                            color: AppColors.grey10Color,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            fontFamily: AppConstants.fontFamily)),
                                  );
                                }, separatorBuilder: (BuildContext context, int index) {
                                return const SizedBox(height: 10);
                              },)
                            ],
                          ),
                        ),
                        const SizedBox(height: 25.0),

                        InkWell(
                          onTap: (){
                            /*Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => const PostPropertyPage()));*/
                          },
                          child: Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            decoration: BoxDecoration(
                              color: AppColors.btnColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text('Next',
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
