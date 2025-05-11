import 'package:flutter/widgets.dart';
import 'package:projectcaju/modules/news/repositories/news_repository.dart';
import 'package:projectcaju/modules/news/services/news_service.dart';
import 'package:projectcaju/modules/news/views/controller/news_controller.dart';
import 'package:projectcaju/modules/worlds/views/controllers/worlds_controller.dart';
import 'package:projectcaju/modules/worlds/repositories/worlds_repository.dart';
import 'package:projectcaju/modules/worlds/services/worlds_service.dart';

import 'package:provider/provider.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({super.key, required this.child});

  // Repositories

  Provider get _commonRepository {
    return Provider<NewsRepository>(
      create: (context) => NewsRepository(),
      lazy: true,
    );
  }

  Provider get _worldsRepository {
    return Provider<WorldsRepository>(
      create: (context) => WorldsRepository(),
      lazy: true,
    );
  }

  // Services

  Provider get _commonService {
    return Provider<NewsService>(
      create:
          (context) =>
              NewsService(newsRepository: context.read<NewsRepository>()),
    );
  }

  Provider get _worldsService {
    return Provider<WorldsService>(
      create:
          (context) =>
              WorldsService(worldsRepository: context.read<WorldsRepository>()),
    );
  }

  // Controllers

  ChangeNotifierProvider get _commonController {
    return ChangeNotifierProvider<NewsController>(
      create:
          (context) =>
              NewsController(commonService: context.read<NewsService>()),
    );
  }

  ChangeNotifierProvider get _worldsController {
    return ChangeNotifierProvider<WorldsController>(
      create:
          (context) =>
              WorldsController(worldsService: context.read<WorldsService>()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Repositories
        _commonRepository,
        _worldsRepository,

        // Services
        _commonService,
        _worldsService,

        // Controllers
        _commonController,
        _worldsController,
      ],
      child: child,
    );
  }
}
