part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

final class FavoriteStarted extends FavoriteEvent {
  @override
  List<Object> get props => [];
}

final class FavoriteBookRemove extends FavoriteEvent {
  const FavoriteBookRemove(this.item);

  final BookModel item;

  @override
  List<Object> get props => [item];
}
