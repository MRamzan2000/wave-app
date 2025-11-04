import 'package:get/get.dart';
import 'package:weave_app/model/post_model.dart';


class HomeController extends GetxController {
  final posts = <PostModel>[
    PostModel(
      userImage:
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&q=80&w=500',
      userName: 'Lita Han',
      country1: 'Irish',
      country2: 'German',
      postImage:
      'https://images.unsplash.com/photo-1761966088273-b8bbcb268f4d?auto=format&fit=crop&q=60&w=1000',
      description:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt... more',
      likes: 31,
      comments: 16,
    ),
    // second post - text only
    PostModel(
      userImage:
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&q=60&w=500',
      userName: 'Lita Han',
      country1: 'Irish',
      country2: 'German',
      postImage: null,
      description:
      'It doesn’t matter how impressive your accomplishments are – potential customers will avoid you if you don’t seem like an appealing person to work with. That’s why showing your human side is one of the most important things you can do in your real estate Business.',
      likes: 12,
      comments: 4,
    ),
  ].obs;

}
