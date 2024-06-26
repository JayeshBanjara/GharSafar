import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ghar_safar/screens/builder/builder_registration/post_property/post_property_controller.dart';
import 'package:ghar_safar/screens/builder/builder_registration/post_property/property_features.dart';

import '../../../../../../utils/custom_text_form_field.dart';
import '../../../../../../utils/global.dart';

class PostPropertyPage extends StatefulWidget {
  const PostPropertyPage({super.key});

  @override
  State<PostPropertyPage> createState() => _PostPropertyPageState();
}

class _PostPropertyPageState extends State<PostPropertyPage> {
  final postPropertyController =
  Get.put(PostPropertyController());

  @override
  void dispose() {
    Get.delete<PostPropertyController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PostPropertyController(),
        builder: (cont) {
          postPropertyController.context = context;
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
                        child: Text('Post Property',
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
                        const Text('Do you want to',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.black1Color,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: AppConstants.fontFamily)),
                        const SizedBox(height: 15.0),

                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  postPropertyController.currentPage = 1;
                                  postPropertyController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                  decoration: BoxDecoration(
                                      color: postPropertyController.currentPage == 1
                                          ?AppColors.btnColor
                                          :Colors.white,
                                      border: Border.all(color: postPropertyController.currentPage == 1
                                          ?AppColors.btnColor:AppColors.borderColor),
                                      borderRadius: BorderRadius.circular(50.0)),
                                  child: Text('Sell',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: postPropertyController.currentPage == 1
                                              ?Colors.white:AppColors.black4Color,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          fontFamily: AppConstants.fontFamily)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  postPropertyController.currentPage = 2;
                                  postPropertyController.update();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                  decoration: BoxDecoration(
                                      color: postPropertyController.currentPage == 2
                                          ?AppColors.btnColor
                                          :Colors.white,
                                      border: Border.all(color: postPropertyController.currentPage == 2
                                          ?AppColors.btnColor:AppColors.borderColor),
                                      borderRadius: BorderRadius.circular(50.0)),
                                  child: Text('Rent Out',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: postPropertyController.currentPage == 2
                                              ?Colors.white:AppColors.black4Color,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          fontFamily: AppConstants.fontFamily)),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 15.0),

                        const Text('Property Type',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.black1Color,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: AppConstants.fontFamily)),
                        const SizedBox(height: 15.0),

                        Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.borderColor),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: Colors.white,
                          value: postPropertyController.selectedItem,
                          hint: const Text('Property Type',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.grey10Color,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: AppConstants.fontFamily)),
                          icon: SvgPicture.asset(ImageConstants.icDownArrow),
                          iconSize: 24,
                          style: const TextStyle(color: Colors.black, fontSize: 16),
                          onChanged: (String? newValue) {
                            setState(() {
                              postPropertyController.selectedItem = newValue;
                            });
                          },
                          items: postPropertyController.dropdownItems.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                        const SizedBox(height: 15.0),

                        const Text('Area and total price',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.black1Color,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: AppConstants.fontFamily)),
                        const SizedBox(height: 15.0),

                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: AppColors.borderColor),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: Colors.white,
                              value: postPropertyController.selectedCoveredItem,
                              hint: const Text('Covered Area ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.grey10Color,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontFamily: AppConstants.fontFamily)),
                              icon: SvgPicture.asset(ImageConstants.icDownArrow),
                              iconSize: 24,
                              style: const TextStyle(color: Colors.black, fontSize: 16),
                              onChanged: (String? newValue) {
                                setState(() {
                                  postPropertyController.selectedCoveredItem = newValue;
                                });
                              },
                              items: postPropertyController.coveredItems.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),

                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: AppColors.borderColor),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: Colors.white,
                              value: postPropertyController.selectedCarpetItem,
                              hint: const Text('Carpet Area',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.grey10Color,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontFamily: AppConstants.fontFamily)),
                              icon: SvgPicture.asset(ImageConstants.icDownArrow),
                              iconSize: 24,
                              style: const TextStyle(color: Colors.black, fontSize: 16),
                              onChanged: (String? newValue) {
                                setState(() {
                                  postPropertyController.selectedCarpetItem = newValue;
                                });
                              },
                              items: postPropertyController.carpetItems.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),

                        postPropertyController.currentPage == 1
                        ?CustomBoxTextFormField(
                            controller: postPropertyController.totalPriceController,
                            keyboardType: TextInputType.number,
                            hintText: "Total Price",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            })
                        :CustomBoxTextFormField(
                            controller: postPropertyController.rentController,
                            keyboardType: TextInputType.number,
                            hintText: "Monthly Rent",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 15.0),

                        const Text('Location',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.black1Color,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: AppConstants.fontFamily)),
                        const SizedBox(height: 15.0),

                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: AppColors.borderColor),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: Colors.white,
                              value: postPropertyController.selectedCityItem,
                              hint: const Text('City Name',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.grey10Color,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontFamily: AppConstants.fontFamily)),
                              icon: SvgPicture.asset(ImageConstants.icDownArrow),
                              iconSize: 24,
                              style: const TextStyle(color: Colors.black, fontSize: 16),
                              onChanged: (String? newValue) {
                                setState(() {
                                  postPropertyController.selectedCityItem = newValue;
                                });
                              },
                              items: postPropertyController.cityItems.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),

                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: AppColors.borderColor),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: Colors.white,
                              value: postPropertyController.selectedLocalityItem,
                              hint: const Text('Locality Name',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.grey10Color,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontFamily: AppConstants.fontFamily)),
                              icon: SvgPicture.asset(ImageConstants.icDownArrow),
                              iconSize: 24,
                              style: const TextStyle(color: Colors.black, fontSize: 16),
                              onChanged: (String? newValue) {
                                setState(() {
                                  postPropertyController.selectedLocalityItem = newValue;
                                });
                              },
                              items: postPropertyController.localityItems.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),

                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: AppColors.borderColor),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: Colors.white,
                              value: postPropertyController.selectedProjectItem,
                              hint: const Text('Project Name',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.grey10Color,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontFamily: AppConstants.fontFamily)),
                              icon: SvgPicture.asset(ImageConstants.icDownArrow),
                              iconSize: 24,
                              style: const TextStyle(color: Colors.black, fontSize: 16),
                              onChanged: (String? newValue) {
                                setState(() {
                                  postPropertyController.selectedProjectItem = newValue;
                                });
                              },
                              items: postPropertyController.projectItems.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),

                        CustomBoxTextFormField(
                            controller: postPropertyController.addressController,
                            keyboardType: TextInputType.text,
                            hintText: "Address",
                            borderRadius: BorderRadius.circular(25),
                            validator: (value) {
                              return null;
                            }),
                        const SizedBox(height: 25.0),

                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => const PropertyFeaturesPage()));
                          },
                          child: Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            decoration: BoxDecoration(
                              color: AppColors.btnColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text('Next',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    fontFamily: AppConstants.fontFamily)),
                          ),
                        ),
                        const SizedBox(height: 5.0),

                      ],
                    ),
                  ))
                ],
              ),
            ),
          );
        });
  }
}
