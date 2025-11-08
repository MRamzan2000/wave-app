import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/view/reuseable_widgets/get_horizontal_space.dart';
import 'package:weave_app/view/reuseable_widgets/get_verticle_space.dart';
import 'package:weave_app/view/screens/comments_screen.dart';
import 'package:weave_app/view/screens/likes_screen.dart';
import 'package:weave_app/view/utils/app_styles.dart';
class ActionRow extends StatelessWidget {
  final int likes;
  final int comments;
  final VoidCallback? onLike;
  final VoidCallback? onLongPress;
  final VoidCallback? onComment;
  final VoidCallback? onShare;

  const ActionRow({
    super.key,
    required this.likes,
    required this.comments,
    this.onLike,
    this.onLongPress,
    this.onComment,
    this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            GestureDetector(
              onTap:(){
                Get.to(()=>LikesScreen());
              },
              child: Row(crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("👍", style: AppTextStyles.regularTextStyle.copyWith(fontSize: 16.sp)),
                  Text(likes.toString(), style: AppTextStyles.smallTextStyle.copyWith(fontSize: 14.5.sp)),
                ],
              ),
            ),
            GestureDetector(
              onTap:(){
                Get.to(()=>CommentsScreen());
              },
              child: Row(crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("16", style: AppTextStyles.regularTextStyle.copyWith(fontSize: 14.5.sp)),
                  horizontalSpace(1.5.w),
                  Text("comments", style: AppTextStyles.smallTextStyle.copyWith(fontSize: 15.sp)),
                ],
              ),
            ),


          ],),
          verticalSpace(.5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 3.h,
                        width: 3.h,
                        child: GestureDetector(
                          onTap: onLike,
                          onLongPress:onLongPress,
                          child: SvgPicture.asset('assets/icons/like.svg'),
                        ),
                      ),
                      horizontalSpace(1.5.w),
                      Text("Like", style: AppTextStyles.smallTextStyle),
                    ],
                  ),
                  horizontalSpace(5.w),
                  Row(
                    children: [
                      SizedBox(
                        height: 3.h,
                        width: 3.h,
                        child: GestureDetector(
                          onTap: onComment,
                          child: SvgPicture.asset('assets/icons/comment.svg'),
                        ),
                      ),
                      horizontalSpace(1.w),
                      Text(comments.toString(), style: AppTextStyles.smallTextStyle),
                    ],
                  ),
                ],
              ),

              SizedBox(
                height: 3.h,
                width: 3.h,
                child: SvgPicture.asset('assets/icons/share.svg'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
