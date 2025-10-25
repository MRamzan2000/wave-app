import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/view/reuseable_widgets/custom_elevated_button.dart';
import 'package:weave_app/view/reuseable_widgets/get_horizontal_space.dart';
import 'package:weave_app/view/reuseable_widgets/get_verticle_space.dart';
import 'package:weave_app/view/utils/app_colors.dart';
import 'package:weave_app/view/utils/app_styles.dart';
import 'package:weave_app/view/utils/extensions/country_code.dart';
import 'choose_interests_screen.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({super.key});

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  RxInt selectedLanguage = 0.obs;     // 0 = English, 1 = Urdu, 2 = Arabic

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(8.h),
            Text(
              "Select Language",
              style: AppTextStyles.headingTextStyle,
            ),
            verticalSpace(.5.h),
            Text(
              "Choose the language you want to learn",
              style: AppTextStyles.smallTextStyle,
              textAlign: TextAlign.center,
            ),
            verticalSpace(5.h),
            selectLanguage(flag: "US", language: "English", value: 0),
            verticalSpace(1.h),
            selectLanguage(flag: "PK", language: "Urdu", value: 1),
            verticalSpace(1.h),
            selectLanguage(flag: "SA", language: "Arabic", value: 2),
            verticalSpace(5.h),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: customElevatedButton(
                      title: "Continue",
                      bgColor: AppColors.primaryColor,
                      titleColor: AppColors.white,
                      onTap: () {
                        Get.to(()=>ChooseInterestsScreen());
                      }),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget selectLanguage({
    required String flag,
    required String language,
    required int value,
  }) {
    return Obx(
      () => GestureDetector(
        onTap: (){
          selectedLanguage.value = value;

        },
        child: Card(
          color: AppColors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Row(
              children: [
                Row(
                  children: [
                    Text(flag.toFlag,
                        style: AppTextStyles.specialLimelightHeading
                            .copyWith(fontSize: 23.sp)),
                    horizontalSpace(3.w),
                    Text(language,
                        style: AppTextStyles.headingTextStyle.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 16.sp)),
                  ],
                ),
                Flexible(child: Container()),
                Radio<int>(
                  value: value,
                  groupValue: selectedLanguage.value,
                  activeColor: AppColors.primaryColor,
                  onChanged: (value){
                    selectedLanguage.value=value!;
                  },

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
