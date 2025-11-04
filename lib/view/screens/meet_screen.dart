import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/controller/meet_controller.dart';
import 'package:weave_app/view/reuseable_widgets/custom_appbar.dart';
import 'package:weave_app/view/reuseable_widgets/meet_widgets/meet_item.dart';


class MeetScreen extends StatelessWidget {
  MeetScreen({super.key});

  final MeetController meetController = Get.put(MeetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: "Meet",
        action: [SvgPicture.asset("assets/icons/filter.svg")],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Obx(() => GridView.builder(
          itemCount: meetController.meets.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 1.h,
              crossAxisSpacing: 2.w,
              childAspectRatio: 0.8),
          itemBuilder: (context, index) {
            final m = meetController.meets[index];
            return MeetItem(
              image: m.userImage,
              name: m.userName,
              country1: m.country1,
              country2: m.country2,
              greeting: m.greeting,
            );
          },
        )),
      ),
    );
  }
}
