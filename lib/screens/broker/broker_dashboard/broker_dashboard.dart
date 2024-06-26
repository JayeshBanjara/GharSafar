import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/global.dart';
import 'broker_dashboard_controller.dart';
import 'broker_home/broker_home.dart';
import 'broker_notification/broker_notification.dart';
import 'broker_profile/broker_profile.dart';

class BrokerDashboardPage extends StatefulWidget {
  const BrokerDashboardPage({super.key});

  @override
  State<BrokerDashboardPage> createState() => _BrokerDashboardPageState();
}

class _BrokerDashboardPageState extends State<BrokerDashboardPage> {
  final TextStyle unselectedLabelStyle = const TextStyle(
      color: AppColors.textColor, fontWeight: FontWeight.w400, fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: AppColors.btnColor, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, brokerDashboardController) {
    return Obx(() => SizedBox(
      height: 70,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: brokerDashboardController.changeTabIndex,
        currentIndex: brokerDashboardController.tabIndex.value,
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
    Get.delete<BrokerDashboardController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BrokerDashboardController brokerDashboardController =
    Get.put(BrokerDashboardController());
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (brokerDashboardController.tabIndex.value == 0) {
          Get.back();
        } else {
          brokerDashboardController.changeTabIndex(0);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar:
        buildBottomNavigationMenu(context, brokerDashboardController),
        body: Obx(() => IndexedStack(
          index: brokerDashboardController.tabIndex.value,
          children: const [
            BrokerHomePage(),
            BrokerNotificationPage(),
            BrokerProfilePage()
          ],
        )),
      ),
    );
  }
}
