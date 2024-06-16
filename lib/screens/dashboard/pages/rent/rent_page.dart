import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ghar_safar/screens/dashboard/pages/rent/rent_controller.dart';

import '../../../../utils/global.dart';
import '../../../../utils/gradient_text.dart';
import '../consultant/select_service_filter/select_service_filter.dart';
import '../home/filter/filter.dart';
import '../home/place_details/place_details.dart';
import '../home/profile/favorite/favorite.dart';
import 'brokers/brokers.dart';
import 'brokers/brokers_detail/brokers_detail.dart';

class RentPage extends StatefulWidget {
  const RentPage({super.key});

  @override
  State<RentPage> createState() => _RentPageState();
}

class _RentPageState extends State<RentPage> {

  final rentController = Get.put(RentController());

  @override
  void dispose() {
    Get.delete<RentController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: RentController(),
        builder: (cont) {
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.all(AppConstants.screenPadding),
            child: Column(
              children: [
                const SizedBox(height: 45),
                Row(
                  children: [
                    const Expanded(
                      child: GradientText('Rent Property',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 28,
                              fontFamily: AppConstants.fontFamily),
                          gradient: LinearGradient(colors: [AppColors.btnColor,AppColors.gradiantColor])),
                    ),
                    InkWell(
                      onTap:(){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const FavoritePage()),);
                      } ,
                      child: SvgPicture.asset(
                          ImageConstants.icHeart
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    InkWell(
                      onTap:(){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const SelectServiceFilterPage()));
                      } ,
                      child: SvgPicture.asset(
                          ImageConstants.icFilter
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                              padding: const EdgeInsets.all(7),
                              child: Row(
                                children: [
                                  const SizedBox(width: 5.0),
                                  SvgPicture.asset(ImageConstants.icSearch),
                                  const SizedBox(width: 10.0),
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
                        const SizedBox(height: 25.0),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    rentController.isHomeSelected = true;
                                    rentController.isFlatsSelected = false;
                                    rentController.isApartmentsSelected =
                                    false;
                                    rentController.isVillaSelected = false;
                                    rentController.update();
                                  },
                                  child: houseType(
                                      icon: rentController.isHomeSelected
                                          ? ImageConstants.icSelectedHouse
                                          : ImageConstants.icUnselectedHouse,
                                      label: 'House',
                                      isSelected:
                                      rentController.isHomeSelected)),
                              const SizedBox(width: 5.0),
                              InkWell(
                                onTap: () {
                                  rentController.isHomeSelected = false;
                                  rentController.isFlatsSelected = true;
                                  rentController.isApartmentsSelected = false;
                                  rentController.isVillaSelected = false;
                                  rentController.update();
                                },
                                child: houseType(
                                    icon: rentController.isFlatsSelected
                                        ? ImageConstants.icSelectedFlats
                                        : ImageConstants.icUnselectedFlats,
                                    label: 'Flats',
                                    isSelected:
                                    rentController.isFlatsSelected),
                              ),
                              const SizedBox(width: 5.0),
                              InkWell(
                                onTap: () {
                                  rentController.isHomeSelected = false;
                                  rentController.isFlatsSelected = false;
                                  rentController.isApartmentsSelected = true;
                                  rentController.isVillaSelected = false;
                                  rentController.update();
                                },
                                child: houseType(
                                    icon: rentController.isApartmentsSelected
                                        ? ImageConstants.icSelectedApartments
                                        : ImageConstants
                                        .icUnselectedApartments,
                                    label: 'Apartments',
                                    isSelected:
                                    rentController.isApartmentsSelected),
                              ),
                              const SizedBox(width: 5.0),
                              InkWell(
                                onTap: () {
                                  rentController.isHomeSelected = false;
                                  rentController.isFlatsSelected = false;
                                  rentController.isApartmentsSelected = false;
                                  rentController.isVillaSelected = true;
                                  rentController.update();
                                },
                                child: houseType(
                                    icon: rentController.isVillaSelected
                                        ? ImageConstants.icSelectedVilla
                                        : ImageConstants.icUnselectedVilla,
                                    label: 'Villa',
                                    isSelected:
                                    rentController.isVillaSelected),
                              ),
                              const SizedBox(width: 5.0),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15.0),

                        Image.asset(
                          ImageConstants.buySampleBanner,
                          width: double.maxFinite,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(height: 15.0),

                        const Text('Rent Property',
                            style: TextStyle(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: AppConstants.fontFamily)),
                        const SizedBox(height: 15.0),

                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: 2,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return InkWell(
                                  onTap:(){
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) => const PlaceDetailsPage()));
                                  } ,
                                  child: mainItem(index));
                            }),
                        const SizedBox(height: 15.0),

