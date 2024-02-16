part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

final class HomeStarted extends HomeEvent {
  @override
  List<Object> get props => [];
}

final class BookSearching extends HomeEvent {
  const BookSearching(this.query);

  final String query;

  @override
  List<Object> get props => [];
}

final class BookAdd extends HomeEvent {
  const BookAdd(this.item);

  final GoogleBookModel item;

  @override
  List<Object> get props => [item];
}

final class BookRemove extends HomeEvent {
  const BookRemove(this.item);

  final GoogleBookModel item;

  @override
  List<Object> get props => [item];
}
