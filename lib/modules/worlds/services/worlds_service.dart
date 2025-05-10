import 'dart:convert';
import 'package:projectcaju/modules/worlds/models/tibia_worlds_model.dart';
import 'package:projectcaju/modules/worlds/repositories/worlds_repository.dart';

class WorldsService {
  final WorldsRepository worldsRepository;

  WorldsService({required this.worldsRepository});

  Future<TibiaWorlds> getWorlds() async {
    try {
      final Map<String, dynamic> response = jsonDecode(
        await worldsRepository.getWorlds(),
      );

      return TibiaWorlds.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
