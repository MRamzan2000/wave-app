
class ChatModel {
  final String image;
  final String name;
  final String message;
  final bool isOnline;

  ChatModel({required this.image, required this.name, required this.message, this.isOnline = false});
}