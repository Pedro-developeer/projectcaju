import 'package:flutter/material.dart';
import 'package:projectcaju/core/constants/image_constants.dart';
import 'package:projectcaju/modules/character/services/character_service.dart';

class CharacterController extends ChangeNotifier {
  final CharacterService characterService;
  CharacterController({required this.characterService});

  AssetImage? getVocationImage({required String vocation}) {
    if (vocation.contains('Knight')) {
      return AssetImage(ImagesConstants.knight);
    } else if (vocation.contains('Sorcerer')) {
      return AssetImage(ImagesConstants.sorcerer);
    } else if (vocation.contains('Druid')) {
      return AssetImage(ImagesConstants.druid);
    } else if (vocation.contains('Monk')) {
      return AssetImage(ImagesConstants.monk);
    } else {
      return null;
    }
  }
}
