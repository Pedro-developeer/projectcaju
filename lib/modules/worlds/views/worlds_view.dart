import 'package:flutter/material.dart';
import 'package:projectcaju/core/constants/styles_font_constants.dart';
import 'package:projectcaju/core/themes/colors.dart';
import 'package:projectcaju/modules/news/strings/news_strings.dart';
import 'package:projectcaju/modules/worlds/views/controllers/worlds_controller.dart';
import 'package:projectcaju/modules/worlds/views/widgets/card_world_widget.dart';
import 'package:projectcaju/modules/worlds/views/widgets/lisview_worlds.dart';
import 'package:projectcaju/modules/worlds/views/widgets/tile_player_secondary.dart';
import 'package:projectcaju/modules/worlds/views/widgets/tile_player_world.dart';
import 'package:projectcaju/modules/worlds/strings/world_string.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WorldsView extends StatefulWidget {
  const WorldsView({super.key});

  @override
  State<WorldsView> createState() => _HomeViewState();
}

class _HomeViewState extends State<WorldsView> {
  late WorldsController controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<WorldsController>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await controller.getWorldsApi();
      } catch (error) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(WorldsStrings.worldErrorString)),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Skeletonizer(
        enabled: context.watch<WorldsController>().isLoading,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.colorBackground,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: AppColors.appBarBackground,
            title: Text(
              WorldsStrings.appBarTitle,
              style: StylesFontConstants.title,
            ),
          ),

          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                TilePlayerWorld(
                  title: WorldsStrings.numberOfPlayer,
                  subtitle:
                      controller.worldModel.worlds?.playersOnline.toString() ??
                      '0',
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TilePlayerWordSecondary(
                      title: WorldsStrings.recordPlayers,
                      subtitle:
                          controller.worldModel.worlds?.recordPlayers
                              .toString() ??
                          '0',
                    ),
                    TilePlayerWordSecondary(
                      title: WorldsStrings.numberOfWorlds,
                      subtitle:
                          controller.worldModel.worlds?.regularWorlds.length
                              .toString() ??
                          '0',
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ListViewWorlds(
                  regularWorlds:
                      controller.worldModel.worlds?.regularWorlds ?? [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
