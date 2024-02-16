part of 'home_bloc.dart';

@immutable
sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

final class HomeLoaded extends HomeState {
  const HomeLoaded({required this.books});

  final List<GoogleBookModel> books;

  @override
  List<Object> get props => [BookModel];
}

final class HomeError extends HomeState {
  @override
  List<Object> get props => [];
}

final class BookAdding extends HomeState {
  @override
  List<Object> get props => [];
}

final class BookAdded extends HomeState {
  @override
  List<Object> get props => [];
}

final class HomePageBookRemoving extends HomeState {
  @override
  List<Object> get props => [];
}

final class HomePageBookRemoved extends HomeState {
  @override
  List<Object> get props => [];
}

final class SearchTermExceeded extends HomeState {
  @override
  List<Object> get props => [];
}
