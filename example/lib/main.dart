import 'package:flutter/material.dart';
import 'package:flick_video_player_custom/flick_video_player_custom.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flick video player custom'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlickVideoPlayer(
                  flickManager: FlickManager(
                      videoPlayerController: VideoPlayerController.network(
                          "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
                      additionalOptions: [
                    OptionModel(
                        icon: Icons.hd, onPressFeature: () {}, name: 'Quality')
                  ])),
              FlickVideoPlayer(
                  flickManager: FlickManager(
                videoPlayerController: VideoPlayerController.network(
                    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4"),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
