import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/controller/bottom_nav_controller.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final BottomNavController bottomNavController =
      Get.put(BottomNavController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: bottomNavController.screens[bottomNavController.selectedIndex.value],
        bottomNavigationBar: Container(
          height: 8.h,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: bottomNavController.selectedIndex.value,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            onTap: (index) {
              bottomNavController.selectedIndex.value = index;
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: List.generate(bottomNavController.iconsUnSelect.length,
                (index) {
              return BottomNavigationBarItem(
                icon: Transform.scale(
                  scale: index == 1 || index == 2 || index == 3 ? 0.95 : 0.85,
                  child: SvgPicture.asset(
                    bottomNavController.iconsUnSelect[index],
                    height: 3.2.h,
                    width: 3.2.h,
                  ),
                ),
                activeIcon: Transform.scale(
                  scale: 2.5,
                  child: SvgPicture.asset(
                    bottomNavController.iconSelect[index],
                    height: 3.2.h,
                    width: 3.2.h,
                  ),
                ),
                label: '',
              );
            }),
          ),
        ),
      ),
    );
  }
}
