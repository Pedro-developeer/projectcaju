import 'package:flutter/material.dart';
import 'package:projectcaju/modules/news/views/controller/news_controller.dart';
import 'package:projectcaju/modules/news/views/widgets/card_news.dart';

import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart' show Skeletonizer;

class HomeView1 extends StatefulWidget {
  const HomeView1({super.key});

  @override
  State<HomeView1> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView1> {
  late NewsController controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<NewsController>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await controller.getNewsTibiaApi();
      } catch (error) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Erro ao carregar notícias')),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Notícias',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'SFPro',
              ),
            ),
          ),
          body: Skeletonizer(
            
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Notícias Rápidas',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'SFPro',
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.newsModel.news!.length,
                      itemBuilder: (context, index) {
                        return CardNews(
                          title: controller.newsModel.news![index].news,
                          date: controller.newsModel.news![index].date,
                          tickerTitle: controller.newsModel.news![index].type,
                          onTap: () {},
                        );
                      },
                    ),
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
