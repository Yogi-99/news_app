import 'dart:convert';

class Source {
  final String id;
  final String name;
  final String description;
  final String url;
  final String category;
  final String language;
  final String country;

  Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  Source copyWith({
    String id,
    String name,
    String description,
    String url,
    String category,
    String language,
    String country,
  }) {
    return Source(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      url: url ?? this.url,
      category: category ?? this.category,
      language: language ?? this.language,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'url': url,
      'category': category,
      'language': language,
      'country': country,
    };
  }

  factory Source.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return Source(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      url: map['url'],
      category: map['category'],
      language: map['language'],
      country: map['country'],
    );
  }

  @override
  String toString() {
    return 'Source(id: $id, name: $name, description: $description, url: $url, category: $category, language: $language, country: $country)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Source &&
        o.id == id &&
        o.name == name &&
        o.description == description &&
        o.url == url &&
        o.category == category &&
        o.language == language &&
        o.country == country;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        url.hashCode ^
        category.hashCode ^
        language.hashCode ^
        country.hashCode;
  }
}
