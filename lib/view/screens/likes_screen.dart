import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/view/reuseable_widgets/get_horizontal_space.dart';
import 'package:weave_app/view/reuseable_widgets/get_verticle_space.dart';
import 'package:weave_app/view/reuseable_widgets/header_widget.dart';
import 'package:weave_app/view/utils/app_colors.dart';
import 'package:weave_app/view/utils/app_styles.dart';

class LikesScreen extends StatelessWidget {
  const LikesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            header(title: "Likes"),
            verticalSpace(2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 2.6.h,
                  width: 2.6.h,
                  child: SvgPicture.asset('assets/icons/like.svg'),
                ),
                horizontalSpace(1.5.w),
                Text("200",
                    style: AppTextStyles.regularTextStyle
                        .copyWith(fontSize: 16.sp)),
              ],
            ),
            verticalSpace(3.h),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 16,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 2.5.h,
                              backgroundColor: AppColors.primaryColor,
                              backgroundImage: NetworkImage(
                                  "https://images.unsplash.com/photo-1494790108377-be9c29b29330"),
                            ),
                            horizontalSpace(3.w),
                            Text(
                              "Mia Smith",
                              style: AppTextStyles.regularTextStyle
                                  .copyWith(fontSize: 16.sp),
                            )
                          ],
                        ),
                        verticalSpace(.8.h),
                        Divider(
                          color: AppColors.grey.withOpacity(0.5),
                        ),
                        verticalSpace(1.h),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
