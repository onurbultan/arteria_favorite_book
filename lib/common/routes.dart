import 'package:fluro/fluro.dart';
import 'route_handlers.dart';

class Routes {
  static const home = '/home';
  static const favorite = '/favorite';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = notFoundHandler;

    router.define(home, handler: homeHandler, transitionType: TransitionType.fadeIn);
    router.define(favorite, handler: favoriteHandler, transitionType: TransitionType.fadeIn);
  }
}
