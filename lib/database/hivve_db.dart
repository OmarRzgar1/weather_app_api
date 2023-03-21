import 'package:hive/hive.dart';

part 'hivve_db.g.dart';

@HiveType(typeId: 1)
class SaveInDatabase {
  @HiveField(0)
  late String cityName;

  @HiveField(1)
  late String condition;

  @HiveField(2)
  late int temp;

  @HiveField(3)
  late double windSpeed;

  @HiveField(4)
  late double humidity;

  @HiveField(5)
  late double windDirection;

  @HiveField(6)
  late String lastUpdated;

  SaveInDatabase({
    required this.cityName,
    required this.condition,
    required this.temp,
    required this.windSpeed,
    required this.humidity,
    required this.windDirection,
    required this.lastUpdated,
  });
}
