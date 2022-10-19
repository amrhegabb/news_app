import 'package:flutter/material.dart';
import 'package:news_app/Category/category_Item.dart';

import 'package:news_app/apiManager.dart';
import 'package:news_app/model/sourcesResponse.dart';
import 'package:news_app/news/sourecsTabs.dart';

class NewsFragment extends StatelessWidget {
  static const String roueName = "NewsFragment";
  CategoryItem? categoryItem;
  NewsFragment({this.categoryItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          FutureBuilder<SourcesResponse>(
              future: ApiManager.getSources(categoryItem!.id),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                var data = snapshot.data;
                if (data?.status == "error") {
                  return Center(
                    child: Text(
                      data!.message.toString(),
                    ),
                  );
                }
                var sources = data?.sources;
                return SourcesTabs(sources!);
              }),
        ],
      ),
    );
  }
}
