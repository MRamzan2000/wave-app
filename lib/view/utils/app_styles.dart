import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/view/utils/app_colors.dart';

class AppTextStyles{
  static TextStyle specialLimelightHeading=TextStyle(
    fontFamily: "Limelight",
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor
  );
  static TextStyle headingTextStyle=TextStyle(
      fontFamily: "poppins",
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.headingColor
  );
  static TextStyle smallTextStyle=TextStyle(
      fontFamily: "poppins",
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.subHeadingColor
  );
  static TextStyle regularTextStyle=TextStyle(
      fontFamily: "poppins",
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.textDark
  );
  static TextStyle hintTextStyle=TextStyle(
      fontFamily: "poppins",
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.grey
  );
  static TextStyle buttonTextStyle=TextStyle(
      fontFamily: "poppins",
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.textLight
  );
}