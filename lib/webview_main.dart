import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebViewExample(),
    );
  }
}

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late WebViewController controller;

  Future<void> _handleDeepLink(String url) async {
    // Parse the URL and navigate to the appropriate page in your app
    // Example: navigate to a specific screen based on the deep link
    // Navigator.pushNamed(context, '/yourDeepLinkPage', arguments: url);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            // if (!request.isMainFrame) {
            //   return NavigationDecision.prevent;
            // }
            // print("request :.. ${request.url} ${request.isMainFrame}");
            // if (request.url.contains('concung.com')) {
            //   // Prevent navigation to the Con Cung app
            //   print("request :.. ${request.url} ${request.isMainFrame}");
            //   //controller.loadRequest(Uri.parse(request.url));
            //   _handleDeepLink(request.url);
            //   return NavigationDecision.prevent;
            // }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://dl.thanh-1122.duckdns.org'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
