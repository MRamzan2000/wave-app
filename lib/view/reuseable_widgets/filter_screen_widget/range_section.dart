// widgets/range_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/view/utils/app_colors.dart';
import 'package:weave_app/view/utils/app_styles.dart';
import 'package:weave_app/view/reuseable_widgets/get_horizontal_space.dart';
import 'package:weave_app/view/reuseable_widgets/get_verticle_space.dart';
import 'filter_section_wrapper.dart';

class RangeSection extends StatelessWidget {
  final String title;
  final String iconPath;
  final Rx<RangeValues> range;
  final Function(RangeValues) onChanged;
  final List<String> labels;

  const RangeSection({
    super.key,
    required this.title,
    required this.iconPath,
    required this.range,
    required this.onChanged,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return FilterSectionWrapper(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(height: 3.h, width: 3.h, child: SvgPicture.asset(iconPath)),
              horizontalSpace(2.w),
              Text(title, style: AppTextStyles.regularTextStyle.copyWith(
                  fontSize: 16.5.sp, fontWeight: FontWeight.w600, color: const Color(0xff6C6B73))),
            ],
          ),
          verticalSpace(1.5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: labels.map((l) => Text(l, style: AppTextStyles.smallTextStyle.copyWith(fontWeight: FontWeight.w600))).toList(),
          ),
          verticalSpace(.8.h),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              rangeThumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 1.h, elevation: 0, pressedElevation: 0),
            ),
            child: Obx(() => RangeSlider(
              values: range.value,
              min: 0,
              max: 100,
              activeColor: AppColors.primaryColor,
              inactiveColor: AppColors.white,
              padding: EdgeInsets.zero,
              onChanged: onChanged,
            )),
          ),
        ],
      ),
    );
  }
}