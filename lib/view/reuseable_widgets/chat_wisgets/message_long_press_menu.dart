import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MessageLongPressMenu extends StatelessWidget {
  final VoidCallback onTranslate;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const MessageLongPressMenu({
    super.key,
    required this.onTranslate,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.px),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _menuItem("Translate", onTranslate),
              const Divider(height: 0.5, thickness: 0.5, color: Color(0xFFE5E5EA)),
              _menuItem("Delete", onDelete),
              const Divider(height: 0.5, thickness: 0.5, color: Color(0xFFE5E5EA)),
              _menuItem("Edit", onEdit),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuItem(String title, VoidCallback onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.px),
      onTap: () {
        Get.back(); // Menu close kar de
        onTap();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 17.sp,
              color: const Color(0xFF8E8E93),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}