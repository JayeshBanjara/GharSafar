import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/global.dart';
import 'brokers_controller.dart';
import 'brokers_detail/brokers_detail.dart';

class BrokersPage extends StatefulWidget {
  const BrokersPage({super.key});

  @override
  State<BrokersPage> createState() => _BrokersPageState();
}

class _BrokersPageState extends State<BrokersPage> {

  final brokersController = Get.put(BrokersController());

  @override
  void dispose() {
    Get.delete<BrokersController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: BrokersController(),
        builder: (cont) {
          brokersController.context = context;
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
                        child: Text('Builders',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.black2Color,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: AppConstants.fontFamily)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),

                  Expanded(
                    child: InkWell(
                      onTap:(){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const BrokersDetailPage()));
                      } ,
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                          itemCount: 10,
                          itemBuilder:
                              (BuildContext context, int index) {
                            return brokersListItem();
                          }, separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 15.0);
                      },),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget brokersListItem() {
    return Container(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 10.0, 8.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.grey6Color),
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    ImageConstants.imgBroker,
                  ),
                  const SizedBox(width: 15.0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            const Text('Sadhu Sandip',
                                style: TextStyle(
                                    color: AppColors.btnColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    fontFamily: AppConstants.fontFamily)),
                            const SizedBox(width: 5.0),
                            SvgPicture.asset(
                              ImageConstants.icVerified,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: AppColors.grey6Color),
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: const Text('Vastrapur',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.grey8Color,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      fontFamily: AppConstants.fontFamily)),
                            ),
                            const SizedBox(width: 5.0),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: AppColors.grey6Color),
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: const Text('Satellite',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.grey8Color,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      fontFamily: AppConstants.fontFamily)),
                            )
                          ],
                        ),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  )
                ],
              ),
              const Divider(
                height: 1,
                thickness: 1,
                color: AppColors.dividerColor,
              ),

              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                        ImageConstants.icDot
                    ),
                    const SizedBox(width: 5.0),
                    Text('3',
                        style: TextStyle(
                            color: AppColors.btnColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: AppConstants.fontFamily)),
                    Text(' years Experience',
                        style: TextStyle(
                            color: AppColors.grey8Color,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: AppConstants.fontFamily)),
                    const SizedBox(width: 10.0),
                    SvgPicture.asset(
                        ImageConstants.icDot
                    ),
                    const SizedBox(width: 5.0),
                    Text('46',
                        style: TextStyle(
                            color: AppColors.btnColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: AppConstants.fontFamily)),
                    Text(' Properties',
                        style: TextStyle(
                            color: AppColors.grey8Color,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: AppConstants.fontFamily)),
                  ],
                ),
              )

            ],
          ),
        );

  }
}
