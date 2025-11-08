import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/view/reuseable_widgets/custom_textfield.dart';
import 'package:weave_app/view/reuseable_widgets/get_horizontal_space.dart';
import 'package:weave_app/view/reuseable_widgets/get_verticle_space.dart';
import 'package:weave_app/view/reuseable_widgets/header_widget.dart';
import 'package:weave_app/view/utils/app_colors.dart';
import 'package:weave_app/view/utils/app_styles.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: header(title: "Comments"),
          ),
          Expanded(
            child: Stack(
              children: [
                ListView.separated(
                  padding: EdgeInsets.only(
                    left: 6.w,
                    right: 6.w,
                    top: 1.h,
                    bottom: 8.h,
                  ),
                  itemCount: 10,
                  separatorBuilder: (_, __) => Divider(
                    color: AppColors.grey.withOpacity(0.4),
                    height: 30,
                  ),
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 2.8.h,
                          backgroundImage: const NetworkImage(
                              "https://images.unsplash.com/photo-1494790108377-be9c29b29330"),
                        ),
                        horizontalSpace(3.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("karenne", style: AppTextStyles.regularTextStyle),
                              verticalSpace(.3.h),
                              Text("Lorem ipsum dolor", style: AppTextStyles.smallTextStyle),
                              verticalSpace(.8.h),
                              Text(
                                "Reply",
                                style: AppTextStyles.smallTextStyle.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text("15m", style: AppTextStyles.smallTextStyle),
                      ],
                    );
                  },
                ),
                Positioned(
                  left: 5.w,
                  right: 5.w,
                  bottom: 3.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextField(hintText: "Add a comment..."),
                      ),
                      horizontalSpace(3.w),
                      GestureDetector(
                        onTap: () {
                          // Send comment logic
                        },
                        child: SvgPicture.asset("assets/icons/sending.svg"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}