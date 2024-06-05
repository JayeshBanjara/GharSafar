import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ghar_safar/screens/dashboard/pages/buy/buy_controller.dart';
import 'package:ghar_safar/utils/global.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  final buyController = Get.put(BuyController());

  @override
  void dispose() {
    Get.delete<BuyController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: BuyController(),
        builder: (cont) {
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.all(AppConstants.screenPadding),
            child: Column(
              children: [
                const SizedBox(height: 45),
                Row(
                  children: [
                    const CircleAvatar(
                        radius: 25.0,
                        backgroundImage:
                        AssetImage(ImageConstants.tempPersonImg)),
                    const SizedBox(width: 15),
                    const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hey! Kishan Thakkar',
                              style: TextStyle(
                                  color: AppColors.greyTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontFamily: AppConstants.fontFamily),
                            ),
                            Text(
                              'Welcome back',
                              style: TextStyle(
                                  color: AppColors.greyTextColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  fontFamily: AppConstants.fontFamily),
                            )
                          ],
                        )),
                    const SizedBox(width: 15),
                    SvgPicture.asset(ImageConstants.bellIcon,
                        width: 50.0, height: 50.0)
                  ],
                ),
                const SizedBox(height: 15.0),
              ],
            ),
          );
        });
  }
}
