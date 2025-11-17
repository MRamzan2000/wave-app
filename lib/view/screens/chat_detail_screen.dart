// screens/chat_detail_screen.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weave_app/controller/chat_detail_controller.dart';
import 'package:weave_app/view/utils/app_colors.dart';
import 'package:weave_app/view/utils/app_styles.dart';
import 'package:weave_app/view/reuseable_widgets/get_horizontal_space.dart';
import 'package:weave_app/view/reuseable_widgets/get_verticle_space.dart';

class ChatDetailScreen extends StatefulWidget {
  final String userName;
  final String userImage;

  const ChatDetailScreen({super.key, required this.userName, required this.userImage});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final ChatDetailController controller = Get.put(ChatDetailController());

// Selected message for long press
  Map<String, dynamic>? selectedMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.black, size: 2.5.h),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.px,
              backgroundImage: NetworkImage(widget.userImage),
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 14.px,
                      width: 14.px,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.fromBorderSide(BorderSide(color: Colors.white, width: 2)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            horizontalSpace(3.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.userName, style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600)),
                Text("Active now", style: TextStyle(fontSize: 13.sp, color: Colors.green)),
              ],
            ),
          ],
        ),
        actions: [
// Sirf tab dikhega jab koi message select ho
          if (selectedMessage != null)
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, color: Colors.black),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.px)),
              offset: Offset(0, 56.px),
              onSelected: (value) => _handleMenuAction(value),
              itemBuilder: (context) => [
                const PopupMenuItem(value: "translate", child: Text("Translate")),
                const PopupMenuItem(value: "delete", child: Text("Delete")),
                const PopupMenuItem(value: "edit", child: Text("Edit")),
              ],
            )
          else
            IconButton(icon: const Icon(Icons.more_vert, color: Colors.black), onPressed: () {}),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
              controller: controller.scrollController,
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
              itemCount: controller.messages.length,
              itemBuilder: (context, index) {
                final msg = controller.messages[index];
                return _buildMessage(msg);
              },
            )),
          ),
          _buildInputBar(),
        ],
      ),
    );
  }

  Widget _buildMessage(Map<String, dynamic> msg) {
    final bool isSent = msg['isSent'] ?? false;
    final String type = msg['type'] ?? 'text';
    final bool isSelected = identical(msg, selectedMessage); // Compare reference

    if (type == 'date') {
      return Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 2.h),
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.px)),
          child: Text(msg['text'] ?? 'Today', style: AppTextStyles.smallTextStyle.copyWith(fontSize: 13.sp)),
        ),
      );
    }

    return GestureDetector(
      onLongPress: () {
        HapticFeedback.mediumImpact();
        setState(() {
          selectedMessage = msg;
        });
      },
      onTap: () {
        if (selectedMessage != null) {
          setState(() => selectedMessage = null);
        }
      },
      child: Container(
        color: isSelected ? AppColors.primaryColor.withOpacity(0.15) : Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 0.5.h),
        child: Column(
          crossAxisAlignment: isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (type == 'text') ...[
              isSent ? _buildSentBubble(msg['text']) : _buildReceivedBubble(msg['text']),
            ] else if (type == 'voice') ...[
              _buildVoiceMessage(isSent: isSent),
            ],
            verticalSpace(0.5.h),
            Padding(
              padding: isSent ? EdgeInsets.only(right: 2.w) : EdgeInsets.only(left: 12.w),
              child: Text(
                msg['time'] ?? '',
                style: AppTextStyles.smallTextStyle.copyWith(fontSize: 11.5.sp, color: Colors.grey[600]),
              ),
            ),
            verticalSpace(1.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSentBubble(String text) {
    return Container(
      constraints: BoxConstraints(maxWidth: 75.w),
      margin: EdgeInsets.only(left: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.px),
          topRight: Radius.circular(20.px),
          bottomLeft: Radius.circular(20.px),
        ),
      ),
      child: Text(text, style: AppTextStyles.smallTextStyle.copyWith(fontSize: 15.sp, color: Colors.white)),
    );
  }

  Widget _buildReceivedBubble(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CircleAvatar(radius: 18.px, backgroundImage: NetworkImage(widget.userImage)),
        horizontalSpace(2.w),
        Container(
          constraints: BoxConstraints(maxWidth: 75.w),
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.px),
              topRight: Radius.circular(20.px),
              bottomRight: Radius.circular(20.px),
            ),
          ),
          child: Text(text, style: AppTextStyles.regularTextStyle.copyWith(fontSize: 15.sp)),
        ),
      ],
    );
  }

  Widget _buildVoiceMessage({required bool isSent}) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        width: 70.w,
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: isSent ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(30.px),
        ),
        child: Row(
          children: [
            Icon(Icons.play_arrow, color: isSent ? Colors.white : AppColors.primaryColor, size: 32.px),
            horizontalSpace(3.w),
            Expanded(
              child: Container(
                height: 5.px,
                decoration: BoxDecoration(
                  color: isSent ? Colors.white.withOpacity(0.4) : Colors.grey[300],
                  borderRadius: BorderRadius.circular(3.px),
                ),
                child: Stack(
                  children: [Container(width: 55.w, color: isSent ? Colors.white : AppColors.primaryColor)],
                ),
              ),
            ),
            horizontalSpace(3.w),
            Text("00:16", style: TextStyle(color: isSent ? Colors.white : Colors.black87, fontSize: 14.sp)),
          ],
        ),
      ),
    );
  }

  void _handleMenuAction(String action) {
    if (selectedMessage == null) return;

    switch (action) {
      case "translate":
        Get.snackbar("Translate", "Translating your message...");
        break;
      case "delete":
        controller.deleteMessage(selectedMessage!);
        Get.snackbar("Deleted", "Message removed", backgroundColor: Colors.red[100]);
        break;
      case "edit":
        Get.snackbar("Edit", "Edit feature coming soon");
        break;
    }

    setState(() => selectedMessage = null);
  }

  Widget _buildInputBar() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(4.w, 1.5.h, 3.w, Get.mediaQuery.viewInsets.bottom + 1.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              radius: 20.px,
              backgroundColor: Colors.grey[200],
              child: const Icon(Icons.insert_emoticon, color: Colors.grey),
            ),
          ),
          horizontalSpace(3.w),

          Expanded(
            child: Container(
              height: 48.px,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(30.px)),
              child: TextField(
                controller: controller.messageController,
                decoration: InputDecoration(
                  hintText: "Hello",
                  hintStyle: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
                  border: InputBorder.none,
                ),
                onSubmitted: (_) => controller.sendMessage(),
              ),
            ),
          ),
          horizontalSpace(3.w),

          Icon(Icons.attach_file, color: Colors.grey[600], size: 26.px),
          horizontalSpace(4.w),
          Icon(Icons.camera_alt_outlined, color: Colors.grey[600], size: 26.px),
          horizontalSpace(4.w),

// Big Send Button
          GestureDetector(
            onTap: controller.sendMessage,
            child: CircleAvatar(
              radius: 22.px,
              backgroundColor: AppColors.primaryColor,
              child: const Icon(Icons.send, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}