import 'package:flutter/material.dart';
import 'package:flick_video_player_custom/flick_video_player_custom.dart';
import 'package:video_player/video_player.dart';

import 'change_stream_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  late FlickManager flickManager1;
  late FlickManager flickManager2;

  @override
  void initState() {
    super.initState();
    flickManager1 = FlickManager(
        videoPlayerController: VideoPlayerController.network(
            "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
        additionalOptions: [
          OptionModel(
              icon: Icons.hd, onPressFeature: _onPressQuality, name: 'Quality')
        ]);

    flickManager2 = FlickManager(
      videoPlayerController: VideoPlayerController.network(
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4"),
    );
  }

  @override
  void dispose() {
    flickManager1.dispose();
    flickManager2.dispose();
    super.dispose();
  }

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
              FlickVideoPlayer(flickManager: flickManager1),
              // FlickVideoPlayer(
              //   flickManager: flickManager2,
              //   flickVideoWithControls: const FlickVideoWithControls(
              //     videoFit: BoxFit.fitWidth,
              //     controls: FlickPortraitControls(),
              //   ),
              //   flickVideoWithControlsFullscreen: const FlickVideoWithControls(
              //     controls: FlickLandscapeControls(),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressQuality() async {
    Navigator.pop(context);
    Duration currentPosition = await flickManager1
            .flickVideoManager?.videoPlayerController?.position ??
        const Duration(milliseconds: 0);
    Duration? totalDurationVideo =
        flickManager1.flickVideoManager?.videoPlayerValue?.duration;
    print('ghghghghghghghghgh $totalDurationVideo');
    VideoPlayerController videoPlayerController = VideoPlayerController.network(
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4");

    flickManager1.handleChangeVideo(videoPlayerController,
        videoChangeDuration: currentPosition,
        totalDurationVideo: totalDurationVideo,
        videoPlayerValueQuality:  flickManager1.flickVideoManager?.videoPlayerValue,
        isNotChangeQuality: false);
    // await Future.delayed(Duration(milliseconds: 800));
    // await flickManager1.flickControlManager?.seekTo(duration);
    flickManager1.flickControlManager?.togglePlay();
  }
}
