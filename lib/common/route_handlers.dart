import 'package:arteriaapp/screens/favorite/favorite_page.dart';
import 'package:fluro/fluro.dart';
import 'package:arteriaapp/screens/home/home_page.dart';
import 'package:arteriaapp/screens/not_found.dart';

var notFoundHandler = Handler(handlerFunc: (context, params) {
  return const NotFound();
});

var homeHandler = Handler(handlerFunc: (context, params) {
  return const HomePage();
});

var favoriteHandler = Handler(handlerFunc: (context, params) {
  return const FavoritePage();
});
