import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebsiteScreen extends StatefulWidget {
  const WebsiteScreen({super.key});

  @override
  State<WebsiteScreen> createState() => _WebsiteScreenState();
}

class _WebsiteScreenState extends State<WebsiteScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse("https://telegram.org/faq"),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Telegram")),
      body: WebViewWidget(controller: controller),
    );
  }
}
