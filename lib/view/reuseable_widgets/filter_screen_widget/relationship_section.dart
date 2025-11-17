// widgets/relationship_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/view/utils/app_colors.dart';
import 'package:weave_app/view/utils/app_styles.dart';
import 'package:weave_app/view/reuseable_widgets/get_horizontal_space.dart';
import 'package:weave_app/view/reuseable_widgets/get_verticle_space.dart';
import 'filter_section_wrapper.dart';

class RelationshipSection extends StatelessWidget {
  final RxString selectedStatus;

  const RelationshipSection({super.key, required this.selectedStatus});

  final List<String> items = const [
    "Single",
    "Separated",
    "Divorced",
    "Widowed  "
  ];

  @override
  Widget build(BuildContext context) {
    return FilterSectionWrapper(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                  height: 3.h,
                  width: 3.h,
                  child: SvgPicture.asset("assets/icons/relationship.svg")),
              horizontalSpace(2.w),
              Text(
                "Relationship Status",
                style: AppTextStyles.regularTextStyle.copyWith(
                  fontSize: 16.5.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff6C6B73),
                ),
              ),
            ],
          ),
          verticalSpace(1.5.h),
          Obx(() => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: items
                        .sublist(0, 2)
                        .map((status) => _item(status))
                        .toList(),
                  ),
                  verticalSpace(1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: items
                        .sublist(2, 4)
                        .map((status) => _item(status))
                        .toList(),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _item(String text) {
    final bool isSelected = selectedStatus.value == text;

    return GestureDetector(
      onTap: () => selectedStatus.value = text,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(3),
            height: 2.h,
            width: 2.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryColor),
            ),
            child: isSelected
                ? CircleAvatar(backgroundColor: AppColors.primaryColor)
                : null,
          ),
          horizontalSpace(3.w),
          Text(
            text,
            style: AppTextStyles.regularTextStyle.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
