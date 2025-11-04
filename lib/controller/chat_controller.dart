import 'package:get/get.dart';
import 'package:weave_app/model/chat_model.dart';

class ChatController extends GetxController {
  RxList<ChatModel> chats = <ChatModel>[
    ChatModel(
      image: "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
      name: "Shia Rayy",
      message: "Good morning, did you sleep well?",
      isOnline: true,
    ),
    ChatModel(
      image: "https://cdn.pixabay.com/photo/2023/04/17/03/26/man-7931568_640.jpg",
      name: "Jhon Smith",
      message: "How is it going?",
    ),
    ChatModel(
      image: "https://images.unsplash.com/photo-1517841905240-472988babdf9",
      name: "Erlan Sadewa",
      message: "Aight, noted",
    ),
  ].obs;
}
