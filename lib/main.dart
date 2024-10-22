import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart' as uni_links;
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  StreamSubscription<String>? _sub;
  String? url;

  @override
  void initState() {
    super.initState();
    initUniLinks();
  }

  Future<void> initUniLinks() async {
    try {
      _sub = uni_links.linkStream.listen((String? uri) {
        if (uri != null) {
          // Xử lý deeplink tại đây
          setState(() {
            url = uri;
          });
        }
      }) as StreamSubscription<String>?;
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
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
