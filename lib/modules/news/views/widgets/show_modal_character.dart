import 'package:flutter/material.dart';
import 'package:projectcaju/core/constants/styles_font_constants.dart';
import 'package:projectcaju/core/themes/colors.dart';
import 'package:projectcaju/modules/character/routes/character_routes.dart';
import 'package:projectcaju/modules/character/view/character_view.dart';

Future<void> showModalSearchCharacter({
  required BuildContext context,
  required Future<dynamic> Function(String name) getCharacterByName,
}) async {
  String inputText = '';
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.colorBackgroundSecondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        title: Text(
          'Enter a username',
          style: StylesFontConstants.titleButtonSecondary,
        ),
        content: Container(
          color: AppColors.colorBackgroundSecondary,
          child: TextField(
            onChanged: (value) {
              inputText = value;
            },
            decoration: InputDecoration(
              hintText: "Username",
              filled: true,
              fillColor: AppColors.colorBackground,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonColorBackground,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            ),
            onPressed: () async {
              try {
                final characterModel = await getCharacterByName(inputText);
                Navigator.of(context).pushNamed(
                  CharacterRoutes.character,
                  arguments: CharacterArguments(characterModel: characterModel),
                );
              } catch (e) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Character dont found!',
                      style: StylesFontConstants.titleButton,
                    ),
                  ),
                );
              }
            },
            child: Text("Confirm", style: StylesFontConstants.titleButton),
          ),
        ],
      );
    },
  );
}
