import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/global.dart';
import 'legal_advice_controller.dart';

class LegalAdvicePage extends StatefulWidget {
  const LegalAdvicePage({super.key});

  @override
  State<LegalAdvicePage> createState() => _LegalAdvicePageState();
}

class _LegalAdvicePageState extends State<LegalAdvicePage> {

  final legalAdviceController = Get.put(LegalAdviceController());

  @override
  void dispose() {
    Get.delete<LegalAdviceController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: LegalAdviceController(),
        builder: (cont) {
          legalAdviceController.context = context;
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
                        child: Text('Legal Advice',
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
                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                          decoration: BoxDecoration(
                              color: AppColors.lightBlue2,
                              border: Border.all(color: AppColors.grey2BorderColor),
                              borderRadius: BorderRadius.circular(25.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('All About Legal Title Check ',
                                  style: TextStyle(
                                      color: AppColors.darkBlueColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      fontFamily: AppConstants.fontFamily)),
                              const SizedBox(height: 15.0),

                              Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: const BoxDecoration(
                                          color: AppColors.black1Color,
                                          shape: BoxShape.circle
                                      ),
                                    ),
                                    const SizedBox(width: 10.0),
                                    const Text('Planning to Buy a New Property?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AppColors.black1Color,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            fontFamily: AppConstants.fontFamily)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15.0),

                              Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        const SizedBox(height: 8.0),
                                        Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: const BoxDecoration(
                                              color: AppColors.black1Color,
                                              shape: BoxShape.circle
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 10.0),
                                     Expanded(
                                       child: Text('Get FREE Assistance on Verification of Property Documents',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: AppColors.black1Color,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              fontFamily: AppConstants.fontFamily)),
                                     ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15.0),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        const Text('Legal Title Check requirement',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.black1Color,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: AppConstants.fontFamily)),
                        const SizedBox(height: 15.0),


                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grey2BorderColor),
                              borderRadius: BorderRadius.circular(25.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: legalAdviceController.nameController,
                                decoration: InputDecoration(
                                    contentPadding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
                                    hintText: 'First Name',
                                    hintStyle: const TextStyle(
                                        fontFamily: AppConstants.fontFamily,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.grey10Color
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: const BorderSide(
                                            color: AppColors.borderColor
                                        ))
                                ),
                              ),
                              const SizedBox(height: 15),

                              TextFormField(
                                controller: legalAdviceController.mailController,
                                decoration: InputDecoration(
                                    contentPadding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
                                    hintText: 'Email',
                                    hintStyle: const TextStyle(
                                        fontFamily: AppConstants.fontFamily,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.grey10Color
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: const BorderSide(
                                            color: AppColors.borderColor
                                        ))
                                ),
                              ),
                              const SizedBox(height: 15),

                              TextFormField(
                                readOnly: true,
                                decoration: InputDecoration(
                                    contentPadding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
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
                              const SizedBox(height: 15),

                              TextFormField(
                                controller: legalAdviceController.availabilityController,
                                decoration: InputDecoration(
                                    contentPadding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
                                    hintText: 'Address',
                                    hintStyle: const TextStyle(
                                        fontFamily: AppConstants.fontFamily,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.grey10Color
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: const BorderSide(
                                            color: AppColors.borderColor
                                        ))
                                ),
                              ),
                              const SizedBox(height: 15),

                              TextFormField(
                                maxLines: 5,
                                controller: legalAdviceController.questionController,
                                decoration: InputDecoration(
                                    contentPadding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
                                    hintText: 'Write your FREE Question',
                                    hintStyle: const TextStyle(
                                        fontFamily: AppConstants.fontFamily,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.grey10Color
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: const BorderSide(
                                            color: AppColors.borderColor
                                        ))
                                ),
                              ),
                              const SizedBox(height: 15),

                              RichText(
                                  text: const TextSpan(
                                      text:
                                      'By continuing I agree to Ghar Safar ',
                                      style: TextStyle(
                                          color:AppColors.grey10Color,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          fontFamily: AppConstants.fontFamily),
                                      children: [
                                        TextSpan(
                                            text: 'T&C,\nPrivacy policy ',
                                            style: TextStyle(
                                                color:AppColors.black4Color,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                fontFamily: AppConstants.fontFamily))
                                      ])),
                              const SizedBox(height: 15),
                              Container(
                                width: double.maxFinite,
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                                decoration: BoxDecoration(
                                    color: AppColors.btnColor,
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: const Text('Ask Question',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                        fontFamily: AppConstants.fontFamily)),
                              )
                            ],
                          ),
                        ),
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
