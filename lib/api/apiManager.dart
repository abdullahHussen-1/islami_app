import 'package:dio/dio.dart';
import 'package:islami_app/model/radio_response.dart';
import 'package:islami_app/model/reciters_response.dart';
import 'package:islami_app/model/time_response.dart';

class ApiManager {
  static Dio dio = Dio();

  static Future<RadioResponse> getRadio() async {
    try {
      var response = await dio.get('https://mp3quran.net/api/v3/radios',
          queryParameters: {'language': 'ar'});
      var responseJson = response.data;
      var responseData = RadioResponse.fromJson(responseJson);
      return responseData;
    } catch (error) {
      rethrow;
    }
  }

  static Future<RecitersResponse> getReciters() async {
    try {
      var response = await dio.get('https://mp3quran.net/api/v3/reciters');
      var responseJson = response.data;
      var responseData = RecitersResponse.fromJson(responseJson);
      return responseData;
    } catch (error) {
      rethrow;
    }
  }

  static Future<TimeResponse> getTime({required String city}) async {
    try {
      var response = await dio.get('https://api.aladhan.com/v1/timingsByCity',
          queryParameters: {'city': city, 'country': 'Egypt'});
      var responseJson = response.data;
      var responseData = TimeResponse.fromJson(responseJson);
      return responseData;
    } catch (error) {
      rethrow;
    }
  }
}
