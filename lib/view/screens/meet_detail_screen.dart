import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/view/reuseable_widgets/get_verticle_space.dart';
import 'package:weave_app/view/reuseable_widgets/header_widget.dart';
import 'package:weave_app/view/utils/app_colors.dart';
import 'package:weave_app/view/utils/app_styles.dart';

class MeetDetailScreen extends StatelessWidget {
  final String name;
  final String greeting;
  final String profileImage;

  const MeetDetailScreen({
    super.key,
    required this.name,
    required this.greeting,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(title: name),
            verticalSpace(2.h),

            Container(
              height: 55.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10.px),
                image: DecorationImage(
                  image: NetworkImage(profileImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            verticalSpace(1.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name, style: AppTextStyles.regularTextStyle.copyWith(fontSize: 16.sp)),
                Row(
                  children: [
                    Image.asset("assets/images/greeting.png", height: 2.4.h, width: 2.4.h),
                    SizedBox(width: 1.w),
                    Text("Say Hi", style: AppTextStyles.regularTextStyle.copyWith(fontSize: 15.sp)),
                  ],
                )
              ],
            ),

            verticalSpace(1.5.h),

            Text("Country",
                style: AppTextStyles.headingTextStyle.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600)),
            Text("Ireland", style: AppTextStyles.regularTextStyle.copyWith(fontSize: 15.sp)),

            verticalSpace(1.5.h),

            Text("Gender",
                style: AppTextStyles.headingTextStyle.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600)),
            Text("Male", style: AppTextStyles.regularTextStyle.copyWith(fontSize: 15.sp)),

            verticalSpace(1.5.h),

            Text("RelationShip",
                style: AppTextStyles.headingTextStyle.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600)),
            Text("Single", style: AppTextStyles.regularTextStyle.copyWith(fontSize: 15.sp)),

            verticalSpace(2.h),

            Text("About",
                style: AppTextStyles.headingTextStyle.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600)),
            Text(
              "My name is $name and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading",
              style: AppTextStyles.regularTextStyle.copyWith(fontSize: 15.sp),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
