import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/view/reuseable_widgets/custom_elevated_button.dart';
import 'package:weave_app/view/reuseable_widgets/get_verticle_space.dart';
import 'package:weave_app/view/screens/select_language_screen.dart';
import 'package:weave_app/view/utils/app_colors.dart';
import 'package:weave_app/view/utils/app_styles.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width - 5.w,
              child: Image(
                image: AssetImage("assets/images/welcome.png"),
              ),
            ),
            verticalSpace(4.h),
            Text(
              "Just few quick questions before we\n start your first lesson!",
              style: AppTextStyles.smallTextStyle,
              textAlign: TextAlign.center,
            ),
            verticalSpace(4.h),
            Row(
              children: [
                Expanded(
                    child: customElevatedButton(
                        title: "Continue",
                        bgColor: AppColors.primaryColor,
                        titleColor: AppColors.white,
                        onTap: () {
                          Get.to(()=>SelectLanguageScreen());
                        }))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
