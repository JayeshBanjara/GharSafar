import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ghar_safar/screens/dashboard/dashboard_controller.dart';
import 'package:ghar_safar/screens/dashboard/pages/buy/buy_page.dart';
import 'package:ghar_safar/screens/dashboard/pages/consultant/consultant_page.dart';
import 'package:ghar_safar/screens/dashboard/pages/home/home.dart';
import 'package:ghar_safar/screens/dashboard/pages/reels/reels_page.dart';
import 'package:ghar_safar/screens/dashboard/pages/rent/rent_page.dart';
import 'package:ghar_safar/utils/global.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextStyle unselectedLabelStyle = const TextStyle(
      color: AppColors.textColor, fontWeight: FontWeight.w400, fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: AppColors.btnColor, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, dashboardController) {
    return Obx(() => SizedBox(
          height: 70,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: dashboardController.changeTabIndex,
            currentIndex: dashboardController.tabIndex.value,
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
                  selectedIcon: ImageConstants.selectedBuy,
                  unSelectedIcon: ImageConstants.unselectedBuy,
                  label: 'Buy'),
              bottomNavItem(
                  selectedIcon: ImageConstants.selectedRent,
                  unSelectedIcon: ImageConstants.unselectedRent,
                  label: 'Rent'),
              bottomNavItem(
                  selectedIcon: ImageConstants.selectedVaastu,
                  unSelectedIcon: ImageConstants.unselectedVaastu,
                  label: 'Vaastu'),
              bottomNavItem(
                  selectedIcon: ImageConstants.selectedConsultant,
                  unSelectedIcon: ImageConstants.unselectedConsultant,
                  label: 'Consultant')
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
            child: SvgPicture.asset(unSelectedIcon)),
        activeIcon: Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset(selectedIcon)),
        label: label);
  }

  @override
  void dispose() {
    Get.delete<DashboardController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController =
        Get.put(DashboardController());
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (dashboardController.tabIndex.value == 0) {
          Get.back();
        } else {
          dashboardController.changeTabIndex(0);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
              bottomNavigationBar:
        buildBottomNavigationMenu(context, dashboardController),
              body: Obx(() => IndexedStack(
          index: dashboardController.tabIndex.value,
          children: const [
            HomePage(),
            BuyPage(),
            RentPage(),
            ReelsPage(),
            ConsultantPage(),
          ],
        )),
            ),
    );
  }
}
