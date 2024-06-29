import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ghar_safar/screens/builder/home/home.dart';
import 'package:ghar_safar/screens/builder/notification/notification.dart';
import 'package:ghar_safar/screens/builder/profile/profile.dart';

import '../../../../utils/global.dart';
import 'builder_dashboard_controller.dart';

class BuilderDashboardPage extends StatefulWidget {
  const BuilderDashboardPage({super.key});

  @override
  State<BuilderDashboardPage> createState() => _BuilderDashboardPageState();
}

class _BuilderDashboardPageState extends State<BuilderDashboardPage> {

  final TextStyle unselectedLabelStyle = const TextStyle(
      color: AppColors.textColor, fontWeight: FontWeight.w400, fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: AppColors.btnColor, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, builderDashboardController) {
    return Obx(() => SizedBox(
      height: 70,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: builderDashboardController.changeTabIndex,
        currentIndex: builderDashboardController.tabIndex.value,
        backgroundColor: Colors.white,
        unselectedItemColor: AppColors.textColor,
        selectedItemColor: AppColors.btnColor,
        unselectedLabelStyle: unselectedLabelStyle,
        selectedLabelStyle: selectedLabelStyle,
        items: [
          bottomNavItem(
              selectedIcon: ImageConstants.selectedHome,
              unSelectedIcon: ImageConstants.unselectedHome,
              label: 'Home'),
          bottomNavItem(
              selectedIcon: ImageConstants.icSelectedNotification,
              unSelectedIcon: ImageConstants.icUnselectedNotification,
              label: 'Notification'),
          bottomNavItem(
              selectedIcon: ImageConstants.icSelectedProfile,
              unSelectedIcon: ImageConstants.icUnSelectedProfile,
              label: 'Profile'),
        ],
      ),
    ));
  }

  BottomNavigationBarItem bottomNavItem(
      {required String selectedIcon,
        required String unSelectedIcon,
        required String label}) {
    return BottomNavigationBarItem(
        icon: Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset(unSelectedIcon,height: 26,width: 26,)),
        activeIcon: Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset(selectedIcon,height: 26,width: 26,)),
        label: label);
  }

  @override
  void dispose() {
    Get.delete<BuilderDashboardController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BuilderDashboardController builderDashboardController =
    Get.put(BuilderDashboardController());
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (builderDashboardController.tabIndex.value == 0) {
          Get.back();
        } else {
          builderDashboardController.changeTabIndex(0);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar:
        buildBottomNavigationMenu(context, builderDashboardController),
        body: Obx(() => IndexedStack(
          index: builderDashboardController.tabIndex.value,
          children: const [
            HomePage(),
            NotificationPage(),
            ProfilePage()
          ],
        )),
      ),
    );
  }
}
