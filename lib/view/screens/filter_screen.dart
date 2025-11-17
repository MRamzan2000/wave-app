import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/controller/filter_controller.dart';
import 'package:weave_app/view/reuseable_widgets/custom_elevated_button.dart';
import 'package:weave_app/view/reuseable_widgets/custom_textfield.dart';
import 'package:weave_app/view/reuseable_widgets/get_horizontal_space.dart';
import 'package:weave_app/view/reuseable_widgets/get_verticle_space.dart';
import 'package:weave_app/view/reuseable_widgets/header_widget.dart';
import 'package:weave_app/view/utils/app_colors.dart';
import 'package:weave_app/view/utils/app_styles.dart';
import 'package:weave_app/view/reuseable_widgets/filter_screen_widget/range_section.dart';
import 'package:weave_app/view/reuseable_widgets/filter_screen_widget/gender_section.dart';
import 'package:weave_app/view/reuseable_widgets/filter_screen_widget/relationship_section.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});
  final controller = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header + Clear All
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: header(title: "Filters")),
                GestureDetector(
                  onTap: controller.clearAll,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: .6.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.px),
                      border: Border.all(color: AppColors.primaryColor),
                      color: Colors.transparent,
                    ),
                    child: Text("Clear All", style: AppTextStyles.buttonTextStyle.copyWith(
                        color: AppColors.primaryColor, fontSize: 14.sp, fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
            verticalSpace(2.h),

            // Age
            RangeSection(
              title: "Age", iconPath: "assets/icons/calender.svg",
              range: controller.ageRange,
              onChanged: controller.updateAgeRange,
              labels: ["0y", "18y", "50y", "100y"],
            ),
            verticalSpace(2.h),

            // Height
            RangeSection(
              title: "Height", iconPath: "assets/icons/height.svg",
              range: controller.heightRange,
              onChanged: controller.updateHeightRange,
              labels: ["0in", "5in", "8in", "10in"],
            ),
            verticalSpace(2.h),

            // Gender
            GenderSection(selectedGender: controller.selectedGender),
            verticalSpace(2.h),

            // Relationship Status
            RelationshipSection( selectedStatus: controller.selectedRelationshipStatus,),
            verticalSpace(1.5.h),

            // Country
            Text("Country", style: AppTextStyles.regularTextStyle.copyWith(
                fontSize: 16.5.sp, fontWeight: FontWeight.w600, color: const Color(0xff6C6B73))),
            verticalSpace(.4.h),
            CustomTextField(hintText: "Ireland",),
            verticalSpace(2.h),

            // Buttons
            Row(
              children: [
                Expanded(child: customElevatedButton(title: "Cancel", bgColor: Colors.transparent,
                    titleColor: AppColors.primaryColor, borderColor: AppColors.primaryColor, onTap: () => Get.back())),
                horizontalSpace(5.w),
                Expanded(child: customElevatedButton(title: "Apply", bgColor: AppColors.primaryColor,
                    titleColor: Colors.white, onTap: controller.applyFilters)),
              ],
            ),
            verticalSpace(4.h),
          ],
        ),
      ),
    );
  }
}