import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/view/utils/app_colors.dart';
import 'package:weave_app/view/utils/app_styles.dart';

class MeetItem extends StatelessWidget {
  final String image;
  final String name;
  final String country1;
  final String country2;
  final String greeting;

  const MeetItem({
    super.key,
    required this.image,
    required this.name,
    required this.country1,
    required this.country2,
    required this.greeting,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(10.px),
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        height: 7.h,
        decoration: BoxDecoration(
          color: AppColors.grey.withOpacity(0.6),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.px),
            bottomRight: Radius.circular(10.px),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name,
                    style: AppTextStyles.regularTextStyle.copyWith(
                        color: AppColors.white
                    )),
                Row(
                  children: [
                    Text(country1,
                        style: AppTextStyles.smallTextStyle.copyWith(
                            color: AppColors.white, fontSize: 15.sp)),
                    SizedBox(width: 1.w),
                    SizedBox(
                      height: 2.h,
                      width: 2.h,
                      child: SvgPicture.asset("assets/icons/transferlanguage.svg"),
                    ),
                    SizedBox(width: 1.w),
                    Text(country2,
                        style: AppTextStyles.smallTextStyle.copyWith(
                            color: AppColors.white)),
                  ],
                )
              ],
            ),

            Row(
              children: [
                SizedBox(
                    height: 2.4.h,
                    width: 2.4.h,
                    child: Image.asset("assets/images/greeting.png")),
                SizedBox(width: 1.w),
                Text(greeting,
                    style: AppTextStyles.smallTextStyle.copyWith(
                        color: AppColors.white)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
