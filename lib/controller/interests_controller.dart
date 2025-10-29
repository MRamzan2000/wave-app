import 'package:get/get.dart';
import 'package:weave_app/model/gender_model.dart';
import 'package:weave_app/model/interest_model.dart';
import 'package:weave_app/model/relation_model.dart';

class InterestController extends GetxController {
  var interest = [
    InterestModel(title: "Cybersecurity"),
    InterestModel(title: "Programming"),
    InterestModel(title: "Software Development"),
    InterestModel(title: "Cloud Computing"),
    InterestModel(title: "Mobile App Development"),
    InterestModel(title: "Artificial Intelligence"),
    InterestModel(title: "User Experience Design"),
    InterestModel(title: "Technology Trends"),
    InterestModel(title: "Digital Innovation"),
    InterestModel(title: "Blockchain"),
    InterestModel(title: "Internet of Things (IoT)"),
    InterestModel(title: "Augmented Reality (AR)"),
    InterestModel(title: "Virtual Reality (VR)"),
    InterestModel(title: "Data Science"),
    InterestModel(title: "Tech Startups"),
  ].obs;
  void toggleInterest(int index) {
    interest[index].select = !interest[index].select;
    interest.refresh();
  }
  List<GenderModel> genderList = [
    GenderModel(name: "Male"),
    GenderModel(name: "Female"),
    GenderModel(name: "Custom"),
  ];

  Rx<GenderModel?> selectedGender = Rx<GenderModel?>(null);
  List<RelationModel>relationList=[
    RelationModel(title: "Single"),
    RelationModel(title: "Married"),
  ].obs;
  Rx<RelationModel?> selectRelation= Rx<RelationModel?>(null);

}
