import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ghar_safar/screens/dashboard/dashboard_controller.dart';
import 'package:ghar_safar/screens/dashboard/pages/home/home_controller.dart';
import 'package:ghar_safar/screens/dashboard/pages/home/place_details/place_details.dart';
import 'package:ghar_safar/screens/dashboard/pages/home/profile/profile.dart';
import 'package:ghar_safar/screens/dashboard/pages/home/tips/tips.dart';
import 'package:ghar_safar/utils/global.dart';

import 'filter/filter.dart';
import 'housing_loan/housing_loan.dart';
import 'legal_advice/legal_advice.dart';
import 'notification/notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Get.put(HomeController());
  final dashboardController = Get.put(DashboardController());

  @override
  void dispose() {
    Get.delete<HomeController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (cont) {
          return Container(
              color: Colors.white,
              padding: const EdgeInsets.all(AppConstants.screenPadding),
              child: Column(
                children: [
                  const SizedBox(height: 45),
                  Row(
                    children: [
                      InkWell(
                        onTap:(){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const ProfilePage()),);
                        } ,
                        child: const CircleAvatar(
                            radius: 25.0,
                            backgroundImage:
                                AssetImage(ImageConstants.tempPersonImg)),
                      ),
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
                      InkWell(
                        onTap:(){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const NotificationPage()),);
                        } ,
                        child: SvgPicture.asset(ImageConstants.bellIcon,
                            width: 50.0, height: 50.0),
                      )
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          InkWell(
                            onTap:(){
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => const FilterPage()));
                            } ,
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.grey3Color, width: 1.0),
                                    borderRadius: BorderRadius.circular(50.0)),
                                padding: const EdgeInsets.all(7.0),
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
                                          'Find your new',
                                          style: TextStyle(
                                              color: AppColors.textColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              fontFamily:
                                                  AppConstants.fontFamily),
                                        ),
                                        Text(
                                          '4517 Washington Ave. Manchester, Ken...',
                                          style: TextStyle(
                                              color: AppColors.greyTextColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                              fontFamily:
                                                  AppConstants.fontFamily),
                                        )
                                      ],
                                    )),
                                    const SizedBox(width: 3.0),
                                    Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.grey12Color, width: 1.0),
                                          shape: BoxShape.circle
                                      ),
                                      child: Image.asset(ImageConstants.icLocationSearch,
                                          height: 40.0, width: 40.0),
                                    )
                                  ],
                                )),
                          ),
                          const SizedBox(height: 15.0),

                          SizedBox(height: 150,
                            child: Stack(
                              alignment: AlignmentDirectional.topCenter,
                              children: [
                                Container(
                                  height: 130,
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.grey3Color, width: 1.0),
                                      borderRadius: BorderRadius.circular(15.0)),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        ImageConstants.tipsImg,
                                      ),
                                      const SizedBox(width: 15),
                                       const Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 10),
                                          Text(
                                            'Publishing and graphic\ndesign, Lorem ipsum',
                                            style: TextStyle(
                                                color: AppColors.blackColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                fontFamily: AppConstants.fontFamily),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'when an unknown printer took\ngalley of type and scrambled ',
                                            style: TextStyle(
                                                color: AppColors.grey10Color,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                fontFamily: AppConstants.fontFamily),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  child: SizedBox(
                                    height: 30,
                                    width: 80,
                                    child: ElevatedButton(
                                        onPressed: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(builder: (context) => const TipsPage()),);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.primary,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.all(Radius.circular(15.0)))),
                                        child: const Text(
                                          'Tips',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              fontFamily: AppConstants.fontFamily),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),

                          const SizedBox(height: 25.0),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      homeController.isHomeSelected = true;
                                      homeController.isFlatsSelected = false;
                                      homeController.isApartmentsSelected =
                                          false;
                                      homeController.isVillaSelected = false;
                                      homeController.update();
                                    },
                                    child: houseType(
                                        icon: homeController.isHomeSelected
                                            ? ImageConstants.icSelectedHouse
                                            : ImageConstants.icUnselectedHouse,
                                        label: 'House',
                                        isSelected:
                                            homeController.isHomeSelected)),
                                const SizedBox(width: 5.0),
                                InkWell(
                                  onTap: () {
                                    homeController.isHomeSelected = false;
                                    homeController.isFlatsSelected = true;
                                    homeController.isApartmentsSelected = false;
                                    homeController.isVillaSelected = false;
                                    homeController.update();
                                  },
                                  child: houseType(
                                      icon: homeController.isFlatsSelected
                                          ? ImageConstants.icSelectedFlats
                                          : ImageConstants.icUnselectedFlats,
                                      label: 'Flats',
                                      isSelected:
                                          homeController.isFlatsSelected),
                                ),
                                const SizedBox(width: 5.0),
                                InkWell(
                                  onTap: () {
                                    homeController.isHomeSelected = false;
                                    homeController.isFlatsSelected = false;
                                    homeController.isApartmentsSelected = true;
                                    homeController.isVillaSelected = false;
                                    homeController.update();
                                  },
                                  child: houseType(
                                      icon: homeController.isApartmentsSelected
                                          ? ImageConstants.icSelectedApartments
                                          : ImageConstants
                                              .icUnselectedApartments,
                                      label: 'Apartments',
                                      isSelected:
                                          homeController.isApartmentsSelected),
                                ),
                                const SizedBox(width: 5.0),
                                InkWell(
                                  onTap: () {
                                    homeController.isHomeSelected = false;
                                    homeController.isFlatsSelected = false;
                                    homeController.isApartmentsSelected = false;
                                    homeController.isVillaSelected = true;
                                    homeController.update();
                                  },
                                  child: houseType(
                                      icon: homeController.isVillaSelected
                                          ? ImageConstants.icSelectedVilla
                                          : ImageConstants.icUnselectedVilla,
                                      label: 'Villa',
                                      isSelected:
                                          homeController.isVillaSelected),
                                ),
                                const SizedBox(width: 5.0),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 305.0,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                        onTap:(){
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder: (context) => const PlaceDetailsPage()));
                                        } ,
                                        child: mainItem());
                                  })),
                          const SizedBox(height: 15.0),

                          Image.asset(
                            ImageConstants.tempHomeBanner,
                            width: double.maxFinite,
                            height: 125.0,
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(height: 15.0),

                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: AppColors.lightBlue2,
                                        borderRadius: BorderRadius.circular(20.0)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 5.0),
                                        SvgPicture.asset(
                                            ImageConstants.icHousingLoan
                                        ),
                                        const SizedBox(height: 10.0),
                                        const Text(
                                          'Housing Loan',
                                          style: TextStyle(
                                              color: AppColors.blackColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              fontFamily: AppConstants.fontFamily),
                                        ),
                                        const SizedBox(height: 10.0),
                                        const Text(
                                          'WashinLorem Ipsum is\nsimply dummy text...',
                                          style: TextStyle(
                                              color: AppColors.grey8Color,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12,
                                              fontFamily: AppConstants.fontFamily),
                                        ),
                                        const SizedBox(height: 15.0),
                                        InkWell(
                                          onTap:(){
                                            Navigator.of(context).push(
                                                MaterialPageRoute(builder: (context) => const HousingLoanPage()));
                                          } ,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                            decoration: BoxDecoration(
                                                color: AppColors.btnColor,
                                                borderRadius: BorderRadius.circular(50.0)),
                                            child: const Text('Apply Now',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    fontFamily: AppConstants.fontFamily)),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                              const SizedBox(width: 20.0),
                              Expanded(
                                  child: InkWell(
                                    onTap:(){
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) => const LegalAdvicePage()));
                                    } ,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: AppColors.lightBlue2,
                                          borderRadius: BorderRadius.circular(20.0)),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 5.0),
                                          SvgPicture.asset(
                                              ImageConstants.icHousingLoan
                                          ),
                                          const SizedBox(height: 10.0),
                                          const Text(
                                            'Legal Advice',
                                            style: TextStyle(
                                                color: AppColors.blackColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                fontFamily: AppConstants.fontFamily),
                                          ),
                                          const SizedBox(height: 10.0),
                                          const Text(
                                            'WashinLorem Ipsum is\nsimply dummy text...',
                                            style: TextStyle(
                                                color: AppColors.grey8Color,
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12,
                                                fontFamily: AppConstants.fontFamily),
                                          ),
                                          const SizedBox(height: 15.0),
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                            decoration: BoxDecoration(
                                                color: AppColors.btnColor,
                                                borderRadius: BorderRadius.circular(50.0)),
                                            child: const Text('Apply Now',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    fontFamily: AppConstants.fontFamily)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                            ],
                          ),

                          const SizedBox(height: 15.0),
                          headerWithViewMore(
                              label: 'Buy Property',
                              onViewMoreClick: () {
                                dashboardController.changeTabIndex(1);
                                dashboardController.update();
                              }),
                          const SizedBox(height: 15.0),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 305.0,
                              child: InkWell(
                                onTap:(){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => const PlaceDetailsPage()));
                                } ,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return mainItem();
                                    }),
                              )),
                          const SizedBox(height: 15.0),
                          headerWithViewMore(
                              label: 'Consultant',
                              onViewMoreClick: () {
                                dashboardController.changeTabIndex(4);
                                dashboardController.update();
                              }),
                          const SizedBox(height: 15.0),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 240.0,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return consultantItem();
                                  })),
                          const SizedBox(height: 15.0),
                          headerWithViewMore(
                              label: 'Rent Property',
                              onViewMoreClick: () {
                                dashboardController.changeTabIndex(2);
                                dashboardController.update();
                              }),
                          const SizedBox(height: 15.0),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 305.0,
                              child: InkWell(
                                onTap:(){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => const PlaceDetailsPage()));
                                } ,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return mainItem();
                                    }),
                              )),
                          const SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                  )
                ],
              ));
        });
  }

  /*Widget consultantItem() {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.4,
          height: 230.0,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          decoration: BoxDecoration(
              color: AppColors.grey9Color,
              border: Border.all(color: AppColors.grey6Color, width: 1.0),
              borderRadius: BorderRadius.circular(25.0)),
          child: Column(
            children: [
              const CircleAvatar(
                backgroundColor: AppColors.grey11Color,
                radius: 47,
                child: CircleAvatar(
                    radius: 45.0,
                    backgroundImage: AssetImage(ImageConstants.tempPersonImg)),
              ),
              const SizedBox(height: 10.0),
              const Text('Sadhu Sandip',
                  style: TextStyle(
                      color: AppColors.btnColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      fontFamily: AppConstants.fontFamily)),
              const SizedBox(height: 5.0),
              const Text('Astro Alchemist',
                  style: TextStyle(
                      color: AppColors.grey10Color,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      fontFamily: AppConstants.fontFamily)),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        border:
                            Border.all(color: AppColors.grey6Color, width: 1.0),
                        borderRadius: BorderRadius.circular(50.0)),
                    child: const Text('WhatsApp',
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            fontFamily: AppConstants.fontFamily)),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 22),
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        border:
                            Border.all(color: AppColors.grey6Color, width: 1.0),
                        borderRadius: BorderRadius.circular(50.0)),
                    child: const Text('Call',
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            fontFamily: AppConstants.fontFamily)),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(width: 15.0)
      ],
    );
  }*/

  Widget consultantItem() {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
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
                    const Text('10 Rating',
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: AppConstants.fontFamily)),
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
                        border: Border.all(color: Colors.white),
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
                        border: Border.all(color: Colors.white),
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
        const SizedBox(width: 10.0)
      ],
    );
  }

  Widget mainItem() {
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
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: AppConstants.fontFamily)),
                    SvgPicture.asset(ImageConstants.icFavouriteUnselected,
                        width: 18.0, height: 16.0)
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
                          color: AppColors.grey10Color,
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
                      houseDetails(label: '6', icon: ImageConstants.icBed),
                      const SizedBox(width: 5.0),
                      houseDetails(label: '7', icon: ImageConstants.icBath),
                      const SizedBox(width: 5.0),
                      houseDetails(label: '2050', icon: ImageConstants.icSqft),
                      const SizedBox(width: 5.0),
                    ],
                  ),
                  const Text('₹850,00000',
                      style: TextStyle(
                          color: AppColors.blackColor,
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

  Widget houseDetails({required String label, required String icon}) {
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
                  color: AppColors.blackColor,
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

  Widget headerWithViewMore(
      {required String label, required void Function() onViewMoreClick}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
                fontFamily: AppConstants.fontFamily)),
        InkWell(
          onTap: () {
            onViewMoreClick();
          },
          child: const Text('View More',
              style: TextStyle(
                  color: AppColors.btnColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  fontFamily: AppConstants.fontFamily)),
        )
      ],
    );
  }

  Widget houseType(
      {required String icon, required String label, required isSelected}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          color: isSelected ? AppColors.darkBlueColor : Colors.white,
          border: Border.all(
              color:
                  isSelected ? AppColors.darkBlueColor : AppColors.grey4Color),
          borderRadius: BorderRadius.circular(50.0)),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            height: 22,
            width: 22,
          ),
          const SizedBox(width: 10),
          Text(label,
              style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.grey5Color,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: AppConstants.fontFamily))
        ],
      ),
    );
  }
}
