import 'package:flutter/material.dart';
import 'package:projectcaju/modules/home/routes/home_routes.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomeView2 extends StatefulWidget {
  const HomeView2({super.key});

  @override
  State<HomeView2> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ShadButton(
            child: const Text('Primary'),
            onPressed: () {
              Navigator.of(context).pushNamed(NewsRoutes.news);
            },
          ),
        ],
      ),
    );
  }
}
