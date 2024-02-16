import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'book_model.g.dart';

@JsonSerializable()
@collection
class BookModel {
  Id id = Isar.autoIncrement;
  String bookId;
  String? title;
  String? subtitle;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  int? pageCount;
  String? imageLinks;
  DateTime? addedDate;

  BookModel({
    required this.bookId,
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.pageCount,
    this.imageLinks,
    this.addedDate,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return _$BookModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BookModelToJson(this);
  }
}
