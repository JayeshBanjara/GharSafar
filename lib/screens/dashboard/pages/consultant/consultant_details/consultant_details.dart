import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/global.dart';
import 'consultant_details_controller.dart';

class ConsultantDetailsPage extends StatefulWidget {
  const ConsultantDetailsPage({super.key});

  @override
  State<ConsultantDetailsPage> createState() => _ConsultantDetailsPageState();
}

class _ConsultantDetailsPageState extends State<ConsultantDetailsPage> {
  final consultantDetailController = Get.put(ConsultantDetailController());

  @override
  void dispose() {
    Get.delete<ConsultantDetailController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ConsultantDetailController(),
        builder: (cont) {
          consultantDetailController.context = context;
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
                        child: Text('Consultant Ditails',
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: AppColors.btnColor,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      ImageConstants.imgRenti,
                                    ),
                                    const SizedBox(width: 15.0),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Text('Rentickle',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 18,
                                                      fontFamily: AppConstants.fontFamily)),
                                              const SizedBox(width: 7.0),
                                              SvgPicture.asset(
                                                ImageConstants.icVerified1,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 3.0),
                                          const Text('Astro Alchemist',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  fontFamily: AppConstants.fontFamily)),

                                        ],
                                      ),
                                    )
                                  ],
                                ),

                              ],
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: AppColors.lightBlue2,
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        ImageConstants.icBriefcase,
                                      ),
                                      const SizedBox(width: 5.0),
                                      const Text('10+ years experience',
                                          style: TextStyle(
                                              color: AppColors.black1Color,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              fontFamily: AppConstants.fontFamily)),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                                decoration: BoxDecoration(
                                    color: AppColors.lightBlue2,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      ImageConstants.icStar,
                                    ),
                                    const SizedBox(width: 5.0),
                                    const Text('10 Rating',
                                        style: TextStyle(
                                            color: AppColors.black1Color,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            fontFamily: AppConstants.fontFamily)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15.0),
                          Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                            decoration: BoxDecoration(
                                color: AppColors.lightBlue2,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  ImageConstants.icGlobe,
                                ),
                                const SizedBox(width: 5.0),
                                const Text('English',
                                    style: TextStyle(
                                        color: AppColors.black1Color,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        fontFamily: AppConstants.fontFamily)),
                                const SizedBox(width: 15.0),
                                const Text('Hindi',
                                    style: TextStyle(
                                        color: AppColors.black1Color,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        fontFamily: AppConstants.fontFamily)),
                                const SizedBox(width: 15.0),
                                const Text('Gujarati',
                                    style: TextStyle(
                                        color: AppColors.black1Color,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        fontFamily: AppConstants.fontFamily)),
                              ],
                            ),
                          ),

                          const SizedBox(height: 15.0),
                          const Text('Services',
                              style: TextStyle(
                                  color: AppColors.black1Color,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  fontFamily: AppConstants.fontFamily)),
                          const SizedBox(height: 15.0),

                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.maxFinite,
                                  padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.borderColor),
                                      borderRadius: BorderRadius.circular(25.0)),
                                  child: const Text('Home Interiors',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColors.grey14Color,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          fontFamily: AppConstants.fontFamily)),
                                ),
                              ),
                              const SizedBox(width: 20.0),
                              Expanded(
                                child: Container(
                                  width: double.maxFinite,
                                  padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 15),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: AppColors.borderColor),
                                      borderRadius: BorderRadius.circular(25.0)),
                                  child: const Text('Property Lawyers',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColors.grey14Color,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          fontFamily: AppConstants.fontFamily)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15.0),

                          const Text('Service Details',
                              style: TextStyle(
                                  color: AppColors.black1Color,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  fontFamily: AppConstants.fontFamily)),
                          const SizedBox(height: 15.0),

                          Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: AppColors.grey6Color),
                                borderRadius: BorderRadius.circular(25.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: const BoxDecoration(
                                            color: AppColors.black1Color,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      const Text('Consultancy given in Hindi, English, Telugu',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: AppColors.black1Color,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              fontFamily: AppConstants.fontFamily)),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10.0),

                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          const SizedBox(height: 8.0),
                                          Container(
                                            padding: const EdgeInsets.all(2),
                                            decoration: const BoxDecoration(
                                                color: AppColors.black1Color,
                                                shape: BoxShape.circle
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 10.0),
                                      const Expanded(
                                        child: Text('Consultant will answer up to 10 questions',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: AppColors.black1Color,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                fontFamily: AppConstants.fontFamily)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10.0),

                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          const SizedBox(height: 8.0),
                                          Container(
                                            padding: const EdgeInsets.all(2),
                                            decoration: const BoxDecoration(
                                                color: AppColors.black1Color,
                                                shape: BoxShape.circle
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 10.0),
                                      const Expanded(
                                        child: Text('The Consultant will give remedies on Individual well being, health, finance,relationships',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: AppColors.black1Color,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                fontFamily: AppConstants.fontFamily)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10.0),

                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          const SizedBox(height: 8.0),
                                          Container(
                                            padding: const EdgeInsets.all(2),
                                            decoration: const BoxDecoration(
                                                color: AppColors.black1Color,
                                                shape: BoxShape.circle
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 10.0),
                                      const Expanded(
                                        child: Text('Vastu report will be sent withing 24 hours of the consultancy',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: AppColors.black1Color,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                fontFamily: AppConstants.fontFamily)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10.0),

                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          const SizedBox(height: 8.0),
                                          Container(
                                            padding: const EdgeInsets.all(2),
                                            decoration: const BoxDecoration(
                                                color: AppColors.black1Color,
                                                shape: BoxShape.circle
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 10.0),
                                      const Expanded(
                                        child: Text('One free followup consultancy after 21 days',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: AppColors.black1Color,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                fontFamily: AppConstants.fontFamily)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15.0),

                          const Text('Details during consultancy',
                              style: TextStyle(
                                  color: AppColors.black1Color,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  fontFamily: AppConstants.fontFamily)),
                          const SizedBox(height: 15.0),

                          Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: AppColors.grey6Color),
                                borderRadius: BorderRadius.circular(25.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: const BoxDecoration(
                                            color: AppColors.black1Color,
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      const Text('Property Layout plan',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: AppColors.black1Color,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              fontFamily: AppConstants.fontFamily)),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10.0),

                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          const SizedBox(height: 8.0),
                                          Container(
                                            padding: const EdgeInsets.all(2),
                                            decoration: const BoxDecoration(
                                                color: AppColors.black1Color,
                                                shape: BoxShape.circle
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 10.0),
                                      const Expanded(
                                        child: Text('Google location of the property',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: AppColors.black1Color,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                fontFamily: AppConstants.fontFamily)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10.0),

                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          const SizedBox(height: 8.0),
                                          Container(
                                            padding: const EdgeInsets.all(2),
                                            decoration: const BoxDecoration(
                                                color: AppColors.black1Color,
                                                shape: BoxShape.circle
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 10.0),
                                      const Expanded(
                                        child: Text('Property Owner details',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: AppColors.black1Color,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                fontFamily: AppConstants.fontFamily)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10.0),

                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          const SizedBox(height: 8.0),
                                          Container(
                                            padding: const EdgeInsets.all(2),
                                            decoration: const BoxDecoration(
                                                color: AppColors.black1Color,
                                                shape: BoxShape.circle
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 10.0),
                                      const Expanded(
                                        child: Text('Images of property',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: AppColors.black1Color,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                fontFamily: AppConstants.fontFamily)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10.0),

                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          const SizedBox(height: 8.0),
                                          Container(
                                            padding: const EdgeInsets.all(2),
                                            decoration: const BoxDecoration(
                                                color: AppColors.black1Color,
                                                shape: BoxShape.circle
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 10.0),
                                      const Expanded(
                                        child: Text('Property site map',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: AppColors.black1Color,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                fontFamily: AppConstants.fontFamily)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20.0),

                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grey6Color),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  ImageConstants.imgBlueRenti,
                                ),
                                const SizedBox(width: 15.0),
                                const Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       SizedBox(height: 5.0),
                                      Text('Rentickle',
                                          style: TextStyle(
                                              color: AppColors.btnColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              fontFamily: AppConstants.fontFamily)),
                                      SizedBox(height: 3.0),
                                      Text('My Guruji Late Kasinadhuni Subrahmanyam Garu, was considered to be the one of the final authorities on vastu of the world. Now I am writing a book on vastu in English',
                                          style: TextStyle(
                                              color: AppColors.grey8Color,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              fontFamily: AppConstants.fontFamily)),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20.0),

                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.lightBlue2,
                                  border: Border.all(color: AppColors.grey6Color),
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(ImageConstants.icFacebook),
                                  const SizedBox(width: 15.0),
                                  SvgPicture.asset(ImageConstants.icInsta),
                                  const SizedBox(width: 15.0),
                                  SvgPicture.asset(ImageConstants.icLinkdin),
                                  const SizedBox(width: 15.0),
                                  SvgPicture.asset(ImageConstants.icTwitter),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),

                          const Text('Reviews',
                              style: TextStyle(
                                  color: AppColors.black1Color,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  fontFamily: AppConstants.fontFamily)),
                          const SizedBox(height: 15.0),

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
                          const SizedBox(height: 5.0),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
