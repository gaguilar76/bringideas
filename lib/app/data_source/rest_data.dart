import 'package:bringideas/app/config/utils.dart';
import 'package:dio/dio.dart';

class RestData {
  Future<void> getClimate(String locality) async {
    var _dio = new Dio();
    var token = '40c4bb72d6d7be6c5083223ab5380c02';
    String url = "https://api.openweathermap.org/data/2.5/weather?";
    Map<String, String> qParams = {
      'q': locality,
      'APPID': token,
      'units': 'metric',
    };
    try {
      var result = await _dio.get(url, queryParameters: qParams);
      if (result.statusCode == 200) {
        Utils.clima = result.data['main']['temp'].toString();
      } else {
        Utils.clima = '';
      }
    } catch (e) {
      print(e);
      Utils.clima = '';
    }
  }
}
