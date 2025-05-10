import 'package:flutter/material.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';
import 'package:projectcaju/core/constants/image_constants.dart';
import 'package:projectcaju/core/constants/styles_font_constants.dart';
import 'package:projectcaju/core/themes/colors.dart';
import 'package:projectcaju/modules/news/strings/news_strings.dart';
import 'package:projectcaju/modules/news/views/controller/news_controller.dart';
import 'package:projectcaju/modules/news/views/widgets/list_view_news.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _HomeViewState();
}

class _HomeViewState extends State<NewsView> {
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
            const SnackBar(content: Text(NewsStrings.newsErrorString)),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<NewsController>().isLoading;
    final developmentNews = controller.getDevelopmentNews();
    final communityNews = controller.getCommunityNews();
    final technicalNews = controller.getTechnicalNews();

    return SafeArea(
      child: Skeletonizer(
        enabled: isLoading,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: AppColors.appBarBackground,
            title: Text(
              NewsStrings.newsTitleString,
              style: StylesFontConstants.title,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image(
                    image: AssetImage(ImagesConstants.imageAvatarSearch),
                    height: 160,
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Search for a user’s avatar'),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ListNewsSection(
                        icon: MingCuteIcons.mgc_code_line,
                        title: 'Development News',
                        newsList: developmentNews,
                        isLoading: isLoading,
                        controller: controller,
                      ),
                      ListNewsSection(
                        icon: MingCuteIcons.mgc_group_3_line,
                        title: 'Community News',
                        newsList: communityNews,
                        isLoading: isLoading,
                        controller: controller,
                      ),
                      ListNewsSection(
                        icon: MingCuteIcons.mgc_terminal_box_line,
                        title: 'Technical News',
                        newsList: technicalNews,
                        isLoading: isLoading,
                        controller: controller,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
