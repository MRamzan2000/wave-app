import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/view/reuseable_widgets/get_horizontal_space.dart';
import 'package:weave_app/view/utils/app_colors.dart';
import 'package:weave_app/view/utils/app_styles.dart';

Widget interestChip({
  required String title,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: .5.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.px),
          border: Border.all(color: AppColors.primaryColor)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppTextStyles.regularTextStyle
                .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w500),
          ),
          horizontalSpace(1.w),
          Container(
            height: 1.5.h,
            width: 1.5.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primaryColor
              )
            ),
            child: isSelected
                ? CircleAvatar(radius: 4, backgroundColor: AppColors.primaryColor)
                :null,
          ),
        ],
      ),
    ),
  );
}
