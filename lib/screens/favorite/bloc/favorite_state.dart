part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteState extends Equatable {
  const FavoriteState();
}

final class FavoriteLoading extends FavoriteState {
  @override
  List<Object> get props => [];
}

final class FavoriteLoaded extends FavoriteState {
  const FavoriteLoaded({required this.books});

  final List<BookModel> books;

  @override
  List<Object> get props => [BookModel];
}

final class BookRemoving extends FavoriteState {
  @override
  List<Object> get props => [];
}

final class BookRemoved extends FavoriteState {
  @override
  List<Object> get props => [];
}
