import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/newsResponse.dart';
import 'package:news_app/my_date_Utills.dart';
import 'package:news_app/news_Details.dart';

class NewsWidgit extends StatelessWidget {
  News news;
  NewsWidgit(this.news);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetails.routeName, arguments: news);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? "",
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  Center(child: Icon(Icons.error)),
              width: double.infinity,
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            news.source!.name ?? "",
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.black),
          ),
          Text(
            news.title ?? "",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.black),
          ),
          Text(
            MyDateUtils.formateNewsDate(news.publishedAt!),
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: Colors.black),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
