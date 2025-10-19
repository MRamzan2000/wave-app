import 'package:flutter/material.dart';
import 'package:weave_app/view/utils/app_styles.dart';

Widget customElevatedButton({
  required String title,
  required Color bgColor,
  required Color titleColor,
  required VoidCallback onTap,
  double? horizontalSpace,
  double? verticalSpace,
}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: bgColor),
      onPressed: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalSpace??0, vertical: verticalSpace??0),
        child: Text(
          title,
          style: AppTextStyles.buttonTextStyle.copyWith(color: titleColor),
        ),
      ));
}
