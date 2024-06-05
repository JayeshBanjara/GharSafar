import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_safar/screens/auth/login.dart';
import 'package:ghar_safar/screens/welcome_screen/welcome_screen_controller.dart';
import 'package:ghar_safar/utils/global.dart';

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
                    'Choose a few options if you need to.',
                    style: TextStyle(
                        color: AppColors.greyTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: AppConstants.fontFamily),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          welcomeScreenController.isBuySelected = true;
                          welcomeScreenController.isSellSelected = false;
                          welcomeScreenController.isConsultantSelected = false;
                          welcomeScreenController.update();
                        },
                        child: getChipWidget(
                            'Buy', welcomeScreenController.isBuySelected),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          welcomeScreenController.isBuySelected = false;
                          welcomeScreenController.isSellSelected = true;
                          welcomeScreenController.isConsultantSelected = false;
                          welcomeScreenController.update();
                        },
                        child: getChipWidget(
                            'Sell', welcomeScreenController.isSellSelected),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          welcomeScreenController.isBuySelected = false;
                          welcomeScreenController.isSellSelected = false;
                          welcomeScreenController.isConsultantSelected = true;
                          welcomeScreenController.update();
                        },
                        child: getChipWidget('Consultant',
                            welcomeScreenController.isConsultantSelected),
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
                                      welcomeScreenController.isBuySelected)));
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
