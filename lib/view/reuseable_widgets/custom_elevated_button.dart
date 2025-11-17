import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/view/utils/app_styles.dart';

Widget customElevatedButton({
  required String title,
  required Color bgColor,
  required Color titleColor,
  required VoidCallback onTap,
  double? horizontalSpace,
  double? verticalSpace,

  // NEW OPTIONAL PARAMETERS
  double? borderRadius,
  Color? borderColor,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 20.px),
        side: borderColor != null
            ? BorderSide(color: borderColor)
            : BorderSide.none,
      ),
    ),
    onPressed: onTap,
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalSpace ?? 0,
        vertical: verticalSpace ?? 0,
      ),
      child: Text(
        title,
        style: AppTextStyles.buttonTextStyle.copyWith(color: titleColor),
      ),
    ),
  );
}
