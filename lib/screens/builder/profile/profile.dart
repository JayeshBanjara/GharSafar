import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:ghar_safar/screens/builder/profile/edit_profile/edit_profile.dart';
import 'package:ghar_safar/screens/builder/profile/profile_controller.dart';
import 'package:ghar_safar/screens/builder/profile/sell_rent_property/sell_rent_property.dart';

import '../../../utils/global.dart';
import '../../../utils/gradient_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final profileController = Get.put(ProfileController());

  bool status = false;

  @override
  void dispose() {
    Get.delete<ProfileController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ProfileController(),
        builder: (cont) {
          profileController.context = context;
          return Container(
              color: Colors.white,
              padding: const EdgeInsets.all(AppConstants.screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 45),

                  const GradientText('Profile',
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
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                            decoration: BoxDecoration(
                                color: AppColors.lightBlue2,
                                border: Border.all(color: AppColors.btnColor),
                                borderRadius: BorderRadius.circular(25.0)),
                            child:  Column(
                              children: [
                                Row(
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
                                                  color: AppColors.btnColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 18,
                                                  fontFamily: AppConstants.fontFamily)),
                                          SizedBox(height: 5.0),
                                          Text('Member since:10 December 2021',
                                              style: TextStyle(
                                                  color: AppColors.blackColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  fontFamily: AppConstants.fontFamily)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15.0),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0)),
                                  child: Row(
                                    children: [
                                      Stack(
                                        alignment: AlignmentDirectional.center,
                                          children: [
                                            SvgPicture.asset(ImageConstants.icMooney),
                                  SvgPicture.asset(ImageConstants.icRupis)]),
                                      const SizedBox(width: 10.0),
                                      const Expanded(
                                        child: Text('Total Earnings',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: AppColors.blackColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                fontFamily: AppConstants.fontFamily)),
                                      ),
                                      const Text('₹17,540.00',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: AppColors.btnColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              fontFamily: AppConstants.fontFamily)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 40.0),

                          InkWell(
                              onTap:(){
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => const EditProfilePage()),);
                              } ,
                              child: profileItem(icon: ImageConstants.icPerson, label: 'Edit Profile')),
                          const SizedBox(height: 20),

                          InkWell(
                              onTap:(){
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => const SellRentPropertyPage()),);
                              } ,
                              child: profileItem(icon: ImageConstants.icOrder, label: 'Sell & Rent Property')),
                          const SizedBox(height: 20),

                          Row(
                        children: [
                          SvgPicture.asset(
                            ImageConstants.icNotification,
                          ),
                          const SizedBox(width: 15),
                          const Expanded(
                            child: Text('Notifications',
                                style: TextStyle(
                                    color: AppColors.black1Color,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    fontFamily: AppConstants.fontFamily)),
                          ),
                          FlutterSwitch(
                            width: 45.0,
                            height: 25.0,
                            toggleSize: 20.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 3,
                            showOnOff: false,
                            activeToggleColor: AppColors.btnColor,
                            activeSwitchBorder: Border.all(color: AppColors.btnColor),
                            activeColor: AppColors.lightBlue2,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ],
                      ),
                          const SizedBox(height: 20),

                          profileItem(icon: ImageConstants.icPrivacy, label: 'Privacy Policy'),
                          const SizedBox(height: 20),

                          profileItem(icon: ImageConstants.icTerms, label: 'Terms of Service'),
                          const SizedBox(height: 20),

                          InkWell(
                              onTap: (){
                                logOutDialogue();
                              },
                              child: profileItem(icon: ImageConstants.icLogout, label: 'Logout')),
                          const SizedBox(height: 20),



                        ],
                      ),
                    ),
                  )
                ],
              ));
        });
  }

  Widget profileItem(
      {required String icon, required String label}) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(label,
              style: const TextStyle(
                  color: AppColors.black1Color,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  fontFamily: AppConstants.fontFamily)),
        ),
        SvgPicture.asset(
          ImageConstants.icArrow,
        ),
      ],
    );
  }

  void logOutDialogue() async {
    await showDialog(
      context: profileController.context,
      /* barrierColor: AppColors.dialogBarrierColor,*/
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        titlePadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 15, vertical: 15),
        insetPadding: const EdgeInsets.all(20),
        backgroundColor: Colors.white,
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: SvgPicture.asset(
                    ImageConstants.icCross
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    ImageConstants.icLogOut1,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Logout',
                    style: TextStyle(
                        color: AppColors.black1Color,
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                        fontFamily: AppConstants.fontFamily),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                'Are you sure you want to Logout from the Application',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.grey8Color,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: AppConstants.fontFamily),
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.grey8Color,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              fontFamily: AppConstants.fontFamily)),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            color: AppColors.btnColor,
                            border: Border.all(color: AppColors.btnColor),
                            borderRadius: BorderRadius.circular(50.0)),
                        child: const Text('Logout',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                fontFamily: AppConstants.fontFamily)),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
