import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/view/utils/app_colors.dart';
import 'package:weave_app/view/utils/app_styles.dart';
import 'get_verticle_space.dart';

Widget customDropdownButton<T>({
  required String title,
  required String hint,
  required BuildContext context,
  required Rx<T?> selectedValue, // 👈 Rx type for reactivity
  required List<T> items,
  required String Function(T) label,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: AppTextStyles.smallTextStyle,
      ),
      verticalSpace(.4.h),
      Obx(() => DropdownButtonHideUnderline(
        child: DropdownButton2<T>(
          isExpanded: true,
          hint: Text(
            hint,
            style: AppTextStyles.smallTextStyle,
          ),
          value: selectedValue.value, // 👈 reactive value
          items: items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                label(item),
                style: AppTextStyles.smallTextStyle,
              ),
            );
          }).toList(),
          onChanged: (value) {
            selectedValue.value = value; // 👈 real-time update
          },
          buttonStyleData: ButtonStyleData(
            height: 5.h,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.px),
              color: AppColors.textFiledBgColor,
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.px),
              color: AppColors.textFiledBgColor,
            ),
            elevation: 2,
            offset: const Offset(0, 0), // always opens below
          ),
          menuItemStyleData: MenuItemStyleData(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 14),
          ),
        ),
      )),
    ],
  );
}
