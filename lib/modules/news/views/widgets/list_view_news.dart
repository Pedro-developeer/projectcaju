import 'package:flutter/material.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';
import 'package:projectcaju/core/constants/padding_constants.dart';
import 'package:projectcaju/core/constants/styles_font_constants.dart';
import 'package:projectcaju/modules/home/routes/home_routes.dart';
import 'package:projectcaju/modules/news/models/news_model.dart';
import 'package:projectcaju/modules/news/views/controller/news_controller.dart';
import 'package:projectcaju/modules/news/views/web_view.dart';
import 'package:projectcaju/modules/news/views/widgets/card_news.dart';

class ListNewsSection extends StatelessWidget {
  final String title;
  final List<News> newsList;
  final bool isLoading;
  final NewsController controller;
  final IconData icon;

  const ListNewsSection({
    super.key,
    required this.title,
    required this.newsList,
    required this.isLoading,
    required this.controller,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: StylesPaddingConstants.subtitle,
          child: Text(title, style: StylesFontConstants.subtitle),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: isLoading ? 10 : newsList.length,
          itemBuilder: (context, index) {
            if (isLoading) {
              return CardNews(
                title: '',
                subtitle: '',
                date: '',
                tickerTitle: '',
                icon: MingCuteIcons.mgc_bird_line,
              );
            }

            final newsItem = newsList[index];
            return CardNews(
              title: newsItem.news,
              subtitle: newsItem.category,
              date: newsItem.date,
              tickerTitle: newsItem.type,
              icon: icon,
              onTap: () {
                Navigator.of(context).pushNamed(
                  NewsRoutes.webView,
                  arguments: WebViewArguments(url: newsItem.url),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
