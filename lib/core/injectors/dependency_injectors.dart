import 'package:flutter/widgets.dart';
import 'package:projectcaju/modules/character/repositories/character_repository.dart';
import 'package:projectcaju/modules/character/services/character_service.dart';
import 'package:projectcaju/modules/character/view/controllers/character_controller.dart';
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

  Provider get _newsRepository {
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

  Provider get _characterRepository {
    return Provider<CharacterRepository>(
      create: (context) => CharacterRepository(),
      lazy: true,
    );
  }

  // Services

  Provider get _newsService {
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

  Provider get _characterService {
    return Provider<CharacterService>(
      create:
          (context) => CharacterService(
            characterRepository: context.read<CharacterRepository>(),
          ),
    );
  }

  // Controllers

  ChangeNotifierProvider get _newsController {
    return ChangeNotifierProvider<NewsController>(
      create:
          (context) => NewsController(newsService: context.read<NewsService>()),
    );
  }

  ChangeNotifierProvider get _worldsController {
    return ChangeNotifierProvider<WorldsController>(
      create:
          (context) =>
              WorldsController(worldsService: context.read<WorldsService>()),
    );
  }

  ChangeNotifierProvider get _characterController {
    return ChangeNotifierProvider<CharacterController>(
      create:
          (context) => CharacterController(
            characterService: context.read<CharacterService>(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Repositories
        _newsRepository,
        _worldsRepository,
        _characterRepository,

        // Services
        _newsService,
        _worldsService,
        _characterService,

        // Controllers
        _newsController,
        _worldsController,
        _characterController,
      ],
      child: child,
    );
  }
}
