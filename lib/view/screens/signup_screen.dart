import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/view/reuseable_widgets/custom_elevated_button.dart';
import 'package:weave_app/view/reuseable_widgets/custom_textfield.dart';
import 'package:weave_app/view/reuseable_widgets/get_verticle_space.dart';
import 'package:weave_app/view/utils/app_colors.dart';
import 'package:weave_app/view/utils/app_styles.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _LoginSignUpScreen();
}
class _LoginSignUpScreen extends State<SignUpScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 28.h,
              width: MediaQuery.sizeOf(context).width,
              child: Image(
                image: AssetImage("assets/images/auth_image.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
            verticalSpace(1.5.h),
            Text(
              "Get started",
              style: AppTextStyles.headingTextStyle,
            ),
            verticalSpace(.7.h),
            Text(
              "Please enter the required details",
              style: AppTextStyles.smallTextStyle,
            ),
            verticalSpace(3.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              width: MediaQuery.sizeOf(context).width,
              child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: AppTextStyles.smallTextStyle,
                      ),
                      verticalSpace(.4.h),
                      CustomTextField(
                        controller:nameController,
                        hintText: "Lita han",
                        prefixIconPath: "assets/icons/email.svg",
                      ),
                      verticalSpace(2.h),
                      Text(
                        "Email",
                        style: AppTextStyles.smallTextStyle,
                      ),
                      verticalSpace(.4.h),
                      CustomTextField(
                        controller:emailController,
                        hintText: "Enter your email",
                        prefixIconPath: "assets/icons/email.svg",
                      ),
                      verticalSpace(2.h),
                      Text(
                        "Password",
                        style: AppTextStyles.smallTextStyle,
                      ),
                      verticalSpace(.4.h),
                      CustomTextField(
                        controller:passwordController,
                        hintText: "***********",
                        prefixIconPath: "assets/icons/password.svg",
                        showSuffixIcon: true,
                      ),
                      verticalSpace(2.h),
                      Text(
                        "Confirm Password",
                        style: AppTextStyles.smallTextStyle,
                      ),
                      verticalSpace(.4.h),
                      CustomTextField(
                        controller:confirmPasswordController,
                        hintText: "***********",
                        prefixIconPath: "assets/icons/password.svg",
                        showSuffixIcon: true,
                      ),
                      verticalSpace(3.h),
                      Row(
                        children: [
                          Expanded(
                              child: customElevatedButton(
                                  title: "Sign Up",
                                  bgColor: AppColors.primaryColor,
                                  titleColor: AppColors.white,
                                  onTap: () {}))
                        ],
                      ),
                      verticalSpace(2.h),
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Already have an account?",
                                  style: AppTextStyles.smallTextStyle),
                              TextSpan(
                                  text: " Log In",
                                  style: AppTextStyles.smallTextStyle
                                      .copyWith(color: AppColors.primaryColor)),
                            ])),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
