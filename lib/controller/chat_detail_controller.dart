// controller/chat_detail_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatDetailController extends GetxController {
  final messages = <Map<String, dynamic>>[].obs;
  final messageController = TextEditingController();
  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    _loadDummyMessages();
  }

  void _loadDummyMessages() {
    messages.addAll([
      {'type': 'date', 'text': 'Today'},
      {'type': 'text', 'text': 'Hello! Jhon abraham', 'isSent': false, 'time': '09:25 AM'},
      {'type': 'text', 'text': 'Hello! Nazrul How are you?', 'isSent': true, 'time': '09:25 AM'},
      {'type': 'text', 'text': 'You did your job well!', 'isSent': true, 'time': '09:25 AM'},
      {'type': 'text', 'text': 'Have a great working week!!', 'isSent': false, 'time': '09:25 AM'},
      {'type': 'text', 'text': 'Hope you like it', 'isSent': false, 'time': '09:25 AM'},
      {'type': 'voice', 'isSent': true, 'time': '09:25 AM'}, // ← yahan isSent hai
    ]);
  }

  void sendMessage() {
    if (messageController.text.trim().isEmpty) return;
    messages.add({
      'type': 'text',
      'text': messageController.text.trim(),
      'isSent': true,
      'time': '09:26 AM',
    });
    messageController.clear();
    _scrollToBottom();
  }

  void deleteMessage(Map<String, dynamic> msg) {
    messages.remove(msg);
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}