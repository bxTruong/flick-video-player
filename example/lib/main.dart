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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
                      additionalFeature: [
                    OptionModel(
                        icon: Icons.hd, onPressFeature: () {}, name: 'Quality')
                  ])),
              FlickVideoPlayer(
                  flickManager: FlickManager(
                videoPlayerController: VideoPlayerController.network(
                    "https://vod-progressive.akamaized.net/exp=1686914012~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F3132%2F29%2F740663286%2F3417898039.mp4~hmac=011db32911d92febb64f0d1546631e79254cee456af2bf499c35077f07abd95f/vimeo-prod-skyfire-std-us/01/3132/29/740663286/3417898039.mp4"),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
