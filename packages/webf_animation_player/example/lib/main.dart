import 'package:flutter/material.dart';
import 'package:webf/webf.dart';
import 'package:webf_animation_player/webf_animation_player.dart';
import 'dart:ui';

void main() {
  WebFAnimationPlayer.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebF Browser',
      // theme: ThemeData.dark(),
      home: MyBrowser(title: 'MyApp'),
    );
  }
}

class MyBrowser extends StatefulWidget {
  MyBrowser({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyBrowser> {
  OutlineInputBorder outlineBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 0.0),
    borderRadius: const BorderRadius.all(
      Radius.circular(20.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    WebF webf;
    final TextEditingController textEditingController = TextEditingController();

    webf = WebF(
      viewportWidth: window.physicalSize.width / window.devicePixelRatio,
      viewportHeight: window.physicalSize.height / window.devicePixelRatio -
          queryData.padding.top,
      bundle: WebFBundle.fromUrl('assets:///assets/bundle.js'),
    );

    return Scaffold(
        body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: webf));
  }
}
