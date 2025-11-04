import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/controller/chat_controller.dart';
import 'package:weave_app/view/reuseable_widgets/chat_wisgets/chat_item.dart';
import 'package:weave_app/view/reuseable_widgets/custom_appbar.dart';
import 'package:weave_app/view/reuseable_widgets/get_horizontal_space.dart';
import 'package:weave_app/view/reuseable_widgets/get_verticle_space.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Chat"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          children: [
            // Search
            Container(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              height: 6.5.h,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.12),
                borderRadius: BorderRadius.circular(40.px),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey.shade600),
                  horizontalSpace(2.w),
                  Text("Search",
                      style: TextStyle(
                          color: Colors.grey.shade600, fontSize: 17.sp))
                ],
              ),
            ),
            verticalSpace(3.h),

            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: chatController.chats.length,
                    itemBuilder: (context, index) {
                      final c = chatController.chats[index];
                      return ChatItem(
                        image: c.image,
                        userName: c.name,
                        message: c.message,
                        isOnline: c.isOnline,
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
