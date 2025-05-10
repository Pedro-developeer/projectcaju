import 'package:flutter/material.dart';
import 'package:projectcaju/core/constants/padding_constants.dart';
import 'package:projectcaju/core/constants/styles_font_constants.dart';
import 'package:projectcaju/core/themes/colors.dart';
import 'package:projectcaju/modules/home/routes/home_routes.dart';
import 'package:projectcaju/modules/news/strings/news_strings.dart';
import 'package:projectcaju/modules/news/views/controller/news_controller.dart';
import 'package:projectcaju/modules/news/views/web_view.dart';
import 'package:projectcaju/modules/news/views/widgets/tiker_flag.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final String title = args['title'] ?? '';
    final String date = args['date'] ?? '';
    final String url = args['url'] ?? '';
    final String tickerTitle = args['tickerTitle'] ?? '';
    return SafeArea(
      child: Skeletonizer(
        enabled: context.watch<NewsController>().isLoading,
        child: Scaffold(
          appBar: AppBar(
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TickerFlag(title: tickerTitle),
                    const SizedBox(width: 10),
                    Text(date, style: StylesFontConstants.contentSecondary),
                  ],
                ),
                SizedBox(height: 30),
                Text(title, style: StylesFontConstants.content),
                Spacer(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: SizedBox(
                      width: 360,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonColorBackground,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            NewsRoutes.webView,
                            arguments: WebViewArguments(url: url),
                          );
                        },
                        child: Text(
                          NewsStrings.newsDetailsTitleBtnString,
                          style: StylesFontConstants.titleButton,
                        ),
                      ),
                    ),
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
