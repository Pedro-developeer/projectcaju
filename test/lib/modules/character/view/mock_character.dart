import 'package:projectcaju/modules/character/models/character_model.dart';

CharacterModel mockCharacterModel() {
  return CharacterModel.fromJson({
    "character": {
      "character": <String, dynamic>{
        "name": "Pedro Presto Mage",
        "sex": "male",
        "title": "None",
        "unlocked_titles": 3,
        "vocation": "Elite Knight",
        "level": 60,
        "achievement_points": 4,
        "world": "Ferobra",
        "residence": "Thais",
        "guild": <String, dynamic>{},
        "last_login": "2025-04-27T19:54:21Z",
        "account_status": "Premium Account"
      },
      "account_information": <String, dynamic>{
        "created": "2022-07-31T22:05:31Z",
        "loyalty_title": "Scout of Tibia"
      },
      "other_characters": [
        <String, dynamic>{
          "name": "Abatedor de Porco",
          "world": "Honbra",
          "status": "offline",
          "deleted": true,
          "main": false,
          "traded": false
        }
      ]
    },
    "information": <String, dynamic>{
      "api": <String, dynamic>{
        "version": 4,
        "release": "4.4.0",
        "commit": "4f71bc22309fabcf31882cf69240cf26a6fcc19f"
      },
      "timestamp": "2025-05-12T21:52:40Z",
      "tibia_urls": [
        "https://www.tibia.com/community/?subtopic=characters&name=Pedro+Presto+Mage"
      ],
      "status": <String, dynamic>{
        "http_code": 200
      }
    }
  });
}