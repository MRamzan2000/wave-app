import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/controller/auth_controller.dart';
import 'package:weave_app/view/reuseable_widgets/custom_elevated_button.dart';
import 'package:weave_app/view/reuseable_widgets/custom_textfield.dart';
import 'package:weave_app/view/reuseable_widgets/get_horizontal_space.dart';
import 'package:weave_app/view/reuseable_widgets/get_verticle_space.dart';
import 'package:weave_app/view/screens/forgot_password.dart';
import 'package:weave_app/view/screens/signup_screen.dart';
import 'package:weave_app/view/screens/welcom_screen.dart';
import 'package:weave_app/view/utils/app_colors.dart';
import 'package:weave_app/view/utils/app_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
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
              "Welcome back",
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
                    "Email",
                    style: AppTextStyles.smallTextStyle,
                  ),
                  verticalSpace(.4.h),
                  CustomTextField(
                    controller: emailController,
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
                  verticalSpace(1.h),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>ForgotPasswordScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot Password",
                          style: AppTextStyles.regularTextStyle.copyWith(
                              color: AppColors.primaryColor, fontSize: 15.sp),
                        )
                      ],
                    ),
                  ),
                  verticalSpace(3.h),
                  Row(
                    children: [
                      Expanded(
                          child: customElevatedButton(
                              title: "Log In",
                              bgColor: AppColors.primaryColor,
                              titleColor: AppColors.white,
                              onTap: () {
                                Get.off(()=>WelcomeScreen());
                              }))
                    ],
                  ),
                  verticalSpace(3.h),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SignUpScreen());
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Don’t have an account?",
                            style: AppTextStyles.smallTextStyle),
                        TextSpan(
                            text: " Sign In",
                            style: AppTextStyles.smallTextStyle
                                .copyWith(color: AppColors.primaryColor)),
                      ])),
                    ),
                  ),
                  verticalSpace(3.h),
                  Align(
                    child: Text("Or", style: AppTextStyles.smallTextStyle),
                  ),
                  verticalSpace(3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20.w,
                        height: 8.h,
                        child: Image.asset(
                          "assets/images/google.png",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      horizontalSpace(10.w),
                      SizedBox(
                        width: 20.w,
                        height: 8.h,
                        child: Image.asset(
                          "assets/images/apple.png",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
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
