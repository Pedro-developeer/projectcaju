// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';
import 'package:projectcaju/core/constants/image_constants.dart';
import 'package:projectcaju/core/constants/styles_font_constants.dart';
import 'package:projectcaju/core/themes/colors.dart';
import 'package:projectcaju/modules/news/strings/news_strings.dart';
import 'package:projectcaju/modules/news/views/controller/news_controller.dart';
import 'package:projectcaju/modules/worlds/controllers/worlds_controller.dart';
import 'package:projectcaju/modules/worlds/views/widgets/card_world_widget.dart';
import 'package:projectcaju/modules/worlds/views/widgets/tile_player_secondary.dart';
import 'package:projectcaju/modules/worlds/views/widgets/tile_player_world.dart';
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
        print('Error: $error');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(NewsStrings.newsErrorString)),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<NewsController>().isLoading;

    return SafeArea(
      child: Skeletonizer(
        enabled: isLoading,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: AppColors.appBarBackground,
            title: Text('Worlds', style: StylesFontConstants.title),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  TilePlayerWorld(
                    title: 'Number of players online',
                    subtitle:
                        controller.worldModel.worlds?.playersOnline
                            .toString() ??
                        '0',
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TilePlayerWordSecondary(
                        title: 'Record players',
                        subtitle:
                            controller.worldModel.worlds?.recordPlayers
                                .toString() ??
                            '0',
                      ),
                      TilePlayerWordSecondary(
                        title: 'Number of worlds',
                        subtitle:
                            controller.worldModel.worlds?.regularWorlds.length
                                .toString() ??
                            '0',
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        controller.worldModel.worlds?.regularWorlds.length,
                    itemBuilder: (context, index) {
                      return CardWorld(
                        flag: '🇧🇷',
                        titleServer:
                            controller
                                .worldModel
                                .worlds
                                ?.regularWorlds[index]
                                .name ??
                            '',
                        serverStatusImage: ImagesConstants.online,
                        pvpType:
                            controller
                                .worldModel
                                .worlds
                                ?.regularWorlds[index]
                                .pvpType ??
                            '',
                        playersOnline:
                            controller
                                .worldModel
                                .worlds
                                ?.regularWorlds[index]
                                .playersOnline
                                .toString() ??
                            '',
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
