import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/global.dart';
import 'notification_controller.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  final notificationController = Get.put(NotificationController());

  @override
  void dispose() {
    Get.delete<NotificationController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: NotificationController(),
        builder: (cont) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              leading: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                  child: const Icon(Icons.arrow_back_ios_new)),
              title: const Text('Notification',
                  style: TextStyle(
                      color: AppColors.black2Color,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: AppConstants.fontFamily)),
            ),
            body: Container(
              height: double.maxFinite,
              color: Colors.white,
              padding: const EdgeInsets.all(AppConstants.screenPadding),
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
            ),
          );
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
