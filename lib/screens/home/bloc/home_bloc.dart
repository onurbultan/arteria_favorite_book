import 'dart:async';
import 'dart:convert';

import 'package:arteriaapp/models/dto/book_model.dart';
import 'package:arteriaapp/models/dto/google_book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:arteriaapp/repository/i_book_repository.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoading()) {
    on<HomeStarted>(initHomePage);
    on<BookSearching>(searchGoogleBooks);
    on<BookAdd>(addFavoriteBook);
    on<BookRemove>(removeFavoriteBook);
  }
  var bookService = Get.find<IBookRepository>();

  List<GoogleBookModel> books = [];
  List<BookModel> favoriteBooks = [];

  Future<void> initHomePage(HomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    await getFavoriteBooks();
    emit(HomeLoaded(books: books));
  }

  Future<void> getFavoriteBooks() async {
    var fBooks = await bookService.getFavoriteBooks();
    favoriteBooks = fBooks;
    var bookList = books
        .map((gBook) => GoogleBookModel(
            id: gBook.id,
            volumeInfo: gBook.volumeInfo,
            isFavorite: favoriteBooks.any((book) => book.bookId == gBook.id)))
        .toList();
    books = bookList;
  }

  Future<void> searchGoogleBooks(BookSearching event, Emitter<HomeState> emit) async {
    if (event.query.length > 500) {
      emit(SearchTermExceeded());
      emit(HomeLoaded(books: books));
    } else {
      emit(HomeLoading());
      var googleBooks = await bookService.getGoogleBooks(event.query);
      var bookList = googleBooks
          .map((gBook) => GoogleBookModel(
              id: gBook.id,
              volumeInfo: gBook.volumeInfo,
              isFavorite: favoriteBooks.any((book) => book.bookId == gBook.id)))
          .toList();
      books = bookList;
      emit(HomeLoaded(books: books));
    }
  }

  Future<void> addFavoriteBook(BookAdd event, Emitter<HomeState> emit) async {
    emit(BookAdding());
    var result = await bookService.createBook(
      BookModel(
          bookId: event.item.id,
          title: event.item.volumeInfo.title,
          publisher: event.item.volumeInfo.publisher,
          authors: event.item.volumeInfo.authors,
          addedDate: DateTime.now(),
          description: event.item.volumeInfo.description,
          pageCount: event.item.volumeInfo.pageCount,
          publishedDate: event.item.volumeInfo.publishedDate,
          imageLinks: event.item.volumeInfo.imageLinks != null ? json.encode(event.item.volumeInfo.imageLinks) : null),
    );
    await getFavoriteBooks();
    if (result) books.firstWhere((element) => element.id == event.item.id).isFavorite = true;
    emit(BookAdded());
  }

  Future<void> removeFavoriteBook(BookRemove event, Emitter<HomeState> emit) async {
    emit(HomePageBookRemoving());
    var result = await bookService.removeBook(event.item.id);
    await getFavoriteBooks();
    if (result) books.firstWhere((element) => element.id == event.item.id).isFavorite = false;
    emit(HomePageBookRemoved());
  }
}
