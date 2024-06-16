import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rich_readmore/rich_readmore.dart';

import '../../../../../../utils/global.dart';
import 'brokers_detail_controller.dart';

class BrokersDetailPage extends StatefulWidget {
  const BrokersDetailPage({super.key});

  @override
  State<BrokersDetailPage> createState() => _BrokersDetailPageState();
}

class _BrokersDetailPageState extends State<BrokersDetailPage> {
  final brokersDetailController = Get.put(BrokersDetailController());

  final TextSpan textSpan = TextSpan(
    text: 'Estate is an accomplished real estate firm deals in “Adinath Nagar" locality. Drawing from their years of experience they bring a strategic yet personal',
style: TextStyle(
    color: AppColors.black1Color,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    fontFamily: AppConstants.fontFamily),
  );

  @override
  void dispose() {
    Get.delete<BrokersDetailController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: BrokersDetailController(),
        builder: (cont) {
          brokersDetailController.context = context;
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
                        child: Text('Brokers',
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
                            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 10.0, 8.0),
                            decoration: BoxDecoration(
                                color: AppColors.lightBlue2,
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
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                            decoration: BoxDecoration(
                                                color: AppColors.btnColor,
                                                borderRadius: BorderRadius.circular(15.0)),
                                            child: const Text('Contact',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    fontFamily: AppConstants.fontFamily)),
                                          ),
                                          const SizedBox(height: 5.0),
                                        ],
                                      ),
                                    )
                                  ],
                                ),

                              ],
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          RichReadMoreText(
                            textSpan,
                            settings: LineModeSettings(
                              trimLines: 2,
                              trimCollapsedText: 'Read more',
                              trimExpandedText: ' Read less ',
                              moreStyle: const TextStyle(
                                  color: AppColors.btnColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: AppConstants.fontFamily),
                              lessStyle: const TextStyle(
                                  color: AppColors.btnColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: AppConstants.fontFamily),
                            ),
                          ),
                          const SizedBox(height: 20.0),

                          const Text('Areas of Operation',
                              style: TextStyle(
                                  color: AppColors.black1Color,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  fontFamily: AppConstants.fontFamily)),
                          const SizedBox(height: 15.0),

                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 12),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: AppColors.borderColor),
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: const Text('Vastrapur',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColors.grey8Color,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        fontFamily: AppConstants.fontFamily)),
                              ),
                              const SizedBox(width: 15.0),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 12),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: AppColors.borderColor),
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: const Text('Satellite',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColors.grey8Color,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        fontFamily: AppConstants.fontFamily)),
                              ),
                              const SizedBox(width: 15.0),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 12),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: AppColors.borderColor),
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: const Text('Bodakdev',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColors.grey8Color,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        fontFamily: AppConstants.fontFamily)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15.0),

                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 12),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: AppColors.borderColor),
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: const Text('Thaltej',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColors.grey8Color,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        fontFamily: AppConstants.fontFamily)),
                              ),
                              const SizedBox(width: 15.0),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 12),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: AppColors.borderColor),
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: const Text('Memnagar',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColors.grey8Color,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        fontFamily: AppConstants.fontFamily)),
                              ),
                              const SizedBox(width: 15.0),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 12),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: AppColors.borderColor),
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: const Text('Hebatpur',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColors.grey8Color,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        fontFamily: AppConstants.fontFamily)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30.0),

                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [Colors.white,AppColors.lightBlueColor]),
                                      border: Border.all(color: AppColors.grey2BorderColor),
                                      borderRadius: BorderRadius.circular(15.0)),
                                  child: const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('3 years',
                                          style: TextStyle(
                                              color: AppColors.btnColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 22,
                                              fontFamily: AppConstants.fontFamily)),
                                      Text('Experience',
                                          style: TextStyle(
                                              color: AppColors.grey8Color,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              fontFamily: AppConstants.fontFamily)),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20.0),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [Colors.white,AppColors.lightBlueColor]),
                                      border: Border.all(color: AppColors.grey2BorderColor),
                                      borderRadius: BorderRadius.circular(15.0)),
                                  child: const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('46',
                                          style: TextStyle(
                                              color: AppColors.btnColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 22,
                                              fontFamily: AppConstants.fontFamily)),
                                      Text('Properties',
                                          style: TextStyle(
                                              color: AppColors.grey8Color,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              fontFamily: AppConstants.fontFamily)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15.0),

                          const Text('Active Properties',
                              style: TextStyle(
                                  color: AppColors.black1Color,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  fontFamily: AppConstants.fontFamily)),
                          const SizedBox(height: 15.0),

                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 305.0,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return recentViewItem(index);
                                  })),
                          const SizedBox(height: 10.0),
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

  Widget recentViewItem(int index) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.grey6Color),
              borderRadius: BorderRadius.circular(25.0)),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
                  color: AppColors.grey7Color,
                  child: Image.asset(
                    ImageConstants.tempHomeSample1,
                    width: MediaQuery.of(context).size.width,
                    height: 160.0,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Sahe Luxury House',
                        style: TextStyle(
                            color: AppColors.black1Color,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: AppConstants.fontFamily)),
                    InkWell(
                      onTap: (){
                        brokersDetailController.isFavouriteSelected[index] = !brokersDetailController.isFavouriteSelected[index];
                        brokersDetailController.update();
                      },
                      child: SvgPicture.asset(brokersDetailController.isFavouriteSelected[index]
                          ?ImageConstants.icFavouriteSelected
                          :ImageConstants.icFavouriteUnselected,
                          width: 18.0, height: 16.0),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  SvgPicture.asset(
                    ImageConstants.icLocation,
                    width: 9.0,
                    height: 10.0,
                  ),
                  const SizedBox(width: 5.0),
                  const Text('2517 Washington Ave. Manchester, New Jersey.',
                      style: TextStyle(
                          color: AppColors.grey8Color,
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          fontFamily: AppConstants.fontFamily))
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      recentViewHouseDetails(label: '6', icon: ImageConstants.icBed),
                      const SizedBox(width: 5.0),
                      recentViewHouseDetails(label: '7', icon: ImageConstants.icBath),
                      const SizedBox(width: 5.0),
                      recentViewHouseDetails(label: '2050', icon: ImageConstants.icSqft),
                      const SizedBox(width: 5.0),
                    ],
                  ),
                  const Text('₹850,00000',
                      style: TextStyle(
                          color: AppColors.black1Color,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          fontFamily: AppConstants.fontFamily))
                ],
              )
            ],
          ),
        ),
        const SizedBox(width: 10.0)
      ],
    );
  }

  Widget recentViewHouseDetails({required String label, required String icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
          color: AppColors.greyBgColor,
          border: Border.all(color: AppColors.grey4Color),
          borderRadius: BorderRadius.circular(50.0)),
      child: Row(
        children: [
          Text(label,
              style: const TextStyle(
                  color: AppColors.black1Color,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: AppConstants.fontFamily)),
          const SizedBox(width: 5),
          SvgPicture.asset(
            icon,
            height: 15,
            width: 15,
            color: AppColors.btnColor,
          ),
        ],
      ),
    );
  }
}
