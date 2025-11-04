import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/view/reuseable_widgets/get_horizontal_space.dart';
import 'package:weave_app/view/utils/app_colors.dart';

class ChatItem extends StatelessWidget {
  final String image;
  final String userName;
  final String message;
  final bool isOnline;
  const ChatItem({
    super.key,
    required this.image,
    required this.userName,
    required this.message,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.8.h),
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.8.h),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10.px),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 24.px,
                backgroundImage: NetworkImage(image),
              ),
              if (isOnline)
                Positioned(
                  right: 0,
                  bottom: 2,
                  child: Container(
                    height: 11.px,
                    width: 11.px,
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
            ],
          ),
          horizontalSpace(2.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.sp)),
              SizedBox(height: 0.5.h),
              Text(message,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16.sp)),
            ],
          )
        ],
      ),
    );
  }
}
