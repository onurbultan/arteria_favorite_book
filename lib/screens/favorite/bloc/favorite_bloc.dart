import 'package:arteriaapp/models/dto/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:arteriaapp/repository/i_book_repository.dart';
part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteLoading()) {
    on<FavoriteStarted>(initFavoritePage);
    on<FavoriteBookRemove>(removeFavoriteBook);
  }
  var bookService = Get.find<IBookRepository>();

  List<BookModel> favoriteBooks = [];

  Future<void> initFavoritePage(FavoriteEvent event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    await getFavoriteBooks();
    emit(const FavoriteLoaded(books: []));
  }

  Future<void> getFavoriteBooks() async {
    var fBooks = await bookService.getFavoriteBooks();
    favoriteBooks = fBooks;
  }

  Future<void> removeFavoriteBook(FavoriteBookRemove event, Emitter<FavoriteState> emit) async {
    emit(BookRemoving());
    await bookService.removeBook(event.item.bookId);
    await getFavoriteBooks();
    emit(BookRemoved());
  }
}
