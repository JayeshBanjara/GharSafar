import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ghar_safar/screens/auth/login_controller.dart';
import 'package:ghar_safar/screens/otp/otp_screen.dart';
import 'package:ghar_safar/utils/global.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required bool isBuyer});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.put(LoginController());

  @override
  void dispose() {
    Get.delete<LoginController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (cont) {
          return Scaffold(
            body: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    ImageConstants.loginImg,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.50,
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    ImageConstants.transparentBg,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.1,
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                DefaultTextStyle(
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 32,
                                      fontFamily: AppConstants.fontFamily),
                                  child: Text('Find The'),
                                ),
                                DefaultTextStyle(
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 32,
                                      fontFamily: AppConstants.fontFamily),
                                  child: Text(' Perfect'),
                                )
                              ],
                            ),
                            const Row(
                              children: [
                                DefaultTextStyle(
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 32,
                                      fontFamily: AppConstants.fontFamily),
                                  child: Text('Place to'),
                                ),
                                DefaultTextStyle(
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 32,
                                      fontFamily: AppConstants.fontFamily),
                                  child: Text(' live'),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: const Color(0x70FFFFFF),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 12.0),
                              child: Row(
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      loginController.selectedCountryImage,
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Theme(
                                    data: Theme.of(context).copyWith(
                                        canvasColor: Colors.lightBlue),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        icon: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                              ImageConstants.dropdownIcon),
                                        ),
                                        value:
                                            loginController.selectedCountryCode,
                                        onChanged: (String? newValue) {
                                          loginController.selectedCountryCode =
                                              newValue!;
                                          loginController.selectedCountryImage =
                                              loginController
                                                  .countryImages[newValue]!;
                                          loginController.update();
                                        },
                                        items: loginController
                                            .countryImages.keys
                                            .toList()
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  fontFamily:
                                                      AppConstants.fontFamily),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Expanded(
                                    child: TextFormField(
                                        cursorColor: Colors.white,
                                        controller: loginController
                                            .phoneNumberController,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(10)
                                        ],
                                        keyboardType: TextInputType.phone,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                            fontFamily:
                                                AppConstants.fontFamily),
                                        decoration: const InputDecoration(
                                          hintText: 'Enter Number',
                                          hintStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18,
                                              fontFamily:
                                                  AppConstants.fontFamily),
                                          border: InputBorder.none,
                                        )),
                                  ),
                                  const SizedBox(width: 5.0),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const OtpScreen()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50.0)))),
                                  child: const Text(
                                    'Send OTP',
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
                    ))
              ],
            ),
          );
        });
  }
}
