import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import 'package:weave_app/controller/home_controller.dart';
import 'package:weave_app/model/post_model.dart';
import 'package:weave_app/view/reuseable_widgets/get_horizontal_space.dart';
import 'package:weave_app/view/utils/app_colors.dart';
import 'package:weave_app/view/utils/app_styles.dart';
import 'action_row.dart';

class PostCard extends StatelessWidget {
  final PostModel post;
  final int index;
  final HomeController controller = Get.find();

  PostCard({super.key, required this.post, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 2.3.h,
              backgroundImage: NetworkImage(post.userImage),
            ),
            title: Text(post.userName,
                style: AppTextStyles.regularTextStyle
                    .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600)),
            subtitle: Row(
              children: [
                Text(post.country1, style: AppTextStyles.smallTextStyle),
                horizontalSpace(1.w),
                SizedBox(
                  height: 2.h,
                  width: 2.h,
                  child: SvgPicture.asset('assets/icons/transferlanguage.svg',
                      fit: BoxFit.fitWidth),
                ),
                horizontalSpace(1.w),
                Text(post.country2, style: AppTextStyles.smallTextStyle),
              ],
            ),
          ),
        ),
        if (post.postImage != null)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Container(
              height: 30.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: AppColors.headingColor,
                borderRadius: BorderRadius.circular(10.px),
                image: DecorationImage(
                    image: NetworkImage(post.postImage!), fit: BoxFit.cover),
              ),
            ),
          ),
        if (post.postImage == null) ...[
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(post.description,
                  style:
                      AppTextStyles.smallTextStyle.copyWith(fontSize: 17.sp))),
        ],
        ActionRow(
          likes: post.likes,
          comments: post.comments,
          onComment: () {},
          onShare: () {},
        ),
      ],
    );
  }
}
