import 'package:http/http.dart' as http;
import 'dart:convert';

class Networker {
  static const api_key = String.fromEnvironment('OPENWEATHER_API_KEY');
  String url = 'https://api.openweathermap.org/data/2.5/weather';

  Future<dynamic> getCityData(String city) async {
    http.Response response =
        await http.get(Uri.parse('$url?q=$city&appid=$api_key&units=metric'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }

  Future getLocData(double longitude, double latitude) async {
    http.Response response = await http.get(Uri.parse(
        '$url?lat=$latitude&lon=$longitude&appid=$api_key&units=metric'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
