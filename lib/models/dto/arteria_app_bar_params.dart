import 'package:freezed_annotation/freezed_annotation.dart';

part 'arteria_app_bar_params.freezed.dart';

@freezed
class ArteriaAppBarParams with _$ArteriaAppBarParams {
  const factory ArteriaAppBarParams.home(String title) = HomeParams;
  const factory ArteriaAppBarParams.favorite(String title) = FavoriteParams;
}
