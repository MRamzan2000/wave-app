import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/view/reuseable_widgets/get_horizontal_space.dart';
import 'package:weave_app/view/utils/app_styles.dart';
class ActionRow extends StatelessWidget {
  final int likes;
  final int comments;
  final VoidCallback? onLike;
  final VoidCallback? onComment;
  final VoidCallback? onShare;

  const ActionRow({
    super.key,
    required this.likes,
    required this.comments,
    this.onLike,
    this.onComment,
    this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
      child: Row(
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
                      child: SvgPicture.asset('assets/icons/like.svg'),
                    ),
                  ),
                  horizontalSpace(1.w),
                  Text(likes.toString(), style: AppTextStyles.smallTextStyle),
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
    );
  }
}
