import 'package:flutter/material.dart';
import 'package:projectcaju/modules/worlds/views/widgets/card_world_widget.dart';

class ListViewWorlds extends StatelessWidget {
  final List<dynamic> regularWorlds;

  const ListViewWorlds({super.key, required this.regularWorlds});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: false,
        itemCount: regularWorlds.length,
        itemBuilder: (context, index) {
          final world = regularWorlds[index];
          return CardWorld(
            flag: world.location ?? 'flag',
            titleServer: world.name ?? '',
            serverStatusImage: world.status ?? '',
            pvpType: world.pvpType ?? '',
            playersOnline: world.playersOnline.toString(),
          );
        },
      ),
    );
  }
}
