import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../utils/global.dart';
import 'compare_controller.dart';
import 'compare_detail/compare_detail.dart';

class ComparePage extends StatefulWidget {
  const ComparePage({super.key});

  @override
  State<ComparePage> createState() => _ComparePageState();
}

class _ComparePageState extends State<ComparePage> {

  final compareController = Get.put(CompareController());

  @override
  void dispose() {
    Get.delete<CompareController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CompareController(),
        builder: (cont) {
          compareController.context = context;
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
                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 10.0, 8.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: AppColors.grey2BorderColor),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Container(
                                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 15.0),
                                  color: AppColors.grey16Color,
                                  child: Image.asset(
                                    ImageConstants.imgUpcoming,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Sahe Luxury House',
                                        style: TextStyle(
                                            color: AppColors.black1Color,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            fontFamily: AppConstants.fontFamily)),
                                    const SizedBox(height: 5.0),
                                    const Text('4 BHK Luxurious Apartments',
                                        style: TextStyle(
                                            color: AppColors.black1Color,
                                            fontWeight: FontWeight.w300,
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
                                          child: Text('Maharashtra Society, Ahmedabad',
                                              style: TextStyle(
                                                  overflow: TextOverflow.ellipsis,
                                                  color: AppColors.grey10Color,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 12,
                                                  fontFamily: AppConstants.fontFamily)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 30.0),

                        TextFormField(
                          controller: compareController.searchController,
                          decoration: InputDecoration(
                              contentPadding:
                              const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              hintText: 'Search...',
                              hintStyle: const TextStyle(
                                  fontFamily: AppConstants.fontFamily,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.hintColor
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                      color: AppColors.grey3Color
                                  )),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                  ImageConstants.icSearch,height: 14,width: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),

                        const Text('Similar Property',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.black1Color,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: AppConstants.fontFamily)),
                        const SizedBox(height: 20.0),

                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 305.0,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return propertyItem();
                                })),
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
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
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
                  Column(
                    children: [
                      InkWell(
                        onTap:(){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const CompareDetailPage()));
                        } ,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
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
                      const SizedBox(height: 15.0),
                    ],
                  )
                ],
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
                      propertyViewHouseDetails(label: '6', icon: ImageConstants.icBed),
                      const SizedBox(width: 5.0),
                      propertyViewHouseDetails(label: '7', icon: ImageConstants.icBath),
                      const SizedBox(width: 5.0),
                      propertyViewHouseDetails(label: '2050', icon: ImageConstants.icSqft),
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

  Widget propertyViewHouseDetails({required String label, required String icon}) {
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
