import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
  // late WebViewController controller;

  // Future<void> _handleDeepLink(String url) async {
  //   // Parse the URL and navigate to the appropriate page in your app
  //   // Example: navigate to a specific screen based on the deep link
  //   // Navigator.pushNamed(context, '/yourDeepLinkPage', arguments: url);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // controller = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..setNavigationDelegate(
    //     NavigationDelegate(
    //       onPageStarted: (String url) {},
    //       onPageFinished: (String url) {},
    //       onWebResourceError: (WebResourceError error) {},
    //       onNavigationRequest: (NavigationRequest request) {
    //         print("request .. ${request.url}");
    //         return NavigationDecision.navigate;
    //       },
    //     ),
    //   )
    //   // https://vn.shp.ee/cWaHzBA
    //   // https://dl.thanh-1122.duckdns.org
    //   // https://vn.shp.ee/cWaHzBA
    // // https://shopee.vn/product/363428261/23662909925?d_id=f574b&uls_trackid=52529r2q00rj&utm_content=1111DpHNwp9t7g7vVb8cgrzrsq
    //   ..loadRequest(Uri.parse('https://dl.thanh-1122.duckdns.org'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            await launchUrl(
              Uri.parse("https://concung.com/sua-bot/spdd-c-thuc-icreo-learning-milk-820g-70077.html"),
              mode: LaunchMode.externalApplication,
            );
          },
          child: Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
        ),
      ),
      // body: WebViewWidget(
      //   controller: controller,
      // ),
    );
  }
}
