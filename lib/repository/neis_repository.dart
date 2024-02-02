import 'package:school_meal_information/model/school_info.dart';
import 'package:school_meal_information/service/neis_client.dart';

class NeisRepository {
  final NeisClient _client = NeisClient();

  Future<String> getMeal(int index, SchoolInfo schoolInfo) async {
    Map<String, dynamic> result = await _client.getMeal(
      schoolInfo.officeOfEduCode,
      schoolInfo.adminStandardsCode,
    );
    String dishName =
        result['mealServiceDietInfo'][1]['row'][index]['DDISH_NM'];

    return dishName.replaceAll('<br/>', '\n');
  }

  Future<List<SchoolInfo>> getSchools(int index, String name) async {
    Map<String, dynamic> result = await _client.getSchools(index, name);
    List data = result['schoolInfo'][1]['row'];

    return data.map((e) => SchoolInfo.fromJson(e)).toList();
  }
}
