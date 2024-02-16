import 'package:arteriaapp/models/dto/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:arteriaapp/services/db.dart';
import 'package:isar/isar.dart';

import 'db_helper.dart';

void main() {
  final db = Database();

  setUp(() async {
    if (!db.isOpen) {
      await Isar.initializeIsarCore(download: true);
      await db.open(".");
      await DbHelper.populateData(db.dbInstance);
    }
  });

  tearDown(() async {
    await DbHelper.clear(db.dbInstance);
  });

  WidgetsFlutterBinding.ensureInitialized();

  test('Opening DB', () async {
    expect(db.isOpen, true);
    final book = await db.dbInstance.bookModels.get(1);
    expect(book?.id, 1);
  });

  test('Read favorite books', () async {
    final book = await db.createBook(BookModel(bookId: "123", title: "test"));

    expect(book, isNotNull);

    final books = await db.getBooks();

    expect(book?.title, "test");
    expect(books.length, 1);
  });
}
