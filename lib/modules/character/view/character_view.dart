import 'package:flutter/material.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';
import 'package:projectcaju/core/constants/image_constants.dart';
import 'package:projectcaju/core/constants/padding_constants.dart';
import 'package:projectcaju/core/constants/styles_font_constants.dart';
import 'package:projectcaju/core/themes/colors.dart';
import 'package:projectcaju/core/themes/sizes.dart';
import 'package:projectcaju/modules/character/models/character_model.dart';
import 'package:projectcaju/modules/character/strings/character_strings.dart';
import 'package:projectcaju/modules/character/view/controllers/character_controller.dart';
import 'package:projectcaju/modules/character/view/widgets/tile_charcter_info.dart';
import 'package:provider/provider.dart';


class CharacterArguments {
  final CharacterModel? characterModel;

  CharacterArguments({required this.characterModel});
}

class CharacterView extends StatefulWidget {
  const CharacterView({super.key});

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  late CharacterController controller;
  late CharacterArguments? args;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context)!.settings.arguments as CharacterArguments;
  }

  @override
  Widget build(BuildContext context) {
    controller = context.read<CharacterController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.colorBackgroundSecondary,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.colorBackground,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: false,
          backgroundColor: AppColors.appBarBackground,
          title: Text(
            args?.characterModel?.character?.character?.name ?? CharacterStrings.undefined,
            style: StylesFontConstants.title,
          ),
        ),
        body: Padding(
          padding: StylesPaddingConstants.horizontalPage,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSizes.sizeComponents.huge),
                Center(
                  child: Image(
                    image: controller.getVocationImage(
                          vocation: args?.characterModel?.character?.character?.vocation ?? '',
                        ) ??
                        AssetImage(ImagesConstants.knight),
                    height: AppSizes.images.gigantic,
                  ),
                ),
                SizedBox(height: AppSizes.sizeComponents.huge),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_star_line,
                  info: CharacterStrings.level,
                  infoComplement: args?.characterModel?.character?.character?.level?.toString() ?? CharacterStrings.notAvailable,
                ),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_sword_line,
                  info: CharacterStrings.vocation,
                  infoComplement: args?.characterModel?.character?.character?.vocation ?? CharacterStrings.notAvailable,
                ),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_signal_line,
                  info: CharacterStrings.status,
                  infoComplement: args?.characterModel?.character?.character?.accountStatus ?? CharacterStrings.notAvailable,
                ),
                SizedBox(height: AppSizes.sizeComponents.huge),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_world_2_line,
                  info: CharacterStrings.world,
                  infoComplement: args?.characterModel?.character?.character?.world ?? CharacterStrings.notAvailable,
                ),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_location_line,
                  info: CharacterStrings.residence,
                  infoComplement: args?.characterModel?.character?.character?.residence ?? CharacterStrings.notAvailable,
                ),
                SizedBox(height: AppSizes.sizeComponents.huge),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_trophy_line,
                  info: CharacterStrings.achievement,
                  infoComplement: args?.characterModel?.character?.character?.achievementPoints?.toString() ?? CharacterStrings.notAvailable,
                ),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_key_2_line,
                  info: CharacterStrings.unlockedTitles,
                  infoComplement: args?.characterModel?.character?.character?.unlockedTitles?.toString() ?? CharacterStrings.notAvailable,
                ),
                SizedBox(height: AppSizes.sizeComponents.huge),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_male_line,
                  info: CharacterStrings.sex,
                  infoComplement: args?.characterModel?.character?.character?.sex ?? CharacterStrings.notAvailable,
                ),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_calendar_add_line,
                  info: CharacterStrings.createdOn,
                  infoComplement: args?.characterModel?.character?.accountInformation?.created ?? CharacterStrings.notAvailable,
                ),
                SizedBox(height: AppSizes.sizeComponents.huge),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_badge_line,
                  info: CharacterStrings.accountStatus,
                  infoComplement: args?.characterModel?.character?.character?.accountStatus ?? CharacterStrings.notAvailable,
                ),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_diamond_2_line,
                  info: CharacterStrings.loyaltyPoints,
                  infoComplement: args?.characterModel?.character?.accountInformation?.loyaltyTitle ?? CharacterStrings.notAvailable,
                ),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_time_line,
                  info: CharacterStrings.lastLogin,
                  infoComplement: args?.characterModel?.character?.character?.lastLogin ?? CharacterStrings.notAvailable,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
