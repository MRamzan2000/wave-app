import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weave_app/controller/onboarding_controller.dart';
import 'package:weave_app/view/reuseable_widgets/custom_elevated_button.dart';
import 'package:weave_app/view/reuseable_widgets/get_verticle_space.dart';
import 'package:weave_app/view/utils/app_colors.dart';
import 'package:weave_app/view/utils/app_styles.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final OnBoardingController onboardingController =
      Get.put(OnBoardingController());
  final onBoardImages = [
    "assets/images/onboard1.png",
    "assets/images/onboard2.png",
    "assets/images/onboard3.png",
    "assets/images/onboard4.png",
  ];
  final onBoardingText = [
    "Effortless Blog Sharing.\n Enhance Your Social Experience",
    "Forge Real Connections.\n Unleash the Power of Meetup.",
    "Connect, Communicate, and\n Thrive with our App",
    "Discover, Connect, and Grow\n Through Language Learning.",
  ];
  @override
  void dispose() {
    super.dispose();
    onboardingController.pageController.dispose();
    onboardingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            SizedBox(
                height: 58.h,
                width: MediaQuery.sizeOf(context).width,
                child: PageView.builder(
                    controller: onboardingController.pageController,
                    itemCount: onBoardImages.length,
                    onPageChanged: onboardingController.onPageChanged,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        onBoardImages[index],
                        fit: BoxFit.fitWidth,
                      );
                    })),
            verticalSpace(15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                children: [
                  Obx(
                    () => Text(
                      onBoardingText[onboardingController.currentPage.value],
                      style: AppTextStyles.regularTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  verticalSpace(8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => customElevatedButton(
                          horizontalSpace:
                              onboardingController.currentPage.value == 3
                                  ? 0
                                  : 2.w,
                          verticalSpace: 1.h,
                          title: onboardingController.currentPage.value == 3
                              ? "Get Started"
                              : "Next",
                          bgColor: AppColors.primaryColor,
                          titleColor: AppColors.textLight,
                          onTap: () {
                            onboardingController.nextPage();
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 3.w),
                        child: SmoothPageIndicator(
                          controller: onboardingController.pageController,
                          count: 4,
                          axisDirection: Axis.horizontal,
                          effect: ExpandingDotsEffect(
                              dotColor: AppColors.grey,
                              activeDotColor: AppColors.primaryColor,
                              dotHeight: 1.h,
                              dotWidth: 1.h,
                              expansionFactor: 1.4.w),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
