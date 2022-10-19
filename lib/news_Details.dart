import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";
import 'package:news_app/my_date_Utills.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/newsResponse.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = "NewsDetails";

  @override
  Widget build(BuildContext context) {
    News news = ModalRoute.of(context)!.settings.arguments as News;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.cover),
          color: Colors.white),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("NewsApp"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage ?? "",
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const Divider(
                thickness: 3,
              ),
              Text(
                news.source!.name ?? "",
                style: Theme.of(context).textTheme.caption,
                textAlign: TextAlign.start,
              ),
              Text(
                news.title ?? "",
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.start,
              ),
              Text(
                MyDateUtils.formateNewsDate(news.publishedAt ?? ""),
                style: Theme.of(context).textTheme.caption,
                textAlign: TextAlign.end,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Text(
                      news.description ?? "",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: (() {
                        launchInBrowser(Uri.parse(news.url ?? ""));
                      }),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "View Full Article",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const Icon(
                            Icons.arrow_right_sharp,
                            size: 25,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
