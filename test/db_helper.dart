import 'package:arteriaapp/models/dto/book_model.dart';
import 'package:isar/isar.dart';

class DbHelper {
  static Future populateData(Isar db) async {
    final book1 = BookModel(bookId: "123", title: "Kafka");
    await db.writeTxn(() async {
      db.bookModels.put(book1);
    });
  }

  static Future clear(Isar db) async {
    await db.writeTxn(() async {
      await db.clear();
    });
  }
}
