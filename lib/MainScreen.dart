import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:ownweatherapp/getLocation.dart';
import 'package:ownweatherapp/main.dart';
import 'package:ownweatherapp/weatherData.dart';

DateTime now = DateTime.now();
var dateFormat = DateFormat('EEEE, d MMM,yyyy').format(now);
// String convertedDateTime =
//     "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ";
var db = Hive.box('cachedata');

class MainScreen extends StatelessWidget {
  var Client = weatherData();
  var data;

  info() async {
    var position = await GetPosition();
    data = await Client.getData(position.latitude, position.longitude);
//this is for saving the values into the databases
    db.put(0, data.cityName);
    db.put(1, data.currentMode);
    db.put(2, data.temp);
    db.put(3, data.windSpeed);
    db.put(4, data.humidity);
    db.put(5, data.windDirection);
    db.put(6, data.lastUpdated);
    db.watch().listen((event) {});

    return data;
  }

  String dayOrNight() {
    if ((data?.isDay) == 0) {
      return 'assets/images/night.png';
    } else {
      return 'assets/images/sunny.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(15, 36, 54, 1.0),
      body: ValueListenableBuilder(
          valueListenable: Hive.box('cachedata').listenable(),
          builder: (context, Box box, widget) {
            return FutureBuilder(
                future: info(),
                builder: (context, snapshot) {
                  return Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: size.height,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xff955cd1),
                                  Color(0xff3fa2fa),
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: [0.1, 0.85],
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 60),
                              child: Column(
                                children: [
                                  Text(
                                    db.get(0).toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 45,
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    '$dateFormat',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow[700],
                                    ),
                                  ),
                                  SizedBox(height: 29),
                                  Image.asset(
                                    dayOrNight(),
                                    width: 200,
                                  ),
                                  SizedBox(height: 22),
                                  Text(
                                    db.get(1).toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 9),
                                  Text(
                                    db.get(2).toString(),
                                    style: TextStyle(
                                      fontSize: 50,
                                      color: Colors.yellow,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/storm.png',
                                              width: 50,
                                            ),
                                            SizedBox(height: 7),
                                            Text(
                                              ' ${db.get(3).toString()} km/h',
                                              style: TextStyle(
                                                fontSize: 19,
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(height: 7),
                                            Text(
                                              'Wind Speed',
                                              style: TextStyle(
                                                fontSize: 19,
                                                fontFamily: 'Poppins',
                                                color: Colors.yellow,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/humidity.png',
                                              width: 50,
                                            ),
                                            SizedBox(height: 7),
                                            Text(
                                              db.get(4).toString(),
                                              style: TextStyle(
                                                fontSize: 19,
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(height: 7),
                                            Text(
                                              'Humidity',
                                              style: TextStyle(
                                                fontSize: 19,
                                                fontFamily: 'Poppins',
                                                color: Colors.yellow,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/wind.png',
                                              width: 50,
                                            ),
                                            SizedBox(height: 7),
                                            Text(
                                              db.get(5).toString(),
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(height: 9),
                                            Text(
                                              'Wind',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Poppins',
                                                color: Colors.yellow,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              'Direction',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Poppins',
                                                color: Colors.yellow,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    'last updated',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    db.get(6).toString(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.greenAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
