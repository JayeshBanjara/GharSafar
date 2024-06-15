import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/global.dart';
import 'housing_loan_controller.dart';

class HousingLoanPage extends StatefulWidget {
  const HousingLoanPage({super.key});

  @override
  State<HousingLoanPage> createState() => _HousingLoanPageState();
}

class _HousingLoanPageState extends State<HousingLoanPage> {

  final housingLoanController = Get.put(HousingLoanController());

  @override
  void dispose() {
    Get.delete<HousingLoanController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HousingLoanController(),
        builder: (cont) {
          housingLoanController.context = context;
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
                        child: Text('Housing Loan',
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
                              const Text('Apply Home Loan Online\nat Ghar Safar',
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
                                    const Text('Loan Offers from 34+ Banks',
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
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: const BoxDecoration(
                                          color: AppColors.black1Color,
                                          shape: BoxShape.circle
                                      ),
                                    ),
                                    const SizedBox(width: 10.0),
                                    const Text('Highest Loan Value & Lowest ROI',
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
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: const BoxDecoration(
                                          color: AppColors.black1Color,
                                          shape: BoxShape.circle
                                      ),
                                    ),
                                    const SizedBox(width: 10.0),
                                    const Text('Dedicated RM for Property Search',
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
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: const BoxDecoration(
                                          color: AppColors.black1Color,
                                          shape: BoxShape.circle
                                      ),
                                    ),
                                    const SizedBox(width: 10.0),
                                    const Text('Fastest Loan Disbursal',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AppColors.black1Color,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            fontFamily: AppConstants.fontFamily)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        const Text('Loan Eligibility',
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
                            children: [
                              TextFormField(
                                controller: housingLoanController.nameController,
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
                                controller: housingLoanController.mailController,
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
                                controller: housingLoanController.availabilityController,
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
                                controller: housingLoanController.questionController,
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
                              const SizedBox(height: 100),

                              RichText(
                                  text: const TextSpan(
                                      text:
                                      'By continuing I agree to ',
                                      style: TextStyle(
                                          color:AppColors.grey10Color,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          fontFamily: AppConstants.fontFamily),
                                      children: [
                                        TextSpan(
                                            text: 'Ghar Safar',
                                            style: TextStyle(
                                                color:AppColors.black4Color,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                fontFamily: AppConstants.fontFamily))
                                      ])),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                          decoration: BoxDecoration(
                              color: AppColors.btnColor,
                              borderRadius: BorderRadius.circular(50.0)),
                          child: const Text('Check Eligibility',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  fontFamily: AppConstants.fontFamily)),
                        )
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
