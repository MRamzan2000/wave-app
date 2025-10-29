import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/view/reuseable_widgets/custom_elevated_button.dart';
import 'package:weave_app/view/reuseable_widgets/get_verticle_space.dart';
import 'package:weave_app/view/utils/app_colors.dart';
import 'package:weave_app/view/utils/app_styles.dart';

import 'bottom_nav_bar.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(flex: 2, child: Column()),
            SizedBox(
              width: MediaQuery.sizeOf(context).width - 5.w,
              child: Image(
                image: AssetImage("assets/images/complete_profile.png"),
              ),
            ),
            verticalSpace(4.h),
            Text(
              "Let’s prepare you for conversation",
              style: AppTextStyles.regularTextStyle.copyWith(fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
              child: Row(
                children: [
                  Expanded(
                      child: customElevatedButton(
                          title: "Continue",
                          bgColor: AppColors.primaryColor,
                          titleColor: AppColors.white,
                          onTap: () {
                            Get.to(() => BottomNavBar());
                          }))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
