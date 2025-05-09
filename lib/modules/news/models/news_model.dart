class NewsModel {
  final List<News>? news;
  final Information? information;

  NewsModel({
    this.news,
    this.information,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      news: (json['news'] as List).map((e) => News.fromJson(e)).toList(),
      information: Information.fromJson(json['information']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'news': news!.map((e) => e.toJson()).toList(),
      'information': information!.toJson(),
    };
  }
}

class News {
  final int id;
  final String date;
  final String news;
  final String category;
  final String type;
  final String url;
  final String urlApi;

  News({
    required this.id,
    required this.date,
    required this.news,
    required this.category,
    required this.type,
    required this.url,
    required this.urlApi,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      date: json['date'],
      news: json['news'],
      category: json['category'],
      type: json['type'],
      url: json['url'],
      urlApi: json['url_api'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'news': news,
      'category': category,
      'type': type,
      'url': url,
      'url_api': urlApi,
    };
  }
}

class Information {
  final Api api;
  final String timestamp;
  final List<String> tibiaUrls;
  final Status status;

  Information({
    required this.api,
    required this.timestamp,
    required this.tibiaUrls,
    required this.status,
  });

  factory Information.fromJson(Map<String, dynamic> json) {
    return Information(
      api: Api.fromJson(json['api']),
      timestamp: json['timestamp'],
      tibiaUrls: (json['tibia_urls'] as List).map((e) => e.toString()).toList(),
      status: Status.fromJson(json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'api': api.toJson(),
      'timestamp': timestamp,
      'tibia_urls': tibiaUrls,
      'status': status.toJson(),
    };
  }
}

class Api {
  final int version;
  final String release;
  final String commit;

  Api({
    required this.version,
    required this.release,
    required this.commit,
  });

  factory Api.fromJson(Map<String, dynamic> json) {
    return Api(
      version: json['version'],
      release: json['release'],
      commit: json['commit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'release': release,
      'commit': commit,
    };
  }
}

class Status {
  final int httpCode;

  Status({
    required this.httpCode,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      httpCode: json['http_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'http_code': httpCode,
    };
  }
}