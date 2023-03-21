class Weather {
  var cityName;
  var isDay;
  var currentMode;
  var temp;
  var date;
  var windSpeed;
  var humidity;
  var windDirection;
  var lastUpdated;

  Weather.name({
    required this.cityName,
    required this.currentMode,
    required this.humidity,
    required this.isDay,
    required this.lastUpdated,
    required this.temp,
    required this.date,
    required this.windDirection,
    required this.windSpeed,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['location']['name'];
    currentMode = json['current']['condition']['text'];
    humidity = json['current']['humidity'];
    isDay = json['current']['is_day'];
    lastUpdated = json['current']['last_updated'];
    temp = json['current']['temp_c'];
    windDirection = json['current']['wind_dir'];
    windSpeed = json['current']['wind_kph'];
  }
}
