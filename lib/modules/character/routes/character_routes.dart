import 'package:flutter/material.dart';
import 'package:projectcaju/modules/character/view/character_view.dart';

class CharacterRoutes {
  static const String character = 'character';

  static Map<String, Widget> map = {character: const CharacterView()};
}
