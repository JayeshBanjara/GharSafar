import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/global.dart';
import 'builders_detail_controller.dart';

class BuildersDetailPage extends StatefulWidget {
  const BuildersDetailPage({super.key});

  @override
  State<BuildersDetailPage> createState() => _BuildersDetailPageState();
}

class _BuildersDetailPageState extends State<BuildersDetailPage> {

  final buildersDetailController = Get.put(BuildersDetailController());

  @override
  void dispose() {
    Get.delete<BuildersDetailController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: BuildersDetailController(),
        builder: (cont) {
          return Scaffold(
            body: Container(
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 45),

                  Padding(
                    padding: const EdgeInsets.all(AppConstants.screenPadding),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back_ios_new,size: 20,)),
                        const Expanded(
                          child: Text('Builders',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.black2Color,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: AppConstants.fontFamily)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(AppConstants.screenPadding),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                              decoration: BoxDecoration(
                                color: AppColors.lightBlue2,
                                  border: Border.all(color: AppColors.grey2BorderColor),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child:  Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    ImageConstants.imgBakeri,
                                  ),
                                  const SizedBox(width: 15.0),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Bakeri',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: AppColors.darkBlueColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                                fontFamily: AppConstants.fontFamily)),
                                        SizedBox(height: 5.0),
                                        Text('Bakeri Group was set up in 1959.It is one of the oldest and most trusted real estate companies in India.',
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
                            ),
                          ),

                          const Padding(
                            padding: EdgeInsets.all(AppConstants.screenPadding),
                            child: Text('Existing Projects',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.black1Color,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    fontFamily: AppConstants.fontFamily)),
                          ),

                          Container(
                            padding: const EdgeInsets.only(left: 15),
                              height: MediaQuery.of(context).size.height /3.58,
                              child: ListView.separated(
                                padding: const EdgeInsets.only(right: 15),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return existingProjectItem();
                                  }, separatorBuilder: (BuildContext context, int index) {
                                    return const SizedBox(width: 15);
                              },)),

                          const Padding(
                            padding: EdgeInsets.all(AppConstants.screenPadding),
                            child: Text('Bakeri Projects',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.black1Color,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    fontFamily: AppConstants.fontFamily)),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(15,0,15,15),
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 5,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                return projectListItem();
                              }, separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(height: 15);
                            },),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget existingProjectItem() {
    return Container(
      width: MediaQuery.of(context).size.width /2.5,
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              color: AppColors.grey9Color,
              border: Border.all(color: AppColors.grey6Color),
              borderRadius: BorderRadius.circular(25.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.asset(
                  ImageConstants.imgExistingSample,
                ),
              ),
              const SizedBox(height: 10.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('Shaunak',
                    style: TextStyle(
                        color: AppColors.btnColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        fontFamily: AppConstants.fontFamily)),
              ),
              const SizedBox(height: 5.0),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('1 & 2 BHK\nComfortable Homes',
                    style: TextStyle(
                        color: AppColors.black1Color,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: AppConstants.fontFamily)),
              ),
              const SizedBox(height: 10.0),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 4.0),
                        SvgPicture.asset(
                          ImageConstants.icLocation,
                          width: 9.0,
                          height: 10.0,
                        ),
                      ],
                    ),
                    const SizedBox(width: 5.0),
                    const Expanded(
                      child: Text('Bakeri City, Vejalpur, Ahmedabad',
                          style: TextStyle(
                              color: AppColors.grey10Color,
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              fontFamily: AppConstants.fontFamily)),
                    )
                  ],
                ),
              ),
            ],
          ),
        );

  }

  Widget projectListItem(){
    return  Container(
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
            child: Image.asset(
              ImageConstants.imgProjectSample,
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Shaunak',
                    style: TextStyle(
                        color: AppColors.black1Color,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: AppConstants.fontFamily)),
                const SizedBox(height: 5.0),
                const Text('1 & 2 BHK Comfortable Homes',
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
                      child: Text('Bakeri City, Vejalpur, Ahmedabad',
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
    );
  }

}
