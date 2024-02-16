// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_book_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleBookInfo _$GoogleBookInfoFromJson(Map<String, dynamic> json) =>
    GoogleBookInfo(
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      authors:
          (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      publisher: json['publisher'] as String?,
      description: json['description'] as String?,
      imageLinks: (json['imageLinks'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      pageCount: json['pageCount'] as int?,
      publishedDate: json['publishedDate'] as String?,
      rawPublishedDate: json['rawPublishedDate'] as String?,
    );

Map<String, dynamic> _$GoogleBookInfoToJson(GoogleBookInfo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'publishedDate': instance.publishedDate,
      'rawPublishedDate': instance.rawPublishedDate,
      'description': instance.description,
      'pageCount': instance.pageCount,
      'imageLinks': instance.imageLinks,
    };
