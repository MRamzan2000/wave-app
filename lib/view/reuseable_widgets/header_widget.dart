import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/view/utils/app_colors.dart';
import 'package:weave_app/view/utils/app_styles.dart';
import 'get_verticle_space.dart';

Widget header({
  required String title,
}){
  return Column(children: [
    verticalSpace(5.h),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_new_rounded,color: AppColors.black,
            size: 2.2.h,),
        ),
        Spacer(),

        Text(title,style: AppTextStyles.headingTextStyle.copyWith(fontWeight: FontWeight.w600,fontSize: 17.sp),),
        Spacer(),

      ],
    )
  ],);
}

