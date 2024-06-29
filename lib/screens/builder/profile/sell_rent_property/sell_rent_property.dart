import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ghar_safar/screens/builder/profile/sell_rent_property/sell_rent_property_controller.dart';

import '../../../../utils/global.dart';

class SellRentPropertyPage extends StatefulWidget {
  const SellRentPropertyPage({super.key});

  @override
  State<SellRentPropertyPage> createState() => _SellRentPropertyPageState();
}

class _SellRentPropertyPageState extends State<SellRentPropertyPage> {
  final sellRentPropertyController =
  Get.put(SellRentPropertyController());

  @override
  void dispose() {
    Get.delete<SellRentPropertyController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SellRentPropertyController(),
        builder: (cont) {
          sellRentPropertyController.context = context;
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
                        child: Text('Sell & Rent Property',
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
                  ListView.separated(
                    padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      itemBuilder:
                          (BuildContext context, int index) {
                        return mainItem(index);
                      }, separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 15.0);
                  },))
                ],
              ),
            ),
          );
        });
  }

  Widget mainItem(int index) {
    return Container(
      width: MediaQuery.of(context).size.width,
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
                    sellRentPropertyController.isFavouriteSelected[index] = !sellRentPropertyController.isFavouriteSelected[index];
                    sellRentPropertyController.update();
                  },
                  child: SvgPicture.asset(sellRentPropertyController.isFavouriteSelected[index]
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
