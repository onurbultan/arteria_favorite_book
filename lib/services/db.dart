import 'package:arteriaapp/models/dto/book_model.dart';
import 'package:isar/isar.dart';

class Database {
  late Isar _db;
  Isar get dbInstance => _db;

  bool _isOpen = false;
  bool get isOpen => _isOpen;

  Future open(String path) async {
    _db = await Isar.open(
      [BookModelSchema],
      directory: path,
    );
    _isOpen = true;
  }

  Future close() async {
    await _db.close();
    _isOpen = false;
  }

  /// Method return the list of favorite books
  Future<List<BookModel>> getBooks() async {
    if (!_isOpen) {
      return List<BookModel>.empty();
    }

    final result = await _db.bookModels.where().findAll();
    return result;
  }

  Future<BookModel?> createBook(BookModel model) async {
    if (!_isOpen) {
      return null;
    }

    await _db.writeTxn(() async {
      _db.bookModels.put(model);
    });

    return model;
  }

  Future<bool> removeBook(String bookId) async {
    if (!_isOpen) {
      return false;
    }

    final book = await _db.bookModels.filter().bookIdEqualTo(bookId).findFirst();

    if (book != null) {
      await _db.writeTxn(() async {
        _db.bookModels.delete(book.id);
      });
      return true;
    }

    return false;
  }
}
