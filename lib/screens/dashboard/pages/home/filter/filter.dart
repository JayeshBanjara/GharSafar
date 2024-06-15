import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/global.dart';
import 'filter_controller.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {

  final filterController = Get.put(FilterController());

  double start = 30.0;
  double start1 = 30.0;
  double end = 50.0;
  double end1 = 50.0;

  @override
  void dispose() {
    Get.delete<FilterController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: FilterController(),
        builder: (cont) {
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
                        child: Text('Filter',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.black2Color,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: AppConstants.fontFamily)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25.0),

                   Expanded(child:
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  filterController.isBuyRentSelected = 1;
                                  filterController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: filterController.isBuyRentSelected == 1
                                      ?AppColors.btnColor:AppColors.lightBlue2,
                                      border: Border.all(color:
                                      filterController.isBuyRentSelected == 1
                                          ?AppColors.btnColor:AppColors.btnColor),
                                      borderRadius: BorderRadius.circular(25.0)),
                                  child:
                                   Text('Buy',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: filterController.isBuyRentSelected == 1
                                          ?Colors.white:AppColors.btnColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          fontFamily: AppConstants.fontFamily)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15.0),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  filterController.isBuyRentSelected = 2;
                                  filterController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: filterController.isBuyRentSelected == 2
                                          ?AppColors.btnColor:AppColors.lightBlue2,
                                      border: Border.all(color:
                                      filterController.isBuyRentSelected == 2
                                          ?AppColors.btnColor:AppColors.btnColor),
                                      borderRadius: BorderRadius.circular(25.0)),
                                  child:
                                  Text('Rent',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: filterController.isBuyRentSelected == 2
                                              ?Colors.white:AppColors.btnColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          fontFamily: AppConstants.fontFamily)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15.0),


                        const Text('Property type',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.black2Color,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                fontFamily: AppConstants.fontFamily)),
                        const SizedBox(height: 25.0),

                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  filterController.currentPage = 1;
                                  filterController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                                  decoration: BoxDecoration(
                                      color: filterController.currentPage == 1
                                          ?AppColors.btnColor
                                          :Colors.white,
                                      border: Border.all(color: filterController.currentPage == 1
                                          ?AppColors.btnColor:AppColors.borderColor),
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(ImageConstants.icHouse,
                                        color: filterController.currentPage == 1
                                            ?Colors.white:AppColors.greyIcColor,),
                                      const SizedBox(width: 10.0),
                                      Text('House',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: filterController.currentPage == 1
                                                  ?Colors.white:AppColors.grey5Color,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              fontFamily: AppConstants.fontFamily)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 25.0),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  filterController.currentPage = 2;
                                  filterController.update();
                                },
                                child: Stack(
                                  alignment: AlignmentDirectional.topEnd,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                                      decoration: BoxDecoration(
                                          color: filterController.currentPage == 2
                                              ?AppColors.btnColor
                                              :Colors.white,
                                          border: Border.all(color: filterController.currentPage == 2
                                              ?AppColors.btnColor:AppColors.borderColor),
                                          borderRadius: BorderRadius.circular(20.0)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(ImageConstants.icVilla,
                                            color:  filterController.currentPage == 2
                                                ?Colors.white:AppColors.greyIcColor,),
                                          const SizedBox(width: 10.0),
                                          Text('Vila',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: filterController.currentPage == 2
                                                      ?Colors.white:AppColors.grey5Color,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  fontFamily: AppConstants.fontFamily)),
                                        ],
                                      ),
                                    ),
                                    SvgPicture.asset(ImageConstants.icShadow1)
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  filterController.currentPage = 3;
                                  filterController.update();
                                },
                                child: Stack(
                                  alignment: AlignmentDirectional.topEnd,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                                      decoration: BoxDecoration(
                                          color: filterController.currentPage == 3
                                              ?AppColors.btnColor
                                              :Colors.white,
                                          border: Border.all(color: filterController.currentPage == 3
                                              ?AppColors.btnColor:AppColors.borderColor),
                                          borderRadius: BorderRadius.circular(20.0)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(ImageConstants.icVilla,
                                            color:  filterController.currentPage == 3
                                                ?Colors.white:AppColors.greyIcColor,),
                                          const SizedBox(width: 10.0),
                                          Text('Vila',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: filterController.currentPage == 3
                                                      ?Colors.white:AppColors.grey5Color,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  fontFamily: AppConstants.fontFamily)),
                                        ],
                                      ),
                                    ),
                                    SvgPicture.asset(ImageConstants.icShadow1)
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 25.0),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  filterController.currentPage = 4;
                                  filterController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                                  decoration: BoxDecoration(
                                      color: filterController.currentPage == 4
                                          ?AppColors.btnColor
                                          :Colors.white,
                                      border: Border.all(color: filterController.currentPage == 4
                                          ?AppColors.btnColor:AppColors.borderColor),
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(ImageConstants.icHouse,
                                        color: filterController.currentPage == 4
                                            ?Colors.white:AppColors.greyIcColor,),
                                      const SizedBox(width: 10.0),
                                      Text('House',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: filterController.currentPage == 4
                                                  ?Colors.white:AppColors.grey5Color,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              fontFamily: AppConstants.fontFamily)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15.0),

                        const Text('Price range',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.black2Color,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                fontFamily: AppConstants.fontFamily)),
                        const SizedBox(height: 10.0),

                        RangeSlider(
                          values: filterController.currentPriceRange,
                          min: 0,
                          max: 100000,
                          divisions: 1000,
                          activeColor: Colors.blue,
                          inactiveColor: Colors.grey,
                          labels: RangeLabels(
                            '₹${filterController.currentPriceRange.start.round()}',
                            '₹${filterController.currentPriceRange.end.round()}',
                          ),
                          onChanged: (RangeValues values) {
                            filterController.currentPriceRange = values;
                            filterController.update();
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '₹${filterController.currentPriceRange.start.round()}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppConstants.fontFamily,
                                color: Colors.black
                              ),
                            ),
                            Text(
                              '₹${filterController.currentPriceRange.end.round()}',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppConstants.fontFamily,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),

                        const Text('Area',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.black2Color,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                fontFamily: AppConstants.fontFamily)),
                        const SizedBox(height: 10.0),

                        RangeSlider(
                          values: filterController.currentAreaRange,
                          min: 0,
                          max: 10000,
                          divisions: 100,
                          activeColor: Colors.blue,
                          inactiveColor: Colors.grey,
                          labels: RangeLabels(
                            '₹${filterController.currentAreaRange.start.round()}',
                            '₹${filterController.currentAreaRange.end.round()}',
                          ),
                          onChanged: (RangeValues values) {
                            filterController.currentAreaRange = values;
                            filterController.update();
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${filterController.currentAreaRange.start.round()} sq',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppConstants.fontFamily,
                                  color: Colors.black
                              ),
                            ),
                            Text(
                              '${filterController.currentAreaRange.end.round()} sq',
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppConstants.fontFamily,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10.0),

                        const Text('Bedrooms',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.black2Color,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                fontFamily: AppConstants.fontFamily)),
                        const SizedBox(height: 15.0),

                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  filterController.bedroomValue = 1;
                                  filterController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: filterController.bedroomValue == 1
                                          ?AppColors.btnColor
                                          :Colors.white,
                                      border: Border.all(color: filterController.bedroomValue == 1
                                          ?AppColors.btnColor:AppColors.greyBorderColor),
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child:
                                      Text('1',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: filterController.bedroomValue == 1
                                                  ?Colors.white:AppColors.black2Color,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              fontFamily: AppConstants.fontFamily)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  filterController.bedroomValue = 2;
                                  filterController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: filterController.bedroomValue == 2
                                          ?AppColors.btnColor
                                          :Colors.white,
                                      border: Border.all(color: filterController.bedroomValue == 2
                                          ?AppColors.btnColor:AppColors.greyBorderColor),
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child:
                                  Text('2',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: filterController.bedroomValue == 2
                                              ?Colors.white:AppColors.black2Color,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          fontFamily: AppConstants.fontFamily)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  filterController.bedroomValue = 3;
                                  filterController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: filterController.bedroomValue == 3
                                          ?AppColors.btnColor
                                          :Colors.white,
                                      border: Border.all(color: filterController.bedroomValue == 3
                                          ?AppColors.btnColor:AppColors.greyBorderColor),
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child:
                                  Text('3',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: filterController.bedroomValue == 3
                                              ?Colors.white:AppColors.black2Color,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          fontFamily: AppConstants.fontFamily)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  filterController.bedroomValue = 4;
                                  filterController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: filterController.bedroomValue == 4
                                          ?AppColors.btnColor
                                          :Colors.white,
                                      border: Border.all(color: filterController.bedroomValue == 4
                                          ?AppColors.btnColor:AppColors.greyBorderColor),
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child:
                                  Text('4',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: filterController.bedroomValue == 4
                                              ?Colors.white:AppColors.black2Color,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          fontFamily: AppConstants.fontFamily)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  filterController.bedroomValue = 5;
                                  filterController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: filterController.bedroomValue == 5
                                          ?AppColors.btnColor
                                          :Colors.white,
                                      border: Border.all(color: filterController.bedroomValue == 5
                                          ?AppColors.btnColor:AppColors.greyBorderColor),
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child:
                                  Text('5',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: filterController.bedroomValue == 5
                                              ?Colors.white:AppColors.black2Color,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          fontFamily: AppConstants.fontFamily)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  filterController.bedroomValue = 6;
                                  filterController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: filterController.bedroomValue == 6
                                          ?AppColors.btnColor
                                          :Colors.white,
                                      border: Border.all(color: filterController.bedroomValue == 6
                                          ?AppColors.btnColor:AppColors.greyBorderColor),
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child:
                                  Text('Any',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: filterController.bedroomValue == 6
                                              ?Colors.white:AppColors.black2Color,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          fontFamily: AppConstants.fontFamily)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25.0),

                        const Text('Beds',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.black2Color,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                fontFamily: AppConstants.fontFamily)),
                        const SizedBox(height: 15.0),

                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  filterController.bedValue = 1;
                                  filterController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: filterController.bedValue == 1
                                          ?AppColors.btnColor
                                          :Colors.white,
                                      border: Border.all(color: filterController.bedValue == 1
                                          ?AppColors.btnColor:AppColors.greyBorderColor),
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child:
                                  Text('1',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: filterController.bedValue == 1
                                              ?Colors.white:AppColors.black2Color,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          fontFamily: AppConstants.fontFamily)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  filterController.bedValue = 2;
                                  filterController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: filterController.bedValue == 2
                                          ?AppColors.btnColor
                                          :Colors.white,
                                      border: Border.all(color: filterController.bedValue == 2
                                          ?AppColors.btnColor:AppColors.greyBorderColor),
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child:
                                  Text('2',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: filterController.bedValue == 2
                                              ?Colors.white:AppColors.black2Color,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          fontFamily: AppConstants.fontFamily)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  filterController.bedValue = 3;
                                  filterController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: filterController.bedValue == 3
                                          ?AppColors.btnColor
                                          :Colors.white,
                                      border: Border.all(color: filterController.bedValue == 3
                                          ?AppColors.btnColor:AppColors.greyBorderColor),
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child:
                                  Text('3',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: filterController.bedValue == 3
                                              ?Colors.white:AppColors.black2Color,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          fontFamily: AppConstants.fontFamily)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  filterController.bedValue = 4;
                                  filterController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: filterController.bedValue == 4
                                          ?AppColors.btnColor
                                          :Colors.white,
                                      border: Border.all(color: filterController.bedValue == 4
                                          ?AppColors.btnColor:AppColors.greyBorderColor),
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child:
                                  Text('4',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: filterController.bedValue == 4
                                              ?Colors.white:AppColors.black2Color,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          fontFamily: AppConstants.fontFamily)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  filterController.bedValue = 5;
                                  filterController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: filterController.bedValue == 5
                                          ?AppColors.btnColor
                                          :Colors.white,
                                      border: Border.all(color: filterController.bedValue == 5
                                          ?AppColors.btnColor:AppColors.greyBorderColor),
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child:
                                  Text('5',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: filterController.bedValue == 5
                                              ?Colors.white:AppColors.black2Color,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          fontFamily: AppConstants.fontFamily)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  filterController.bedValue = 6;
                                  filterController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: filterController.bedValue == 6
                                          ?AppColors.btnColor
                                          :Colors.white,
                                      border: Border.all(color: filterController.bedValue == 6
                                          ?AppColors.btnColor:AppColors.greyBorderColor),
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child:
                                  Text('Any',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: filterController.bedValue == 6
                                              ?Colors.white:AppColors.black2Color,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          fontFamily: AppConstants.fontFamily)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25.0),

                        const Text('Amenities',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.black2Color,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                fontFamily: AppConstants.fontFamily)),
                        const SizedBox(height: 15.0),

                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  filterController.amenitiesValue = 1;
                                  filterController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: filterController.amenitiesValue == 1
                                          ?AppColors.btnColor
                                          :Colors.white,
                                      border: Border.all(color: filterController.amenitiesValue == 1
                                          ?AppColors.btnColor:AppColors.greyBorderColor),
                                      borderRadius: BorderRadius.circular(25.0)),
                                  child:
                                  Text('Kitchen',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: filterController.amenitiesValue == 1
                                              ?Colors.white:AppColors.grey14Color,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          fontFamily: AppConstants.fontFamily)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15.0),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  filterController.amenitiesValue = 2;
                                  filterController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: filterController.amenitiesValue == 2
                                          ?AppColors.btnColor
                                          :Colors.white,
                                      border: Border.all(color: filterController.amenitiesValue == 2
                                          ?AppColors.btnColor:AppColors.greyBorderColor),
                                      borderRadius: BorderRadius.circular(25.0)),
                                  child:
                                  Text('Air Conditioner',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: filterController.amenitiesValue == 2
                                              ?Colors.white:AppColors.grey14Color,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          fontFamily: AppConstants.fontFamily)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  filterController.amenitiesValue = 3;
                                  filterController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: filterController.amenitiesValue == 3
                                          ?AppColors.btnColor
                                          :Colors.white,
                                      border: Border.all(color: filterController.amenitiesValue == 3
                                          ?AppColors.btnColor:AppColors.greyBorderColor),
                                      borderRadius: BorderRadius.circular(25.0)),
                                  child:
                                  Text('Kitchen',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: filterController.amenitiesValue == 3
                                              ?Colors.white:AppColors.grey14Color,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          fontFamily: AppConstants.fontFamily)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15.0),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  filterController.amenitiesValue = 4;
                                  filterController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: filterController.amenitiesValue == 4
                                          ?AppColors.btnColor
                                          :Colors.white,
                                      border: Border.all(color: filterController.amenitiesValue == 4
                                          ?AppColors.btnColor:AppColors.greyBorderColor),
                                      borderRadius: BorderRadius.circular(25.0)),
                                  child:
                                  Text('Air Conditioner',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: filterController.amenitiesValue == 4
                                              ?Colors.white:AppColors.grey14Color,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          fontFamily: AppConstants.fontFamily)),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 25.0),
                        InkWell(
                          onTap: (){

                          },
                          child: Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                                color: AppColors.btnColor,
                                border: Border.all(color:
                                AppColors.btnColor),
                                borderRadius: BorderRadius.circular(25.0)),
                            child:
                            const Text('Save Filter',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    fontFamily: AppConstants.fontFamily)),
                          ),
                        ),
                      ],
                    ),
                  )),

                ],
              ),
            ),
          );
        });
  }
}