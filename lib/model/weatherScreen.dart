import 'dart:convert';

import 'package:http/http.dart' as http;

const _openWeatherMapApiKey = _APPKEY_;

class WeatherData {
  final String temperature;
  final String weatherCondition;
  final String cityName;
  final String image;
  final String tempMax;
  final String tempMin;
  final String percent;

  WeatherData({
    required this.temperature,
    required this.weatherCondition,
    required this.cityName,
    required this.image,
    required this.tempMax,
    required this.tempMin,
    required this.percent,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final temperature = '${(json['main']['temp']).toStringAsFixed(1)} °C';
    final weatherCondition = json['weather'][0]['main'];
    final cityName = json['name'];
    final image =
        'https://openweathermap.org/img/w/${json['weather'][0]['icon']}.png';

    final tempMax = '${(json['main']['temp_max']).toStringAsFixed(1)} °C';
    final tempMin = '${(json['main']['temp_min']).toStringAsFixed(1)} °C';
    final percent = '${json['clouds']['all'].toString()} %';
    print(tempMax);

    return WeatherData(
      temperature: temperature,
      weatherCondition: weatherCondition,
      cityName: cityName,
      image: image,
      tempMax: tempMax,
      tempMin: tempMin,
      percent: percent,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'weatherCondition': weatherCondition,
      'cityName': cityName,
      'image': image,
      'tempMax': tempMax,
      'tempMin': tempMin,
      'percent': percent,
    };
  }
}

Future<WeatherData> fetchWeatherData() async {
  final url = Uri.https(
    'api.openweathermap.org',
    '/data/2.5/weather',
    {
      'lat': '-21.2425512',
      'lon': '-44.9991978',
      'appid': _openWeatherMapApiKey,
      'units': 'metric'
    },
  );
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    final weatherData = WeatherData.fromJson(json);
    return weatherData;
  } else {
    throw Exception('Failed to load weather data');
  }
}
