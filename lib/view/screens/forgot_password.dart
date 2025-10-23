import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/view/reuseable_widgets/custom_elevated_button.dart';
import 'package:weave_app/view/reuseable_widgets/custom_textfield.dart';
import 'package:weave_app/view/reuseable_widgets/get_verticle_space.dart';
import 'package:weave_app/view/utils/app_colors.dart';
import 'package:weave_app/view/utils/app_styles.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController=TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(2.h),
            SizedBox(
              height: 28.h,
              width: MediaQuery.sizeOf(context).width-10.w,
              child: Image(
                image: AssetImage("assets/images/forget_password.png"),
              ),
            ),
            verticalSpace(3.h),
            Text(
              "Forgot Password",
              style: AppTextStyles.headingTextStyle,
            ),
            verticalSpace(.7.h),
            Text(
              "Please enter your registered email Address",
              style: AppTextStyles.smallTextStyle,
            ),
            verticalSpace(3.h),
            Align(alignment: Alignment.centerLeft,
              child: Text(
                "Email",
                style: AppTextStyles.smallTextStyle,
              ),
            ),
            verticalSpace(.4.h),
            CustomTextField(
              controller:emailController,
              hintText: "Enter your email",
              prefixIconPath: "assets/icons/email.svg",
            ),
            verticalSpace(3.h),
            Row(
              children: [
                Expanded(
                    child: customElevatedButton(
                        title: "Done",
                        bgColor: AppColors.primaryColor,
                        titleColor: AppColors.white,
                        onTap: () {
                          Get.back();
                        }))
              ],
            ),

          ],
        ),
      ),
    );
  }
}
