import 'package:flutter/material.dart';
import 'package:news_app/Home/home_Screen.dart';
import 'package:news_app/Themes/my_Theme.dart';
import 'package:news_app/news/news_fragment.dart';
import 'package:news_app/news_Details.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
      title: "newsapp",
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        NewsDetails.routeName: (context) => NewsDetails()
      },
    );
  }
}
