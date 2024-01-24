import 'package:flutter_application_test/data/weather_data.dart';
import 'package:flutter_application_test/screens/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  // Universal resource identifier (URI)
  // https://api.openweathermap.org/data/2.5/weather?q=Caracas&appid=b4fa7c1ea9302b5d30c5a804627dcd19

  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = 'b4fa7c1ea9302b5d30c5a804627dcd19';

  Future<WeatherData> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appid': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    WeatherData weather = WeatherData.fromJson(data);
    return weather;
  }
}
