import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/Home/sourecsTabs.dart';
import 'package:news_app/apiManager.dart';
import 'package:news_app/model/sourcesResponse.dart';

class NewsFragment extends StatelessWidget {
  static const String roueName = "NewsFragment";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News App",
        ),
      ),
      body: Column(
        children: [
          FutureBuilder<SourcesResponse>(
              future: ApiManager.getSources(),
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
