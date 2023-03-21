import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ownweatherapp/MainScreen.dart';
import 'package:flutter/services.dart';
import 'package:ownweatherapp/database/hivve_db.dart';

late Box box;
Future<void> main() async {
  await Hive.initFlutter();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  Hive.registerAdapter(SaveInDatabaseAdapter());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Application using api',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Hive.openBox('cachedata'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return Text(snapshot.error.toString());
            else
              return MainScreen();
          } else
            return Scaffold();
        },
      ),
    );
  }

//this is for closing the hive after running the appliacation because  if we dont close it it will take more memory and bad for performace

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
