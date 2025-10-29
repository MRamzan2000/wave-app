import 'package:get/get.dart';
import 'package:weave_app/view/screens/blogs_screen.dart';
import 'package:weave_app/view/screens/chat_screen.dart';
import 'package:weave_app/view/screens/home_screen.dart';
import 'package:weave_app/view/screens/meet_screen.dart';

class BottomNavController extends GetxController{
  RxInt selectedIndex = 0.obs;

  final List<String> iconsUnSelect = [
    "assets/icons/home.svg",
    "assets/icons/meet.svg",
    "assets/icons/chat.svg",
    "assets/icons/blog.svg",
  ];
  final List<String> iconSelect = [
    "assets/icons/active_home.svg",
    "assets/icons/active_meet.svg",
    "assets/icons/active_chat.svg",
    "assets/icons/active_blog.svg",
  ];
   var screens=[
     HomeScreen(),
     MeetScreen(),
     ChatScreen(),
     BlogsScreen()
   ];

}