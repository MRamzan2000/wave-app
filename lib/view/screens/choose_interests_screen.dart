import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/controller/interests_controller.dart';
import 'package:weave_app/model/gender_model.dart';
import 'package:weave_app/model/relation_model.dart';
import 'package:weave_app/view/reuseable_widgets/custom_dropdown.dart';
import 'package:weave_app/view/reuseable_widgets/custom_elevated_button.dart';
import 'package:weave_app/view/reuseable_widgets/custom_textfield.dart';
import 'package:weave_app/view/reuseable_widgets/get_verticle_space.dart';
import 'package:weave_app/view/reuseable_widgets/interest_chip.dart';
import 'package:weave_app/view/screens/complete_profile_screen.dart';
import 'package:weave_app/view/utils/app_colors.dart';
import 'package:weave_app/view/utils/app_styles.dart';

class ChooseInterestsScreen extends StatelessWidget {
  ChooseInterestsScreen({super.key});
  final interestController = Get.put(InterestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(4.h),
            ListTile(
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 3.5.h),
                  height: 4.h,
                  width: 8.w,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.black,
                    size: 2.6.h,
                    weight: 0.05,
                  ),
                ),
              ),
              title: Text("Interests & Hobbies",
                  style: AppTextStyles.headingTextStyle
                      .copyWith(fontWeight: FontWeight.w500)),
              subtitle: Text(
                "You can choose multiple options you are interested in.",
                style: AppTextStyles.smallTextStyle,
              ),
              contentPadding: EdgeInsets.zero,
            ),
            verticalSpace(2.h),
            Obx(
              () => Wrap(
                spacing: 1.h,
                runSpacing: 1.h,
                children:
                    List.generate(interestController.interest.length, (index) {
                  final item = interestController.interest[index];
                  return interestChip(
                    title: item.title,
                    isSelected: item.select,
                    onTap: () => interestController.toggleInterest(index),
                  );
                }),
              ),
            ),
            verticalSpace(2.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Country",
                      style: AppTextStyles.smallTextStyle,
                    ),
                    verticalSpace(.4.h),
                    CustomTextField(
                      hintText: "Ireland",
                    ),
                    verticalSpace(2.h),
                    Text(
                      "Age",
                      style: AppTextStyles.smallTextStyle,
                    ),
                    verticalSpace(.4.h),
                    CustomTextField(
                      hintText: "25",
                    ),
                    verticalSpace(2.h),
                    Text(
                      "Height",
                      style: AppTextStyles.smallTextStyle,
                    ),
                    verticalSpace(.4.h),
                    CustomTextField(
                      hintText: "5.7",
                    ),
                    verticalSpace(2.h),
                    customDropdownButton<GenderModel>(
                      title: "Select Gender",
                      hint: "Choose gender",
                      context: context,
                      items: interestController.genderList,
                      selectedValue: interestController.selectedGender,
                      label: (gender) => gender.name,
                    ),
                    verticalSpace(2.h),
                    customDropdownButton<RelationModel>(
                      title: "Relationship Status",
                      hint: "Single",
                      context: context,
                      items: interestController.relationList,
                      selectedValue: interestController.selectRelation,
                      label: (interest) => interest.title,
                    ),
                    verticalSpace(4.h),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 5.w),
                      child: Row(
                        children: [
                          Expanded(
                              child: customElevatedButton(
                                  title: "Continue",
                                  bgColor: AppColors.primaryColor,
                                  titleColor: AppColors.white,
                                  onTap: () {
                                    Get.off(()=>CompleteProfileScreen());
                                  }))
                        ],
                      ),
                    ),
                    verticalSpace(13.h)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
