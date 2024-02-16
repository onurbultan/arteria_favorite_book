import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_book_info.g.dart';

@JsonSerializable()
class GoogleBookInfo extends Equatable {
  const GoogleBookInfo({
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.description,
    this.imageLinks,
    this.pageCount,
    this.publishedDate,
    this.rawPublishedDate,
  });

  final String? title;
  final String? subtitle;
  final List<String>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? rawPublishedDate;
  final String? description;
  final int? pageCount;
  final Map<String, String>? imageLinks;

  GoogleBookInfo copyWith({
    String? title,
    String? subtitle,
    List<String>? authors,
    String? publisher,
    String? publishedDate,
    String? rawPublishedDate,
    String? description,
    int? pageCount,
    int? ratingsCount,
    Map<String, String>? imageLinks,
  }) {
    return GoogleBookInfo(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      authors: authors ?? this.authors,
      publisher: publisher ?? this.publisher,
      publishedDate: publishedDate ?? this.publishedDate,
      rawPublishedDate: rawPublishedDate ?? this.rawPublishedDate,
      description: description ?? this.description,
      pageCount: pageCount ?? this.pageCount,
      imageLinks: imageLinks ?? this.imageLinks,
    );
  }

  factory GoogleBookInfo.fromJson(Map<String, dynamic> json) {
    return _$GoogleBookInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GoogleBookInfoToJson(this);
  }

  @override
  List<Object?> get props => [
        title,
        subtitle,
        authors,
        publisher,
        publishedDate,
        rawPublishedDate,
        description,
        pageCount,
        imageLinks,
      ];
}
