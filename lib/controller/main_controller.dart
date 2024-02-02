import 'package:get/get.dart';
import 'package:school_meal_information/model/meal_type.dart';
import 'package:school_meal_information/model/school_info.dart';
import 'package:school_meal_information/repository/neis_repository.dart';

class MainController {
  final NeisRepository _neisRepository = NeisRepository();

  final Rx<MealType> _mealTypeState = Rx(MealType.lunch);
  final Rx<SchoolInfo> _schoolInfoState = Rx(SchoolInfo.empty());

  MealType get mealType => _mealTypeState.value;

  set _mealType(MealType value) => _mealTypeState(value);

  SchoolInfo get schoolInfo => _schoolInfoState.value;

  set schoolInfo(SchoolInfo value) => _schoolInfoState(value);

  void previousMealType() {
    if (mealType.index > 0) {
      _mealType = MealType.values[mealType.index - 1];
    }
  }

  void nextpreviousMealType() {
    if (mealType.index < MealType.values.length - 1) {
      _mealType = MealType.values[mealType.index + 1];
    }
  }

  Future<String> getMeal(MealType mealType, SchoolInfo schoolInfo) =>
      _neisRepository.getMeal(mealType.index, schoolInfo);
}
