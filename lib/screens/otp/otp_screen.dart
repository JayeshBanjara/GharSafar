import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ghar_safar/screens/dashboard/dashboard.dart';
import 'package:ghar_safar/screens/otp/otp_controller.dart';
import 'package:ghar_safar/utils/global.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpScreenController = Get.put(OtpController());

  @override
  void initState() {
    super.initState();

    Fluttertoast.showToast(
        msg: "OTP sent to mobile number",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }

  @override
  void dispose() {
    Get.delete<OtpController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(
        init: OtpController(),
        builder: (cont) {
          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.screenPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    const Text(
                      'Enter the OTP',
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                          fontFamily: AppConstants.fontFamily),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'We have sent an OTP to 635 265 ****',
                      style: TextStyle(
                          color: AppColors.greyTextColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: AppConstants.fontFamily),
                    ),
                    const SizedBox(height: 30),
                    OtpPinField(
                      key: otpScreenController.otpPinFieldController,
                      onSubmit: (text) {
                        otpScreenController.otp = text;
                        otpScreenController.update();
                      },
                      onChange: (text) {
                        otpScreenController.otp = text;
                        otpScreenController.update();
                      },
                      otpPinFieldStyle: const OtpPinFieldStyle(
                          defaultFieldBorderColor: AppColors.grey2BorderColor,
                          activeFieldBorderColor: AppColors.btnColor,
                          defaultFieldBackgroundColor: Colors.white,
                          activeFieldBackgroundColor: AppColors.lightBlue2,
                          filledFieldBackgroundColor: AppColors.lightBlue2,
                          filledFieldBorderColor: AppColors.btnColor,
                          fieldBorderRadius: 24.0),
                      showCursor: false,
                      otpPinFieldDecoration: OtpPinFieldDecoration.custom,
                      fieldWidth: 70.0,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: ElevatedButton(
                          onPressed: otpScreenController.otp.length < 4
                          ? null :
                          () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Dashboard()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0)))),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                fontFamily: AppConstants.fontFamily),
                          )),
                    ),
                    const SizedBox(height: 30),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Resend OTP in 30 s',
                          style: TextStyle(
                              color: AppColors.greyTextColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontFamily: AppConstants.fontFamily),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
