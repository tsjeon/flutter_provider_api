import 'package:flutter/material.dart';
import 'package:flutterprovider/src/home.dart';
import 'package:flutterprovider/src/provider/bottom_navigation_provider.dart';
import 'package:flutterprovider/src/provider/count_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Provider Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => CountProvider(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => BottomNavigationProvider(),
          ),
        ],
        child: Home(),
      ),
    );
  }
}
