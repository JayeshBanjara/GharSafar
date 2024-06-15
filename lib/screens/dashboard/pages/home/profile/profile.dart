import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ghar_safar/screens/dashboard/pages/home/profile/profile_controller.dart';

import '../../../../../utils/global.dart';
import '../notification/notification.dart';
import 'edit_profile/edit_profile.dart';
import 'favorite/favorite.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final profileController = Get.put(ProfileController());

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
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              leading: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios_new)),
              title: const Text('Profile',
                  style: TextStyle(
                      color: AppColors.black2Color,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontFamily: AppConstants.fontFamily)),
            ),
            body: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              color: Colors.white,
              padding: const EdgeInsets.all(AppConstants.screenPadding),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: AppColors.btnColor,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: const Row(
                        children: [
                          CircleAvatar(
                              radius: 25.0,
                              backgroundImage:
                              AssetImage(ImageConstants.tempPersonImg)),
                          SizedBox(width: 15),
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Kishan Thakkar',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        fontFamily: AppConstants.fontFamily),
                                  ),
                                  Text(
                                    '+91 7694  356 362',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        fontFamily: AppConstants.fontFamily),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),


                    const Text(
                      'Account',
                      style: TextStyle(
                          color: AppColors.black3Color,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          fontFamily: AppConstants.fontFamily),
                    ),
                    const SizedBox(height: 20),

                    InkWell(
                        onTap:(){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const EditProfilePage()),);
                        } ,
                        child: profileItem(icon: ImageConstants.icPerson, label: 'Edit Profile')),
                    const SizedBox(height: 20),

                    profileItem(icon: ImageConstants.icOrder, label: 'Order'),
                    const SizedBox(height: 20),

                    InkWell(
                        onTap:(){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const NotificationPage()),);
                        } ,
                        child: profileItem(icon: ImageConstants.icNotification, label: 'Notifications')),
                    const SizedBox(height: 20),

                    InkWell(
                        onTap:(){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const FavoritePage()),);
                        } ,
                        child: profileItem(icon: ImageConstants.icHeart, label: 'Favorite')),
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
                )
              ),
            ),
          );
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
