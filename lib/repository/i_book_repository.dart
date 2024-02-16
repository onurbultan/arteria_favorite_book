import 'package:arteriaapp/models/dto/book_model.dart';
import 'package:arteriaapp/models/dto/google_book_model.dart';

abstract class IBookRepository {
  Future<List<GoogleBookModel>> getGoogleBooks(String query);
  Future<List<BookModel>> getFavoriteBooks();
  Future<bool> createBook(BookModel book);
  Future<bool> removeBook(String bookId);
}
