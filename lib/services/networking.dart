import 'package:http/http.dart' as http;
import 'dart:convert';

class Networker {
  static const api_key = String.fromEnvironment('OPENWEATHER_API_KEY');

  Future getData(double longitude, double latitude) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$api_key&units=metric'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
