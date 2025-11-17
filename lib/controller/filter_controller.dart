import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  var ageRange = const RangeValues(18, 50).obs;
  var heightRange = const RangeValues(60, 80).obs;
  var selectedGender = "Men".obs;
  var selectedRelationshipStatus = "Single".obs;

  void updateAgeRange(RangeValues v) => ageRange.value = v;
  void updateHeightRange(RangeValues v) => heightRange.value = v;
  void setGender(String g) => selectedGender.value = g;


  void clearAll() {
    ageRange.value = const RangeValues(18, 50);
    heightRange.value = const RangeValues(60, 80);
    selectedGender.value = "Men";
    selectedRelationshipStatus.value = "Single";
  }

  void applyFilters() => Get.back(result: {
    'age': ageRange.value,
    'height': heightRange.value,
    'gender': selectedGender.value,
    'relationship': selectedRelationshipStatus,
  });

}