import 'package:arteriaapp/repository/i_book_repository.dart';
import 'package:arteriaapp/services/book/book_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:arteriaapp/init_getx.dart' as init_getx;
import 'package:arteriaapp/services/db.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('init_getx', () {
    test(
      'Init Getx test',
      () async {
        await init_getx.initGetxDependencies();
        final database = Get.find<Database>();
        expect(database, isA<Database>());

        final homeState = Get.find<IBookRepository>();
        expect(homeState, isA<BookService>());

        Get.deleteAll(force: true);
      },
    );
  });
}
