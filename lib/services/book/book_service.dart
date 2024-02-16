import 'dart:convert';

import 'package:arteriaapp/models/dto/book_model.dart';
import 'package:arteriaapp/models/dto/google_book_model.dart';
import 'package:get/get.dart';

import 'package:arteriaapp/repository/i_book_repository.dart';
import 'package:arteriaapp/services/db.dart';
import 'package:http/http.dart' as http;

class BookService extends IBookRepository {
  Database db = Get.find<Database>();

  @override
  Future<List<GoogleBookModel>> getGoogleBooks(String query) async {
    try {
      final response = await http.get(
        Uri.parse("https://www.googleapis.com/books/v1/volumes?q=$query&maxResults=39"),
      );

      var books = <GoogleBookModel>[];
      if (response.statusCode == 200) {
        ((jsonDecode(response.body))['items'] as List<dynamic>?)?.forEach((item) {
          books.add(GoogleBookModel.fromJson(item));
        });
      }
      return books;
    } catch (ex) {
      return [];
    }
  }

  @override
  Future<List<BookModel>> getFavoriteBooks() async {
    try {
      var books = await db.getBooks();
      return books;
    } catch (ex) {
      return [];
    }
  }

  @override
  Future<bool> createBook(BookModel book) async {
    try {
      await db.createBook(book);
      return true;
    } catch (ex) {
      return false;
    }
  }

  @override
  Future<bool> removeBook(String bookId) async {
    try {
      var result = await db.removeBook(bookId);
      return result;
    } catch (ex) {
      return false;
    }
  }
}
