import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:projectcaju/core/constants/styles_font_constants.dart';
import 'package:projectcaju/core/themes/colors.dart';
import 'package:projectcaju/core/themes/sizes.dart';
import 'package:projectcaju/modules/news/strings/news_strings.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewArguments {
  final String? url;

  WebViewArguments({required this.url});
}

class WebviewView extends StatefulWidget {
  const WebviewView({super.key});

  @override
  State<WebviewView> createState() => _WebviewViewState();
}

class _WebviewViewState extends State<WebviewView> {
  late WebViewController _controller;
  bool loading = true;
  late WebViewArguments? args;

  @override
  void initState() {
    super.initState();
    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: (String url) {
                setState(() {
                  loading = true;
                });
              },
              onPageFinished: (String url) {
                setState(() {
                  loading = false;
                });
              },
            ),
          );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context)!.settings.arguments as WebViewArguments;
    _controller.loadRequest(Uri.parse(args?.url ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.colorBackground),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: AppColors.appBarBackground,
        title: Text(NewsStrings.reader, style: StylesFontConstants.title),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (loading)
            Center(
              child: LoadingAnimationWidget.inkDrop(
                color: AppColors.fontColor,
                size: AppSizes.sizeComponents.gigantic ?? 0,
              ),
            ),
        ],
      ),
    );
  }
}
