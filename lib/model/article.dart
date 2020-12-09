import 'dart:convert';

import 'package:news_app/model/source.dart';
import '../global/constants/months.dart';

class Article {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final Source source;

  Article({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.source,
  });

  Article copyWith(
      {String author,
      String title,
      String description,
      String url,
      String urlToImage,
      String publishedAt,
      String content,
      Source source}) {
    return Article(
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
      source: source ?? this.source,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
      'source': source.toJson()
    };
  }

  factory Article.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return Article(
      author: map['author'],
      title: map['title'],
      description: map['description'],
      url: map['url'],
      urlToImage: map['urlToImage'],
      publishedAt: map['publishedAt'],
      content: map['content'],
      source: Source.fromJson(map['source']),
    );
  }

  String toJson() => json.encode(toMap());

  DateTime get dateTime => DateTime.parse(publishedAt);

  String get formattedDateTime => '${KMonths[dateTime.month]} ${dateTime.day}';

  @override
  String toString() {
    return 'Article(author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Article &&
        o.author == author &&
        o.title == title &&
        o.description == description &&
        o.url == url &&
        o.urlToImage == urlToImage &&
        o.publishedAt == publishedAt &&
        o.content == content;
  }

  @override
  int get hashCode {
    return author.hashCode ^
        title.hashCode ^
        description.hashCode ^
        url.hashCode ^
        urlToImage.hashCode ^
        publishedAt.hashCode ^
        content.hashCode;
  }
}
