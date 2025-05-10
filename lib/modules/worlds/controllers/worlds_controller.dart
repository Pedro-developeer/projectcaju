import 'package:flutter/material.dart';
import 'package:projectcaju/modules/worlds/models/tibia_worlds_model.dart';

import 'package:projectcaju/modules/worlds/services/worlds_service.dart';

class WorldsController extends ChangeNotifier {
  final WorldsService worldsService;
  WorldsController({required this.worldsService});

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void changeIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  TibiaWorlds _worldModel = TibiaWorlds();
  TibiaWorlds get worldModel => _worldModel;
  void changeWorldModel(TibiaWorlds value) {
    _worldModel = value;
    notifyListeners();
  }

  Future<TibiaWorlds> getWorldsApi() async {
    try {
      changeIsLoading(true);
      final TibiaWorlds news = await worldsService.getWorlds();
      changeWorldModel(news);
      changeIsLoading(false);
      return news;
    } catch (e) {
      rethrow;
    } finally {
      changeIsLoading(false);
    }
  }
}
