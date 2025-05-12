import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:projectcaju/core/constants/padding_constants.dart';
import 'package:projectcaju/core/constants/styles_font_constants.dart';
import 'package:projectcaju/core/themes/colors.dart';
import 'package:projectcaju/core/themes/sizes.dart';
import 'package:projectcaju/modules/worlds/views/controllers/worlds_controller.dart';
import 'package:projectcaju/modules/worlds/views/widgets/lisview_worlds.dart';
import 'package:projectcaju/modules/worlds/views/widgets/tile_player_secondary.dart';
import 'package:projectcaju/modules/worlds/views/widgets/tile_player_world.dart';
import 'package:projectcaju/modules/worlds/strings/world_string.dart';
import 'package:provider/provider.dart';

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

        body:
            !context.watch<WorldsController>().isLoading
                ? Padding(
                  padding: StylesPaddingConstants.horizontalPage,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: AppSizes.sizeComponents.huge),
                      TilePlayerWorld(
                        title: WorldsStrings.numberOfPlayer,
                        subtitle:
                            controller.worldModel.worlds?.playersOnline
                                .toString() ??
                            '0',
                      ),
                      SizedBox(height: AppSizes.sizeComponents.huge),
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
                                controller
                                    .worldModel
                                    .worlds
                                    ?.regularWorlds
                                    .length
                                    .toString() ??
                                '0',
                          ),
                        ],
                      ),
                      SizedBox(height: AppSizes.sizeComponents.huge),
                      ListViewWorlds(
                        regularWorlds:
                            controller.worldModel.worlds?.regularWorlds ?? [],
                      ),
                    ],
                  ),
                )
                : Center(
                  child: LoadingAnimationWidget.inkDrop(
                    color: AppColors.fontColor,
                    size: 35,
                  ),
                ),
      ),
    );
  }
}
