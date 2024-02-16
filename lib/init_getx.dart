import 'package:get/get.dart';
import 'package:arteriaapp/repository/i_book_repository.dart';
import 'package:arteriaapp/services/db.dart';
import 'package:arteriaapp/services/book/book_service.dart';

Future<void> initGetxDependencies() async {
  Get.lazyPut(() => Database());

  //repositories
  Get.lazyPut<IBookRepository>(() => BookService());
}
