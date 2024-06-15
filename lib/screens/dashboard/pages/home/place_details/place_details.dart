import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ghar_safar/screens/dashboard/pages/home/place_details/photo_view/photo_view.dart';
import 'package:ghar_safar/screens/dashboard/pages/home/place_details/place_details_controller.dart';
import 'package:ghar_safar/utils/global.dart';

import 'compare/compare.dart';

class PlaceDetailsPage extends StatefulWidget {
  const PlaceDetailsPage({super.key});

  @override
  State<PlaceDetailsPage> createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {

  final filterController = Get.put(PlaceDetailsController());

  final items = [Image.asset(ImageConstants.tempHomeSample1),
    Image.asset(ImageConstants.tempHomeSample1),
    Image.asset(ImageConstants.tempHomeSample1)];

  @override
  void dispose() {
    Get.delete<PlaceDetailsController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PlaceDetailsController(),
        builder: (cont) {
          filterController.context = context;
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
                        child: Text('Place Details',
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
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            Column(
                              children: [
                                CarouselSlider(
                                    items: items,
                                    options: CarouselOptions(
                                        viewportFraction: 1,
                                        onPageChanged: (index, reason){
                                          filterController.currentIndex = index;
                                          filterController.update();
                                        }
                                    )),
                                DotsIndicator(
                                    decorator: const DotsDecorator(
                                      spacing: EdgeInsets.all(3),
                                        color: AppColors.grey12Color,
                                        activeColor: AppColors.btnColor
                                    ),
                                    dotsCount: items.length,
                                    position:filterController.currentIndex)
                              ],
                            ),
                            SvgPicture.asset(
                                ImageConstants.img360
                            ),
                          ],
                        ),
                        const SizedBox(height: 25.0),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Sahe Luxury House',
                                      style: TextStyle(
                                          color: AppColors.blackColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 26,
                                          fontFamily: AppConstants.fontFamily)),
                                  const SizedBox(height: 5.0),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          const SizedBox(height: 4.0),
                                          SvgPicture.asset(
                                            ImageConstants.icLocation,
                                            width: 16,
                                            height: 16.0,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 5.0),
                                      const Expanded(
                                        child: Text('2517 Washington. Manchester,New Jersey.',
                                            style: TextStyle(
                                                color: AppColors.grey10Color,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                fontFamily: AppConstants.fontFamily)),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SvgPicture.asset(
                              ImageConstants.icHeartRound,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15.0),

                        Row(
                          children: [
                            houseDetails(label: '3', icon: ImageConstants.icBed),
                            const SizedBox(width: 10.0),
                            houseDetails(label: '3', icon: ImageConstants.icBath),
                            const SizedBox(width: 10.0),
                            houseDetails(label: '1360', icon: ImageConstants.icSqft),
                            const SizedBox(width: 10.0),
                            houseDetails(label: '3 BHK', icon: ImageConstants.icMax),
                          ],
                        ),
                        const SizedBox(height: 20.0),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grey2BorderColor),
                              borderRadius: BorderRadius.circular(20.0)),
                          child:  Column(
                            children: [
                              Table(
                                  columnWidths: const {
                                    0: FlexColumnWidth(3.5),
                                    1: FlexColumnWidth(2.4),
                                    2: FlexColumnWidth(2.5),
                                  },
                                  children: const [
                                    TableRow(children: [
                                      Text('Developer',
                                          style: TextStyle(
                                              color: AppColors.grey10Color,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              fontFamily: AppConstants.fontFamily)),
                                      Text('Floor',
                                          style: TextStyle(
                                              color: AppColors.grey10Color,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              fontFamily: AppConstants.fontFamily)),
                                      Text('Facing',
                                          style: TextStyle(
                                              color: AppColors.grey10Color,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              fontFamily: AppConstants.fontFamily))
                                    ]),
                                    TableRow(
                                      children: [
                                        Text('SOBHA Ltd.',
                                            style: TextStyle(
                                                color: AppColors.btnColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                fontFamily: AppConstants.fontFamily)),
                                        Text('4',
                                            style: TextStyle(
                                                color: AppColors.btnColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                fontFamily: AppConstants.fontFamily)),
                                        Text('East',
                                            style: TextStyle(
                                                color: AppColors.btnColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                fontFamily: AppConstants.fontFamily))
                                      ],
                                    ),
                                  ]),
                              const SizedBox(height: 15.0),
                              Table(
                                  columnWidths: const {
                                    0: FlexColumnWidth(2.2),
                                    1: FlexColumnWidth(3.1),
                                  },
                                  children: const [
                                    TableRow(children: [
                                      Text('Furnished Status',
                                          style: TextStyle(
                                              color: AppColors.grey10Color,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              fontFamily: AppConstants.fontFamily)),
                                      Text('Construction Age',
                                          style: TextStyle(
                                              color: AppColors.grey10Color,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              fontFamily: AppConstants.fontFamily)),
                                    ]),
                                    TableRow(
                                      children: [
                                        Text('Unfurnished',
                                            style: TextStyle(
                                                color: AppColors.btnColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                fontFamily: AppConstants.fontFamily)),
                                        Text('20 years',
                                            style: TextStyle(
                                                color: AppColors.btnColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                fontFamily: AppConstants.fontFamily)),
                                      ],
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15.0),

                        const Text('Gallery',
                            style: TextStyle(
                                color: AppColors.black1Color,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: AppConstants.fontFamily)),
                        const SizedBox(height: 15.0),

                        SizedBox(
                          height: 150,
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                return InkWell(
                                  onTap:(){
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) => const PhotoViewPage()));
                                  } ,
                                  child: Image.asset(
                                    ImageConstants.imgGallery,
                                  ),
                                );
                              }, separatorBuilder: (BuildContext context, int index) {
                                return const SizedBox(width: 15);
                          },),
                        ),
                        const SizedBox(height: 15.0),

                        const Text('Recent View',
                            style: TextStyle(
                                color: AppColors.black1Color,
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
                                  return recentViewItem();
                                })),
                        const SizedBox(height: 25.0),

                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              inquireDialogue();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: AppColors.gradiantColor,
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: const Text('Inquiry',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      fontFamily: AppConstants.fontFamily)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        InkWell(
                          onTap:(){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => const ComparePage()));
                          } ,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                            decoration: BoxDecoration(
                                color: AppColors.btnColor,
                                borderRadius: BorderRadius.circular(50.0)),
                            child: const Text('Compare',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    fontFamily: AppConstants.fontFamily)),
                          ),
                        ),
                      ],
                    )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          );
        });
  }

  Widget houseDetails({required String label, required String icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
          color: AppColors.grey15Color,
          border: Border.all(color: AppColors.grey2BorderColor),
          borderRadius: BorderRadius.circular(50.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label,
              style: const TextStyle(
                  color: AppColors.btnColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: AppConstants.fontFamily)),
          const SizedBox(width: 10),
          SvgPicture.asset(
            icon,
            height: 15,
            width: 15,
          ),
        ],
      ),
    );
  }

  Widget recentViewItem() {
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

  void inquireDialogue() async {
    await showDialog(
      context: filterController.context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(color: AppColors.grey2BorderColor)
        ),
        alignment: Alignment.center,
        titlePadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 20),
        insetPadding: const EdgeInsets.all(20),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: filterController.nameController,
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                    hintText: 'First Name',
                    hintStyle: const TextStyle(
                        fontFamily: AppConstants.fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey10Color
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                            color: AppColors.borderColor
                        ))
                ),
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: filterController.mailController,
                decoration: InputDecoration(
                    contentPadding:
                    const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                        fontFamily: AppConstants.fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey10Color
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                            color: AppColors.borderColor
                        ))
                ),
              ),
              const SizedBox(height: 15),

              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                    contentPadding:
                    const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    filled: true,
                    fillColor: AppColors.lightBlue2,
                    hintText: '+91 7694  356 362',
                    hintStyle: const TextStyle(
                        fontFamily: AppConstants.fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.btnColor
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                            color: AppColors.btnColor
                        )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                            color: AppColors.btnColor
                        ))
                ),
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: filterController.availabilityController,
                decoration: InputDecoration(
                    contentPadding:
                    const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    hintText: 'Address',
                    hintStyle: const TextStyle(
                        fontFamily: AppConstants.fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey10Color
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                            color: AppColors.borderColor
                        ))
                ),
              ),
              const SizedBox(height: 15),

              TextFormField(
                maxLines: 5,
                controller: filterController.questionController,
                decoration: InputDecoration(
                    contentPadding:
                    const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    hintText: 'Write your FREE Question',
                    hintStyle: const TextStyle(
                        fontFamily: AppConstants.fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey10Color
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                            color: AppColors.borderColor
                        ))
                ),
              ),
              const SizedBox(height: 15),

              RichText(
                  text: const TextSpan(
                      text:
                      'By continuing I agree to Ghar Safar ',
                      style: TextStyle(
                          color:AppColors.grey10Color,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: AppConstants.fontFamily),
                      children: [
                        TextSpan(
                            text: 'T&C, Privacy policy',
                            style: TextStyle(
                                color:AppColors.black2Color,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                fontFamily: AppConstants.fontFamily))
                      ])),
              const SizedBox(height: 15),

              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  decoration: BoxDecoration(
                      color: AppColors.btnColor,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: const Text('Ask Question',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          fontFamily: AppConstants.fontFamily)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
