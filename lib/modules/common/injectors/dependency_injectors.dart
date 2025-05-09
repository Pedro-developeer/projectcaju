
import 'package:flutter/widgets.dart';
import 'package:projectcaju/modules/common/controllers/common_controller.dart';
import 'package:projectcaju/modules/common/repositories/common_repository.dart';
import 'package:projectcaju/modules/common/services/common_service.dart';
import 'package:provider/provider.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({
    super.key,
    required this.child,
  });

  // Repositories

  Provider get _commonRepository {
    return Provider<CommonRepository>(
      create: (context) => CommonRepository(),
      lazy: true,
    );
  }

  // Services

  Provider get _commonService {
    return Provider<CommonService>(
      create: (context) => CommonService(
        commonRepository: context.read<CommonRepository>(),
      ),
    );
  }

  // Controllers

  ChangeNotifierProvider get _commonController {
    return ChangeNotifierProvider<CommonController>(
      create: (context) => CommonController(
       commonService:  context.read<CommonService>(),
      ),
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