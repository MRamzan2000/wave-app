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
  static TextStyle regularTextStyle=TextStyle(
      fontFamily: "poppins",
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.textDark
  );
  static TextStyle buttonTextStyle=TextStyle(
      fontFamily: "poppins",
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.textLight
  );
}