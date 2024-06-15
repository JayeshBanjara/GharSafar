import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../utils/global.dart';
import 'compare_detail_controller.dart';

class CompareDetailPage extends StatefulWidget {
  const CompareDetailPage({super.key});

  @override
  State<CompareDetailPage> createState() => _CompareDetailPageState();
}

class _CompareDetailPageState extends State<CompareDetailPage> {

  final compareDetailController = Get.put(CompareDetailController());

  @override
  void dispose() {
    Get.delete<CompareDetailController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CompareDetailController(),
        builder: (cont) {
          compareDetailController.context = context;
          return Scaffold(
            body: Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(15,15,0,15),
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
                        child: Text('Compare',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: AppConstants.fontFamily)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),

                  Expanded(child:
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: AppColors.grey6Color),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: const Text('Features',
                                  style: TextStyle(
                                      color: AppColors.black1Color,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      fontFamily: AppConstants.fontFamily)),
                            ),
                            const SizedBox(width: 20.0),

                            Expanded(
                              child: SizedBox(
                                  height: 132.0,
                                  child: ListView.separated(
                                    padding: const EdgeInsets.only(right: 15),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 5,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return propertyItem();
                                      }, separatorBuilder: (BuildContext context, int index) {
                                    return const SizedBox(width: 10.0);
                                  },)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30.0),

                        const Text('Project Details',
                            style: TextStyle(
                                color: AppColors.black1Color,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: AppConstants.fontFamily)),
                        const SizedBox(height: 20.0),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                projectDetails(label: 'Developer Name', value1: 'ATS Infrastructure', value2: 'Mahagun Group'),
                                const SizedBox(height: 10.0),
                                projectDetails(label: 'Flat', value1: '3 BHK', value2: '4 BHK'),
                                const SizedBox(height: 10.0),
                                projectDetails(label: 'Bedroom', value1: '3', value2: '4'),
                                const SizedBox(height: 10.0),
                                projectDetails(label: 'Area', value1: '1360 S', value2: '1380 S'),
                                const SizedBox(height: 10.0),
                                projectDetails(label: 'Bathroom', value1: '4', value2: '5'),
                                const SizedBox(height: 10.0),
                                projectDetails(label: 'Floor', value1: '3', value2: '6'),
                                const SizedBox(height: 10.0),
                                projectDetails(label: 'Facing', value1: 'East', value2: 'East'),
                                const SizedBox(height: 10.0),
                                projectDetails(label: 'Furnished Status', value1: 'Unfurnished', value2: 'furnished'),
                                const SizedBox(height: 10.0),

                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),

