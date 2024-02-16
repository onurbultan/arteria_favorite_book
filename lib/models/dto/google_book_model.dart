import 'package:arteriaapp/models/dto/google_book_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_book_model.g.dart';

@JsonSerializable()
class GoogleBookModel {
  GoogleBookModel({required this.id, required this.volumeInfo, this.isFavorite});

  String id;
  GoogleBookInfo volumeInfo;
  bool? isFavorite;

  GoogleBookModel copyWith({
    String? id,
    bool? isFavorite,
    GoogleBookInfo? info,
  }) {
    return GoogleBookModel(
      id: id ?? this.id,
      volumeInfo: info ?? volumeInfo,
      isFavorite: isFavorite ?? false,
    );
  }

  factory GoogleBookModel.fromJson(Map<String, dynamic> json) {
    return _$GoogleBookModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GoogleBookModelToJson(this);
  }
}
