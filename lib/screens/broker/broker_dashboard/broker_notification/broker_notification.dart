import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/global.dart';
import '../../../../utils/gradient_text.dart';
import 'broker_notification_controller.dart';

class BrokerNotificationPage extends StatefulWidget {
  const BrokerNotificationPage({super.key});

  @override
  State<BrokerNotificationPage> createState() => _BrokerNotificationPageState();
}

class _BrokerNotificationPageState extends State<BrokerNotificationPage> {
  final brokerNotificationController = Get.put(BrokerNotificationController());

  @override
  void dispose() {
    Get.delete<BrokerNotificationController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: BrokerNotificationController(),
        builder: (cont) {
          return Container(
              color: Colors.white,
              padding: const EdgeInsets.all(AppConstants.screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 45),

                  const GradientText('Notification',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                          fontFamily: AppConstants.fontFamily),
                      gradient: LinearGradient(colors: [AppColors.btnColor,AppColors.gradiantColor])),
                  const SizedBox(height: 15.0),

                  Expanded(
                    child: SingleChildScrollView(
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder:
                            (BuildContext context, int index) {
                          return notificationItem();
                        }, separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 15);
                      },),
                    ),
                  )
                ],
              ));
        });
  }

  Widget notificationItem() {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: AppColors.lightGreyColor,
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        color: AppColors.btnColor,
                        shape: BoxShape.circle),
                    child: const Text('A',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 23,
                            fontFamily: AppConstants.fontFamily)),
                  ),
                  const SizedBox(width: 20),
                  const Expanded(
                    child: Text('Which part of the brain is responsible for regulating basic life functionssuch as heartbeat and breathing?',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            overflow: TextOverflow.clip,
                            color:AppColors.darkBlue1Color,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: AppConstants.fontFamily)),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('10:12 Am',
                textAlign: TextAlign.start,
                style: TextStyle(
                    overflow: TextOverflow.clip,
                    color:AppColors.lightGrey2Color,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    fontFamily: AppConstants.fontFamily)),
            SizedBox(width: 10),
            Text('24/09/2024',
                textAlign: TextAlign.start,
                style: TextStyle(
                    overflow: TextOverflow.clip,
                    color:AppColors.lightGrey2Color,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    fontFamily: AppConstants.fontFamily)),
          ],
        )

      ],
    );
  }
}
