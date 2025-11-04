class PostModel {
  final String userImage;
  final String userName;
  final String country1;
  final String country2;
  final String? postImage;
  final String description;
  final int likes;
  final int comments;

  PostModel({
    required this.userImage,
    required this.userName,
    required this.country1,
    required this.country2,
    this.postImage,
    required this.description,
    required this.likes,
    required this.comments,
  });
}
