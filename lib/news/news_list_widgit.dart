import 'package:flutter/material.dart';
import 'package:news_app/apiManager.dart';
import 'package:news_app/model/newsResponse.dart';
import 'package:news_app/model/sourcesResponse.dart';
import 'package:news_app/news/newsWidgit.dart';

class NewsList extends StatelessWidget {
  Source source;
  NewsList(this.source);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySource(sourceId: source.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var data = snapshot.data;
          if (data?.code == "error") {
            return Center(child: Text("${data?.message}"));
          }
          return ListView.separated(
            itemBuilder: (context, index) {
              return NewsWidgit(data!.NewsList![index]);
            },
            itemCount: data!.NewsList!.length,
            separatorBuilder: (context, index) => const Divider(
              thickness: 3,
            ),
          );
        },
      ),
    );
  }
}