                        const Text('Master Plan',
                            style: TextStyle(
                                color: AppColors.black1Color,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: AppConstants.fontFamily)),
                        const SizedBox(height: 20.0),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                projectDetails(label: 'Construction Age', value1: '20 years', value2: '25 years'),
                                const SizedBox(height: 10.0),
                                projectDetails(label: 'Price/Sqft', value1: '₹3566', value2: '₹3566'),
                                const SizedBox(height: 10.0),
                                projectDetails(label: 'Maintenance/Sqft', value1: '₹566', value2: '₹366'),
                                const SizedBox(height: 10.0),
                                projectDetails1(label: 'Possession Date & Status', value1: '20 Jan 2022', value2: '17 Jan 2024'),
                                const SizedBox(height: 10.0),
                                projectDetails(label: 'Project Land Area', value1: 'Ready to Move', value2: 'Under construction'),
                                const SizedBox(height: 10.0),
                                projectDetails(label: 'Units/Floor', value1: '4 Flat', value2: '8 Flats'),
                                const SizedBox(height: 10.0),
                                projectDetails(label: 'Ceiling Height', value1: '10 Feet', value2: '11 Feet'),
                                const SizedBox(height: 10.0),
                                projectDetails(label: 'Unit Type', value1: '2,3 BHK', value2: '2,3,4 BHK'),
                                const SizedBox(height: 10.0),

                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),

                        const Text('Amenities',
                            style: TextStyle(
                                color: AppColors.black1Color,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: AppConstants.fontFamily)),
                        const SizedBox(height: 20.0),

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                projectDetails(label: 'Power Backup', value1: 'Yes', value2: 'No', color1: AppColors.greenColor, color2: AppColors.redColor),
                                const SizedBox(height: 10.0),
                                projectDetails(label: 'Piped Gas', value1: 'Yes', value2: 'No', color1: AppColors.greenColor, color2: AppColors.redColor),
                                const SizedBox(height: 10.0),
                                projectDetails(label: 'Clubhouse', value1: 'Yes', value2: 'No', color1: AppColors.greenColor, color2: AppColors.redColor),
                                const SizedBox(height: 10.0),
                                projectDetails1(label: 'Children’s /toddler’s Play Area', value1: 'Yes', value2: 'No', color1: AppColors.greenColor, color2: AppColors.redColor),
                                const SizedBox(height: 10.0),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ))
                ],
              ),
            ),
          );
        });
  }

  Widget propertyItem() {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.grey6Color),
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
              color: AppColors.grey7Color,
              child: Image.asset(
                ImageConstants.tempHomeSample1,
                height: 50.0,
              ),
            ),
          ),
          const Text('Moun Luxury House',
              style: TextStyle(
                  color: AppColors.black1Color,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontFamily: AppConstants.fontFamily)),
          const SizedBox(height: 10.0),
          Row(
            children: [
              SvgPicture.asset(
                ImageConstants.icLocation,
                width: 9.0,
                height: 10.0,
              ),
              const SizedBox(width: 5.0),
              const Expanded(
                child: Text('2517 Washington Ave. Manchester, New Jersey.',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                        color: AppColors.grey8Color,
                        fontWeight: FontWeight.w300,
                        fontSize: 10,
                        fontFamily: AppConstants.fontFamily)),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget projectDetails({required String label, required String value1,required String value2,Color? color1,Color? color2}) {
    return  Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.7,
          padding: const EdgeInsets.fromLTRB(10,10,7,10),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.grey6Color),
              borderRadius: BorderRadius.circular(10.0)),
          child: Text(label,
              style: const TextStyle(
                  color: AppColors.black1Color,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: AppConstants.fontFamily)),
        ),
        const SizedBox(width: 20.0),
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
          padding:  const EdgeInsets.fromLTRB(0,3,0,3),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.grey6Color),
              borderRadius: BorderRadius.circular(10.0)),
          child: Table(
              columnWidths: const {
                0: FlexColumnWidth(1.1),
              },
              border: const TableBorder(
                  verticalInside: BorderSide(
                      color: AppColors.grey6Color,
                      width: 1)),
              children:  [
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,7,7,7),
                    child: Text(value1,
                        style:  TextStyle(
                            color: color1 ?? AppColors.black1Color,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: AppConstants.fontFamily)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10,7,7,7),
                    child: Text(value2,
                        style: TextStyle(
                            color: color2 ??AppColors.black1Color,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            fontFamily: AppConstants.fontFamily)),
                  ),
                ]),
              ]),
        ),
      ],
    );
  }

  Widget projectDetails1({required String label, required String value1,required String value2,Color? color1,Color? color2}) {
    return  Row(
        children: [
    Container(
    width: MediaQuery.of(context).size.width / 2.7,
    padding: const EdgeInsets.fromLTRB(10,10,7,10),
    decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(color: AppColors.grey6Color),
    borderRadius: BorderRadius.circular(10.0)),
    child: Text(label,
    style: const TextStyle(
    color: AppColors.black1Color,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    fontFamily: AppConstants.fontFamily)),
    ),
    const SizedBox(width: 20.0),
    Container(
    width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height / 14,
    padding:  const EdgeInsets.fromLTRB(0,6,0,6),
    decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(color: AppColors.grey6Color),
    borderRadius: BorderRadius.circular(10.0)),
    child: Table(
    columnWidths: const {
    0: FlexColumnWidth(1.1),
    },
    border: const TableBorder(
    verticalInside: BorderSide(
    color: AppColors.grey6Color,
    width: 1)),
    children:  [
    TableRow(children: [
    Padding(
    padding: const EdgeInsets.fromLTRB(10,14,7,14),
    child: Text(value1,
    style:  TextStyle(
    color: color1 ?? AppColors.black1Color,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    fontFamily: AppConstants.fontFamily)),
    ),
    Padding(
    padding: const EdgeInsets.fromLTRB(10,14,7,14),
    child: Text(value2,
    style: TextStyle(
    color: color2 ??AppColors.black1Color,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    fontFamily: AppConstants.fontFamily)),
    ),
    ]),
    ]),
    ),
    ],
    );
  }
}