                        const Text('Popular Location',
                            style: TextStyle(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: AppConstants.fontFamily)),
                        const SizedBox(height: 15.0),

                        SizedBox(
                            height: 75,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return popularLocationItem();
                                })),
                        const SizedBox(height: 15.0),

                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: 1,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return InkWell(
                                  onTap:(){
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) => const PlaceDetailsPage()));
                                  } ,
                                  child: mainItem1(index));
                            }),
                        const SizedBox(height: 15.0),

                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Brokers',
                                style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    fontFamily: AppConstants.fontFamily)),
                            InkWell(
                              onTap:(){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => const BrokersPage()));
                              } ,
                              child: const Text('View More',
                                  style: TextStyle(
                                      color: AppColors.btnColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      fontFamily: AppConstants.fontFamily)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15.0),

                        SizedBox(
                            height: 132,
                            child: InkWell(
                              onTap:(){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => const BrokersDetailPage()));
                              } ,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return brokersItem();
                                  }),
                            )),
                        const SizedBox(height: 15.0),

                        const Text('Recent View',
                            style: TextStyle(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w600,
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
                                  return InkWell(
                                      onTap:(){
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context) => const PlaceDetailsPage()));
                                      } ,
                                      child: recentViewItem(index));
                                })),
                        const SizedBox(height: 15.0),

                        const SizedBox(height: 15.0),

                      ],
                    ),
                  ),
                ),
              ],
            ),

          );
        });
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

  Widget mainItem(int index) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
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
                    InkWell(
                      onTap: (){
                        rentController.isFavouriteSelected[index] = !rentController.isFavouriteSelected[index];
                        rentController.update();
                      },
                      child: SvgPicture.asset(rentController.isFavouriteSelected[index]
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
        const SizedBox(height: 10.0)
      ],
    );
  }

  Widget mainItem1(int index) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
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
                    InkWell(
                      onTap: (){
                        rentController.isFavouriteSelected1[index] = !rentController.isFavouriteSelected1[index];
                        rentController.update();
                      },
                      child: SvgPicture.asset(rentController.isFavouriteSelected1[index]
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
        const SizedBox(height: 10.0)
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

  Widget popularLocationItem() {
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Container(
              width: MediaQuery.of(context).size.width /1.5,
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
              decoration: BoxDecoration(
                  color: AppColors.btnColor,
                  borderRadius: BorderRadius.circular(15.0)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bopal ',
                      style: TextStyle(
                          color: AppColors.darkWhiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          fontFamily: AppConstants.fontFamily)),
                  Text('4 Flat Available  ',
                      style: TextStyle(
                          color: AppColors.darkWhiteColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: AppConstants.fontFamily))
                ],
              ),
            ),
            SvgPicture.asset(
              ImageConstants.icShadow,
            ),
          ],
        ),
        const SizedBox(width: 20.0)
      ],
    );
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
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: AppConstants.fontFamily)),
                    InkWell(
                      onTap: (){
                        rentController.isRecentFavouriteSelected[index] = !rentController.isRecentFavouriteSelected[index];
                        rentController.update();
                      },
                      child: SvgPicture.asset(rentController.isRecentFavouriteSelected[index]
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

  Widget brokersItem() {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width /1.5,
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 10.0, 10.0),
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
                  const SizedBox(width: 10.0),
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
                            Expanded(
                              child: Container(
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
                            ),
                            const SizedBox(width: 5.0),
                            Expanded(
                              child: Container(
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
                              ),
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
                    const Text('3',
                        style: TextStyle(
                            color: AppColors.btnColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: AppConstants.fontFamily)),
                    const Text(' years Experience',
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
                    const Text('46',
                        style: TextStyle(
                            color: AppColors.btnColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: AppConstants.fontFamily)),
                    const Text(' Properties',
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
        ),
        const SizedBox(width: 10.0)
      ],
    );
  }

}
