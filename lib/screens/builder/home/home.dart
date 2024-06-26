import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ghar_safar/screens/builder/home/home_controller.dart';

import '../../../utils/global.dart';
import '../../../utils/gradient_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Get.put(HomeController());

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 45),

                  const GradientText('Home',
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
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                            decoration: BoxDecoration(
                                color: AppColors.lightBlue2,
                                border: Border.all(color: AppColors.grey2BorderColor),
                                borderRadius: BorderRadius.circular(25.0)),
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
                          const SizedBox(height: 15.0),

                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                            decoration: BoxDecoration(
                                color: AppColors.btnColor,
                                borderRadius: BorderRadius.circular(20.0)),
                            child:  Row(
                              children: [
                                SvgPicture.asset(
                                  ImageConstants.icPlus,
                                ),
                                const SizedBox(width: 20.0),
                                const Text('Add Property',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        fontFamily: AppConstants.fontFamily)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15.0),

                          const Text('Added Propertys',
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
                                    return mainItem(index);
                                  })),

                        ],
                      ),
                    ),
                  )
                ],
              ));
        });
  }

  Widget mainItem(int index) {
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
                        homeController.isFavouriteSelected[index] = !homeController.isFavouriteSelected[index];
                        homeController.update();
                      },
                      child: SvgPicture.asset(homeController.isFavouriteSelected[index]
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
}
