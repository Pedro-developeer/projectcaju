import 'package:flutter/material.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';
import 'package:projectcaju/core/constants/image_constants.dart';
import 'package:projectcaju/core/constants/styles_font_constants.dart';
import 'package:projectcaju/core/themes/colors.dart';
import 'package:projectcaju/modules/character/models/character_model.dart';
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
          centerTitle: false,
          backgroundColor: AppColors.appBarBackground,
          title: Text(
            args?.characterModel?.character?.character?.name ?? 'Undefined',
            style: StylesFontConstants.title,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Image(
                    image:
                        controller.getVocationImage(
                          vocation:
                              args
                                  ?.characterModel
                                  ?.character
                                  ?.character
                                  ?.vocation ??
                              '',
                        ) ??
                        AssetImage(ImagesConstants.knight),
                    height: 275,
                  ),
                ),
                const SizedBox(height: 30),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_star_line,
                  info: 'Level',
                  infoComplement:
                      args?.characterModel?.character?.character?.level
                          .toString() ??
                      'N/A',
                ),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_sword_line,
                  info: 'Vocation',
                  infoComplement:
                      args?.characterModel?.character?.character?.vocation ??
                      'N/A',
                ),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_signal_line,
                  info: 'Status',
                  infoComplement:
                      args
                          ?.characterModel
                          ?.character
                          ?.character
                          ?.accountStatus ??
                      'N/A',
                ),
                const SizedBox(height: 20),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_world_2_line,
                  info: 'World',
                  infoComplement:
                      args?.characterModel?.character?.character?.world ??
                      'N/A',
                ),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_location_line,
                  info: 'Residence',
                  infoComplement:
                      args?.characterModel?.character?.character?.residence ??
                      'N/A',
                ),
                const SizedBox(height: 20),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_trophy_line,
                  info: 'Achievement',
                  infoComplement:
                      args
                          ?.characterModel
                          ?.character
                          ?.character
                          ?.achievementPoints
                          .toString() ??
                      'N/A',
                ),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_key_2_line,
                  info: 'Unlocked titles',
                  infoComplement:
                      args?.characterModel?.character?.character?.unlockedTitles
                          .toString() ??
                      'N/A',
                ),
                const SizedBox(height: 20),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_male_line,
                  info: 'Sex',
                  infoComplement:
                      args?.characterModel?.character?.character?.sex ?? 'N/A',
                ),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_calendar_add_line,
                  info: 'Created on',
                  infoComplement:
                      args
                          ?.characterModel
                          ?.character
                          ?.accountInformation
                          ?.created ??
                      'N/A',
                ),
                const SizedBox(height: 20),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_badge_line,
                  info: 'Account Status',
                  infoComplement:
                      args
                          ?.characterModel
                          ?.character
                          ?.character
                          ?.accountStatus ??
                      'N/A',
                ),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_diamond_2_line,
                  info: 'Loyalty points',
                  infoComplement:
                      args
                          ?.characterModel
                          ?.character
                          ?.accountInformation
                          ?.loyaltyTitle ??
                      'N/A',
                ),
                TileCharacterInfo(
                  icon: MingCuteIcons.mgc_time_line,
                  info: 'Last login',
                  infoComplement:
                      args?.characterModel?.character?.character?.lastLogin ??
                      'N/A',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
