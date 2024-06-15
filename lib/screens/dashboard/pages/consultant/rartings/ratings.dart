import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ghar_safar/screens/dashboard/pages/consultant/rartings/ratings_controller.dart';

import '../../../../../utils/global.dart';

  class RatingsPage extends StatefulWidget {
  const RatingsPage({super.key});

  @override
  State<RatingsPage> createState() => _RatingsPageState();
}

class _RatingsPageState extends State<RatingsPage> {

  final ratingsController = Get.put(RatingsController());

  @override
  void dispose() {
    Get.delete<RatingsController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: RatingsController(),
        builder: (cont) {
          ratingsController.context = context;
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
                        child: Text('Ratings',
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
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 15),
                            decoration: BoxDecoration(
                                color: AppColors.lightBlue2,
                                borderRadius: BorderRadius.circular(25.0)),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Text('Overall Rating',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: AppColors.black1Color,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontFamily: AppConstants.fontFamily)),
                                ),
                                SvgPicture.asset(ImageConstants.icStar,height: 16,width: 16,),
                                const SizedBox(width: 8.0),
                                const Text('0.5 /5',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColors.black1Color,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        fontFamily: AppConstants.fontFamily)),
                              ],
                            ),
                          ),

                          const SizedBox(height: 25.0),

                          ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: 2,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                return Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.grey2BorderColor),
                                      borderRadius: BorderRadius.circular(25.0)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(15),
                                            decoration: const BoxDecoration(
                                                color: AppColors.lightBlue2,
                                                shape: BoxShape.circle),
                                            child: const Text('M',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: AppColors.btnColor,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                    fontFamily: AppConstants.fontFamily)),
                                          ),
                                          const SizedBox(width: 10.0),

                                          const Text('Mohan Sinha',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: AppColors.black1Color,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  fontFamily: AppConstants.fontFamily)),
                                          const Expanded(
                                            child: Text('September 13,2021',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: AppColors.greyTextColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12,
                                                    fontFamily: AppConstants.fontFamily)),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10.0),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(ImageConstants.icStar,height: 16,width: 16,),
                                            const SizedBox(width: 8.0),
                                            const Text('4.8',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: AppColors.black1Color,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    fontFamily: AppConstants.fontFamily)),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 5.0),
                                        child: Text('He is very knowledgeable and he guided us to buy our new house . Really appreciate his prompt response. We are very satisfied by his service and highl...',
                                            textAlign: TextAlign.start,
                                            maxLines: 4,
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: AppColors.black1Color,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                fontFamily: AppConstants.fontFamily)),
                                      ),
                                    ],
                                  ),
                                );
                              }, separatorBuilder: (BuildContext context, int index) {
                                return const SizedBox(height: 15.0);
                          },),


                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey2BorderColor),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(ImageConstants.icStar),
                            const SizedBox(width: 10.0),
                            SvgPicture.asset(ImageConstants.icStar),
                            const SizedBox(width: 10.0),
                            SvgPicture.asset(ImageConstants.icStar),
                            const SizedBox(width: 10.0),
                            SvgPicture.asset(ImageConstants.icStar),
                            const SizedBox(width: 10.0),
                            SvgPicture.asset(ImageConstants.icStar),
                          ],
                        ),
                        const SizedBox(height: 15.0),

                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration.collapsed(
                                    hintText: 'Write Review',
                                    hintStyle: TextStyle(
                                        color: AppColors.grey8Color,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        fontFamily: AppConstants.fontFamily)),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            SvgPicture.asset(ImageConstants.icSend),
                          ],
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          );
        });
  }
}
