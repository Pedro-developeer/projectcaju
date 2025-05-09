import 'package:flutter/widgets.dart';
import 'package:projectcaju/modules/news/repositories/news_repository.dart';
import 'package:projectcaju/modules/news/services/common_service.dart';
import 'package:projectcaju/modules/news/views/controller/news_controller.dart';

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

  // Services

  Provider get _commonService {
    return Provider<NewsService>(
      create:
          (context) =>
              NewsService(commonRepository: context.read<NewsRepository>()),
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

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Repositories
        _commonRepository,

        // Services
        _commonService,

        // Controllers
        _commonController,
      ],
      child: child,
    );
  }
}
