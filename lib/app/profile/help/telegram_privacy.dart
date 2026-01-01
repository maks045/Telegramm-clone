import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TelegramPrivacyPolicy extends StatefulWidget {
  const TelegramPrivacyPolicy({super.key});

  @override
  State<TelegramPrivacyPolicy> createState() => _TelegramPrivacyPolicyState();
}

class _TelegramPrivacyPolicyState extends State<TelegramPrivacyPolicy> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse("https://telegram.org/privacy?setln=fa"),
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
