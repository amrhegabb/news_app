import 'package:flutter/material.dart';
import 'package:news_app/news_fragment.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "newsapp",
      debugShowCheckedModeBanner: false,
      initialRoute: NewsFragment.roueName,
      routes: {NewsFragment.roueName: (context) => NewsFragment()},
    );
  }
}
