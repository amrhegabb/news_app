import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/newsResponse.dart';
import 'package:news_app/model/sourcesResponse.dart';

class ApiManager {
  static const String BASE_URL = "newsapi.org";
  static const String API_KEY = "1e8853852e444154ade08772679a51f1";

  static Future<SourcesResponse> getSources(String categoryid) async {
    var uri = Uri.https(
      BASE_URL,
      "/v2/top-headlines/sources",
      {"apiKey": API_KEY, "category": categoryid},
    );
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  static Future<NewsResponse> getNewsBySource(
      {String? sourceId, String? query}) async {
    var uri = Uri.https(BASE_URL, "/v2/everything",
        {"apiKey": API_KEY, "sources": sourceId, 'q': query});
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}
