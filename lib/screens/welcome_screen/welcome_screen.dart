import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_safar/screens/auth/login.dart';
import 'package:ghar_safar/screens/welcome_screen/welcome_screen_controller.dart';
import 'package:ghar_safar/utils/global.dart';

import '../broker/broker_registration/broker_registration.dart';
import '../builder/builder_registration/builder_registration.dart';
import '../consultant/consultant_registration.dart';
import '../vastu_export/vastu_export_registration.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final welcomeScreenController = Get.put(WelcomeScreenController());

  @override
  void dispose() {
    Get.delete<WelcomeScreenController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeScreenController>(
        init: WelcomeScreenController(),
        builder: (cont) {
          return Scaffold(
            body: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(AppConstants.screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 110),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageConstants.welcome,
                        width: 245.0,
                        height: 274.0,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'So we can help you find your way, \nwhat are you looking to do?',
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        fontFamily: AppConstants.fontFamily),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'I am...',
                    style: TextStyle(
                        color: AppColors.btnColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        fontFamily: AppConstants.fontFamily),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            welcomeScreenController.isCustomerSelected = true;
                            welcomeScreenController.isBuilderSelected = false;
                            welcomeScreenController.isBrokerSelected = false;
                            welcomeScreenController.isConsultantSelected = false;
                            welcomeScreenController.isVastuSelected = false;
                            welcomeScreenController.update();
                          },
                          child: getChipWidget(
                              'Customer', welcomeScreenController.isCustomerSelected),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            welcomeScreenController.isCustomerSelected = false;
                            welcomeScreenController.isBuilderSelected = true;
                            welcomeScreenController.isBrokerSelected = false;
                            welcomeScreenController.isConsultantSelected = false;
                            welcomeScreenController.isVastuSelected = false;

                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => const BuilderRegistrationPage()));

                            welcomeScreenController.update();
                          },
                          child: getChipWidget(
                              'Builder', welcomeScreenController.isBuilderSelected),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            welcomeScreenController.isCustomerSelected = false;
                            welcomeScreenController.isBuilderSelected = false;
                            welcomeScreenController.isBrokerSelected = true;
                            welcomeScreenController.isConsultantSelected = false;
                            welcomeScreenController.isVastuSelected = false;

                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => const BrokerRegistrationPage()));

                            welcomeScreenController.update();
                          },
                          child: getChipWidget(
                              'Broker', welcomeScreenController.isBrokerSelected),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            welcomeScreenController.isCustomerSelected = false;
                            welcomeScreenController.isBuilderSelected = false;
                            welcomeScreenController.isBrokerSelected = false;
                            welcomeScreenController.isConsultantSelected = true;
                            welcomeScreenController.isVastuSelected = false;

                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => const ConsultantRegistrationPage()));

                            welcomeScreenController.update();
                          },
                          child: getChipWidget('Consultant',
                              welcomeScreenController.isConsultantSelected),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            welcomeScreenController.isCustomerSelected = false;
                            welcomeScreenController.isBuilderSelected = false;
                            welcomeScreenController.isBrokerSelected = false;
                            welcomeScreenController.isConsultantSelected = false;
                            welcomeScreenController.isVastuSelected = true;

                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => const VastuExportRegistrationPage()));

                            welcomeScreenController.update();
                          },
                          child: getChipWidget(
                              'Vastu Export', welcomeScreenController.isVastuSelected),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child:Container(),
                      )
                    ],
                  ),
                  Expanded(child: Container()),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen(
                                  isBuyer:
                                      welcomeScreenController.isCustomerSelected)));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0)))),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              fontFamily: AppConstants.fontFamily),
                        )),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget getChipWidget(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 35.0),
      decoration: BoxDecoration(
          color: isSelected ? AppColors.btnColor : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
              color: isSelected ? AppColors.btnColor : AppColors.borderColor)),
      child: Text(
        label,
        style: TextStyle(
            color: isSelected ? Colors.white : AppColors.greyTextColor,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontFamily: AppConstants.fontFamily),
        textAlign: TextAlign.center,
      ),
    );
  }
}
