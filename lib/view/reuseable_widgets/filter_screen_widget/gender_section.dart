import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/view/utils/app_colors.dart';
import 'package:weave_app/view/utils/app_styles.dart';
import 'package:weave_app/view/reuseable_widgets/get_horizontal_space.dart';
import 'package:weave_app/view/reuseable_widgets/get_verticle_space.dart';
import 'filter_section_wrapper.dart';

class GenderSection extends StatelessWidget {
  final RxString selectedGender;
  const GenderSection({super.key, required this.selectedGender});

  @override
  Widget build(BuildContext context) {
    return FilterSectionWrapper(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(height: 3.h, width: 3.h, child: SvgPicture.asset("assets/icons/gender.svg")),
              horizontalSpace(2.w),
              Text("Gender", style: AppTextStyles.regularTextStyle.copyWith(
                  fontSize: 16.5.sp, fontWeight: FontWeight.w600, color: const Color(0xff6C6B73))),
            ],
          ),
          verticalSpace(1.5.h),
          Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _genderCard("Men", "men.svg", Color(0xff878787)),
              horizontalSpace(6.w),
              _genderCard("Women", "women.svg", Color(0xffE21743)),
            ],
          )),
        ],
      ),
    );

  }
  Widget _genderCard(String title, String icon, Color textColor) {
    final bool isSelected = selectedGender.value == title;
    return Expanded(
      child: GestureDetector(
        onTap: () => selectedGender.value = title,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.px),
            border: Border.all(color: isSelected ? AppColors.primaryColor : Colors.transparent),
          ),
          child: Column(
            children: [
              if (isSelected)
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Transform.scale(scale: 1.8, child: SvgPicture.asset("assets/icons/tick.svg")),
                ]),
              SvgPicture.asset("assets/icons/$icon"),
              verticalSpace(.6.h),
              Text(title, style: AppTextStyles.smallTextStyle.copyWith(color: textColor, fontSize: 13.sp)),
            ],
          ),
        ),
      ),
    );
  }

}