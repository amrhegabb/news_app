import 'package:news_app/model/sourcesResponse.dart';

class NewsResponse {
  final String? status;
  final int? totalResults;
  String? code;
  String? message;
  final List<News>? NewsList;
  NewsResponse(
      {this.status, this.totalResults, this.NewsList, this.code, this.message});
  NewsResponse copyWith(
      {String? status, int? totalResults, List<News>? articles}) {
    return NewsResponse(
        status: status ?? this.status,
        totalResults: totalResults ?? this.totalResults,
        NewsList: articles ?? this.NewsList);
  }

  Map<String, Object?> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles':
          NewsList?.map<Map<String, dynamic>>((data) => data.toJson()).toList()
    };
  }

  static NewsResponse fromJson(Map<String, Object?> json) {
    return NewsResponse(
        status: json['status'] == null ? null : json['status'] as String,
        code: json['code'] == null ? null : json['code'] as String,
        message: json['message'] == null ? null : json['message'] as String,
        totalResults:
            json['totalResults'] == null ? null : json['totalResults'] as int,
        NewsList: json['articles'] == null
            ? null
            : (json['articles'] as List)
                .map<News>(
                    (data) => News.fromJson(data as Map<String, Object?>))
                .toList());
  }

  @override
  String toString() {
    return '''NewsResponse(
                status:$status,
totalResults:$totalResults,
articles:${NewsList.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is NewsResponse &&
        other.runtimeType == runtimeType &&
        other.status == status &&
        other.totalResults == totalResults &&
        other.NewsList == NewsList;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, status, totalResults, NewsList);
  }
}

class News {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  const News(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});
  News copyWith(
      {Source? source,
      String? author,
      String? title,
      String? description,
      String? url,
      String? urlToImage,
      String? publishedAt,
      String? content}) {
    return News(
        source: source ?? this.source,
        author: author ?? this.author,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        urlToImage: urlToImage ?? this.urlToImage,
        publishedAt: publishedAt ?? this.publishedAt,
        content: content ?? this.content);
  }

  Map<String, Object?> toJson() {
    return {
      'source': source?.toJson(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content
    };
  }

  static News fromJson(Map<String, Object?> json) {
    return News(
        source: json['source'] == null
            ? null
            : Source.fromJson(json['source'] as Map<String, Object?>),
        author: json['author'] == null ? null : json['author'] as String,
        title: json['title'] == null ? null : json['title'] as String,
        description:
            json['description'] == null ? null : json['description'] as String,
        url: json['url'] == null ? null : json['url'] as String,
        urlToImage:
            json['urlToImage'] == null ? null : json['urlToImage'] as String,
        publishedAt:
            json['publishedAt'] == null ? null : json['publishedAt'] as String,
        content: json['content'] == null ? null : json['content'] as String);
  }

  @override
  String toString() {
    return '''Articles(
                source:${source.toString()},
author:$author,
title:$title,
description:$description,
url:$url,
urlToImage:$urlToImage,
publishedAt:$publishedAt,
content:$content
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is News &&
        other.runtimeType == runtimeType &&
        other.source == source &&
        other.author == author &&
        other.title == title &&
        other.description == description &&
        other.url == url &&
        other.urlToImage == urlToImage &&
        other.publishedAt == publishedAt &&
        other.content == content;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, source, author, title, description, url,
        urlToImage, publishedAt, content);
  }
}
