import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/view/utils/app_colors.dart';
import 'package:weave_app/view/utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? prefixIconPath; // For SVG icons
  final bool obscureText;
  final bool showSuffixIcon;
  final VoidCallback? onSuffixTap;
  final TextInputType keyboardType;
  final Color? fillColor;

  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIconPath,
    this.obscureText = false,
    this.showSuffixIcon = false,
    this.onSuffixTap,
    this.keyboardType = TextInputType.text,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      cursorColor: AppColors.primaryColor,
      style: AppTextStyles.hintTextStyle,
      cursorHeight: 2.4.h,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.px),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.px),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        isCollapsed: true,
        contentPadding: EdgeInsets.only(left: 3.w,right:  3.w, top: 1.4.h,bottom: 1.2.h),
        fillColor: fillColor ?? AppColors.textFiledBgColor,
        filled: true,
        hintStyle: AppTextStyles.hintTextStyle,
        // Prefix icon (SVG)
        prefixIcon: prefixIconPath != null
            ? Padding(
          padding: EdgeInsets.only(left: 5.w, right: 2.w),
          child: SvgPicture.asset(prefixIconPath!),
        )
            : null,
        prefixIconConstraints:
        BoxConstraints(minHeight: 4.h, minWidth: 12.w),

        // Optional suffix icon (eye / visibility toggle)
        suffixIcon: showSuffixIcon
            ? Padding(
          padding: EdgeInsets.only(right: 5.w),
          child: GestureDetector(
            onTap: onSuffixTap,
            child: Icon(
              Icons.remove_red_eye_rounded,
              color: AppColors.grey,
            ),
          ),
        )
            : null,
        suffixIconConstraints:
        BoxConstraints(minHeight: 4.h, minWidth: 12.w),
      ),
    );
  }
}
