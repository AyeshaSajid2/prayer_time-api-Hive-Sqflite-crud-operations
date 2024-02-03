// api_service.dart

import 'dart:convert';
// import 'package:assignment_two/data_apis/MODEL/api_model.dart';
import 'package:assignment_two/data_apis/prayer_time_page.dart';
import 'package:http/http.dart' as http;


class PrayerTimesService {
  final String urlApi =
  //    'http://api.aladhan.com/v1/calendar/2019?latitude=51.508515&longitude=-0.1254872&method=2';
      'http://api.aladhan.com/v1/calendar/2017/4?latitude=51.508515&longitude=-0.1254872&method=2 http://api.aladhan.com/v1/calendar/2019?latitude=51.508515&longitude=-0.1254872&method=2';
  Future<PrayerTime> getPrayerTimeData() async {
    try {
      final response = await http.get(Uri.parse(urlApi));
      if (response.statusCode == 200) {
        return PrayerTime.fromMap(json.decode(response.body));
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}