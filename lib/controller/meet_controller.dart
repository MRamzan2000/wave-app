import 'package:get/get.dart';
import 'package:weave_app/model/meet_model.dart';

class MeetController extends GetxController{
  final meets=<MeetModel>[
    MeetModel(
        userImage: "https://cdn.pixabay.com/photo/2025/10/17/15/16/halloween-9900545_1280.jpg",
        userName: "Sophie",
        country1: "Irish",
        country2: "German",
        greeting: "Say"),
    MeetModel(
        userImage: "https://cdn.pixabay.com/photo/2023/04/17/03/42/man-7931575_640.jpg",
        userName: "Mike",
        country1: "Irish",
        country2: "German",
        greeting: "Say"),
    MeetModel(
        userImage: "https://cdn.pixabay.com/photo/2019/03/24/21/17/man-4078706_640.jpg",
        userName: "Tom",
        country1: "Irish",
        country2: "German",
        greeting: "Say"),
    MeetModel(
        userImage: "https://cdn.pixabay.com/photo/2023/09/02/11/43/woman-8228723_640.jpg",
        userName: "Jessica",
        country1: "Irish",
        country2: "German",
        greeting: "Say"),
    MeetModel(
        userImage: "https://cdn.pixabay.com/photo/2024/01/14/04/51/girl-8507203_640.jpg",
        userName: "Alita",
        country1: "Irish",
        country2: "German",
        greeting: "Say"),
    MeetModel(
        userImage: "https://cdn.pixabay.com/photo/2020/04/27/10/21/spring-5099152_640.jpg",
        userName: "Raika",
        country1: "Irish",
        country2: "German",
        greeting: "Say"),
     ].obs;

}