import 'package:get/get.dart';
import 'package:school_meal_information/model/school_info.dart';
import 'package:school_meal_information/repository/neis_repository.dart';

class SchoolController {
  final NeisRepository _neisRepository = NeisRepository();
  final RxString _nameState = RxString('');
  final RxInt _indexState = RxInt(1);

  set name(String value) => _nameState(value);

  String get name => _nameState.value;

  int get index => _indexState.value;

  set index(int value) => _indexState(value);

  Future<List<SchoolInfo>> getSchools(int index, String name) =>
      _neisRepository.getSchools(index, name);
}
