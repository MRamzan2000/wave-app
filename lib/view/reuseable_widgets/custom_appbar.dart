import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/view/utils/app_styles.dart';

PreferredSizeWidget appBar({required String title, List<Widget>? action}) {
  return AppBar(
      actionsPadding: EdgeInsets.only(right: 4.w),
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: AppTextStyles.headingTextStyle
            .copyWith(fontWeight: FontWeight.w600),
      ),
      actions: action);
}
