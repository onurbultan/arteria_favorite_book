import 'package:arteriaapp/screens/favorite/bloc/favorite_bloc.dart';
import 'package:arteriaapp/screens/home/bloc/home_bloc.dart';
import 'package:arteriaapp/simple_bloc_observer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart' hide Trans;
import 'package:arteriaapp/common/app_theme.dart';
import 'package:arteriaapp/common/routes.dart';
import 'package:arteriaapp/init_getx.dart';
import 'package:arteriaapp/services/db.dart';
import 'package:isar/isar.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  Bloc.observer = const SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initGetxDependencies();
  await initializeDb();
  start();
}

void start() {
  var localizedApp = EasyLocalization(
      path: 'assets/translations',
      useOnlyLangCode: true,
      supportedLocales: const [Locale('en', '')],
      fallbackLocale: const Locale('en', ''),
      child: const ArteriaApp());
  runApp(localizedApp);
}

Future<void> initializeDb() async {
  await Isar.initializeIsarCore(download: true);
  final appDir = await getApplicationDocumentsDirectory();
  await Get.find<Database>().open(appDir.path);
}

class ArteriaApp extends StatefulWidget {
  const ArteriaApp({super.key});

  @override
  State<ArteriaApp> createState() => _ArteriaAppState();
}

class _ArteriaAppState extends State<ArteriaApp> {
  static late FluroRouter router;
  String? initialRoute;

  _ArteriaAppState() {
    router = FluroRouter();
    Routes.configureRoutes(router);
    initialRoute = Routes.home;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FavoriteBloc>(
          create: (BuildContext context) => FavoriteBloc()..add(FavoriteStarted()),
        ),
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc()..add(HomeStarted()),
        ),
      ],
      child: KeyboardVisibilityProvider(
        child: OverlaySupport(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Favorite Book App',
            theme: AppTheme.getThemeData(),
            initialRoute: initialRoute,
            onGenerateRoute: router.generator,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          ),
        ),
      ),
    );
  }
}
