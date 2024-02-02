import 'dart:convert';

import 'package:get/get_connect.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';

class NeisClient {
  final GetConnect _connect = Get.put(GetConnect());

  Future<Map<String, dynamic>> getMeal(String officeOfEduCode, String adminStandardsCode) async {
    String date = DateFormat('yyyyMMdd').format(DateTime.now());

    Response response = await _connect.get(
      'https://open.neis.go.kr/hub/mealServiceDietInfo',
      query: {
        'KEY': '4cb39a23104d459ebe0d394f9900cf5c',
        'Type': 'Json',
        'ATPT_OFCDC_SC_CODE': officeOfEduCode,
        'SD_SCHUL_CODE': adminStandardsCode,
        'MLSV_YMD': date,
      },
    );
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> getSchools(int index, String name) async {
    Response response = await _connect.get(
      'https://open.neis.go.kr/hub/schoolInfo',
      query: {
        'KEY': '4cb39a23104d459ebe0d394f9900cf5c',
        'Type': 'Json',
        'pIndex': '$index',
        'pSize': '1000',
        'SCHUL_NM': name,
      },
    );
    return jsonDecode(response.body);
  }
}
