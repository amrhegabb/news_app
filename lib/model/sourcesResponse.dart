class SourcesResponse {
  final String? status;
  final List<Source>? sources;
  String? code;
  String? message;
  SourcesResponse({this.status, this.sources, this.code, this.message});
  SourcesResponse copyWith({String? status, List<Source>? sources}) {
    return SourcesResponse(
        status: status ?? this.status, sources: sources ?? this.sources);
  }

  Map<String, Object?> toJson() {
    return {
      'status': status,
      'sources':
          sources?.map<Map<String, dynamic>>((data) => data.toJson()).toList()
    };
  }

  static SourcesResponse fromJson(Map<String, Object?> json) {
    return SourcesResponse(
        status: json['status'] == null ? null : json['status'] as String,
        sources: json['sources'] == null
            ? null
            : (json['sources'] as List)
                .map<Source>(
                    (data) => Source.fromJson(data as Map<String, Object?>))
                .toList(),
        code: json['code'] == null ? null : json['code'] as String,
        message: json['message'] == null ? null : json['message'] as String);
  }

  @override
  String toString() {
    return '''SourcesResponse(
                status:$status,
sources:${sources.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is SourcesResponse &&
        other.runtimeType == runtimeType &&
        other.status == status &&
        other.sources == sources;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, status, sources);
  }
}

class Source {
  final String? id;
  final String? name;
  final String? description;
  final String? url;
  final String? category;
  final String? language;
  final String? country;
  const Source(
      {this.id,
      this.name,
      this.description,
      this.url,
      this.category,
      this.language,
      this.country});
  Source copyWith(
      {String? id,
      String? name,
      String? description,
      String? url,
      String? category,
      String? language,
      String? country}) {
    return Source(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        url: url ?? this.url,
        category: category ?? this.category,
        language: language ?? this.language,
        country: country ?? this.country);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'url': url,
      'category': category,
      'language': language,
      'country': country
    };
  }

  static Source fromJson(Map<String, Object?> json) {
    return Source(
        id: json['id'] == null ? null : json['id'] as String,
        name: json['name'] == null ? null : json['name'] as String,
        description:
            json['description'] == null ? null : json['description'] as String,
        url: json['url'] == null ? null : json['url'] as String,
        category: json['category'] == null ? null : json['category'] as String,
        language: json['language'] == null ? null : json['language'] as String,
        country: json['country'] == null ? null : json['country'] as String);
  }

  @override
  String toString() {
    return '''Sources(
                id:$id,
name:$name,
description:$description,
url:$url,
category:$category,
language:$language,
country:$country
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Source &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.url == url &&
        other.category == category &&
        other.language == language &&
        other.country == country;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, id, name, description, url, category, language, country);
  }
}
