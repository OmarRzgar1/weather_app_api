import 'dart:convert';
import 'package:http/http.dart' as http;
import './weatherModel.dart';

class weatherData {
  Future<Weather> getData(var latitude, var longitude) async {
    var uriCall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=cd3ca2d2da464c7e9d4175610230403&q=$latitude,$longitude&aqi=no');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
