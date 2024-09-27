import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wather_app/models/weather_model.dart';

// class WeatherService {
//   String baseUrl = 'http://api.weatherapi.com/v1';
//   String apiKey = '24c55f7d172d4faf95304122242004';

//   Future<WeatherModel?> getWeather({required String cityName}) async {
//     WeatherModel? weather;
//     try {
//       Uri url =
//           Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days/1');
//       http.Response response = await http.get(url);
//       var encodeFirst = json.encode(response.body);
//       Map<String, dynamic> data = json.decode(encodeFirst);
//       weather = WeatherModel.fromJson(data);
//     } catch (e) {
//       print('>>>>>>>>>>$e');
//     }
//     return weather;
//   }
// }
// http://api.weatherapi.com/v1/forecast.json?key=24c55f7d172d4faf95304122242004&q=$cityName&days=1

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';

  String apiKey = '24c55f7d172d4faf95304122242004';
  Future<WeatherModel> getWeather({required String cityName}) async {
    // try {

    // } catch (e) {
    //   print('>>>>>>>>>>$e');
    // }
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    http.Response response = await http.get(url);

    if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      throw Exception(data['error']['message']);
    }
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
