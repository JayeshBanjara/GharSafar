import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ghar_safar/screens/dashboard/pages/consultant/rartings/ratings.dart';
import 'package:ghar_safar/screens/dashboard/pages/consultant/select_service_filter/select_service_filter.dart';

import '../../../../utils/global.dart';
import '../../../../utils/gradient_text.dart';
import 'consultant_controller.dart';
import 'consultant_details/consultant_details.dart';

class ConsultantPage extends StatefulWidget {
  const ConsultantPage({super.key});

  @override
  State<ConsultantPage> createState() => _ConsultantPageState();
}

class _ConsultantPageState extends State<ConsultantPage> {

  final consultantController = Get.put(ConsultantController());

  @override
  void dispose() {
    Get.delete<ConsultantController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ConsultantController(),
        builder: (cont) {
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.all(AppConstants.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 45),
                const GradientText('Consultant',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                        fontFamily: AppConstants.fontFamily),
                    gradient: LinearGradient(colors: [AppColors.btnColor,AppColors.gradiantColor])),
                const SizedBox(height: 15.0),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap:(){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => const SelectServiceFilterPage()));
                          } ,
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.grey3Color, width: 1.0),
                                  borderRadius: BorderRadius.circular(50.0)),
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.search,
                                    size: 24.0,
                                    color: AppColors.grey3Color,
                                  ),
                                  const SizedBox(width: 5.0),
                                  const Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Search Services',
                                            style: TextStyle(
                                                color: AppColors.greyTextColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                fontFamily:
                                                AppConstants.fontFamily),
                                          )
                                        ],
                                      )),
                                  const SizedBox(width: 3.0),
                                  SvgPicture.asset(
                                      ImageConstants.icFilter,
                                    height: 20,
                                    width: 20,
                                  )
                                ],
                              )),
                        ),
                        const SizedBox(height: 15.0),

                        const Text(
                          'Consultant',
                          style: TextStyle(
                              color: AppColors.black1Color,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              fontFamily:
                              AppConstants.fontFamily),
                        ),
                        const SizedBox(height: 15.0),

                        InkWell(
                          onTap:(){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => const ConsultantDetailsPage()));
                          } ,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: 2,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                return consultantItem();
                              }),
                        ),

                        Image.asset(
                          ImageConstants.buySampleBanner,
                          width: double.maxFinite,
                          fit: BoxFit.fill,
                        ),

                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: 2,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return consultantItem();
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget consultantItem() {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: AppColors.lightBlue2,
              border: Border.all(color: AppColors.btnColor),
              borderRadius: BorderRadius.circular(25.0)),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
                  color: Colors.white,
                  child: Image.asset(
                    ImageConstants.imgConsultantSample,
                    width: MediaQuery.of(context).size.width,
                    height: 100.0,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Rentickle',
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            fontFamily: AppConstants.fontFamily)),
                    SvgPicture.asset(ImageConstants.icFavouriteUnselected,
                        width: 18.0, height: 16.0)
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      ImageConstants.icBriefcase,
                    ),
                    const SizedBox(width: 5.0),
                    const Expanded(
                      child: Text('10+ years experience',
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontFamily: AppConstants.fontFamily)),
                    ),
                    SvgPicture.asset(
                      ImageConstants.icStar,
                    ),
                    const SizedBox(width: 5.0),
                    InkWell(
                      onTap:(){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const RatingsPage()));
                      } ,
                      child: const Text('10 Rating',
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontFamily: AppConstants.fontFamily)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                    decoration: BoxDecoration(
                        color: AppColors.lightBlue2,
                        border: Border.all(color:AppColors.borderColor),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: const Text('Home Interiors',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.grey10Color,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: AppConstants.fontFamily)),
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                      decoration: BoxDecoration(
                          color: AppColors.lightBlue2,
                          border: Border.all(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: const Text('Property Lawyers',
                          style: TextStyle(
                              color: AppColors.grey10Color,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              fontFamily: AppConstants.fontFamily))
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 15.0)
      ],
    );
  }
}
