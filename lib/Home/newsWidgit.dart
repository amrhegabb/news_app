import 'package:flutter/material.dart';
import 'package:news_app/model/newsResponse.dart';

class NewsWidgit extends StatelessWidget {
  News news;
  NewsWidgit(this.news);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: NetworkImage(
            news.urlToImage ?? "",
          ),
          width: double.infinity,
          height: 120,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
