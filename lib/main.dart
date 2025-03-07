// import 'package:uni_links/uni_links.dart' as uni_links;
import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final appLinks = AppLinks(); // AppLinks is singleton
  late StreamSubscription<Uri> sub;
  String? url;

  @override
  void initState() {
    super.initState();
    initUniLinks();
  }

  Future<void> initUniLinks() async {
    try {
      var uri = await appLinks.getInitialAppLink();
      setState(() {
        url = uri?.toString();
      });
      sub = appLinks.uriLinkStream.listen((uri) {
        setState(() {
          url = uri.toString();
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Deeplink Example')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              url ?? 'Listening for deeplinks...',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
