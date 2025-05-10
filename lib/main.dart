import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projectcaju/core/injectors/dependency_injectors.dart';
import 'package:projectcaju/core/themes/themes.dart';
import 'package:projectcaju/modules/news/routes/news_routes.dart';
import 'package:projectcaju/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const DependencyInjector(child: ProjectApp()));
}

final navigatorKey = GlobalKey<NavigatorState>();

class ProjectApp extends StatefulWidget {
  const ProjectApp({super.key});

  @override
  State<ProjectApp> createState() => _ProjectAppState();
}

class _ProjectAppState extends State<ProjectApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      title: 'title',
      theme: AppTheme.light,
      initialRoute: _getInitRoute,
      onGenerateRoute: Routes.generate,
      navigatorKey: navigatorKey,
      supportedLocales: const [Locale('pt', 'BR')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }

  String get _getInitRoute {
    return NewsRoutes.news;
  }
}
