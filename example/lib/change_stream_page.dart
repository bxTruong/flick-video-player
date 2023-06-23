import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class VideoPlayerApp extends StatelessWidget {
  const VideoPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player Demo',
      home: Container(
          color: Colors.black,
          child: VideoPlayerScreen()),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  Future<void>? _initializeVideoPlayerFuture;
  int? _playBackTime;

  //The values that are passed when changing quality
  Duration newCurrentPosition = const Duration(milliseconds: 0);

  String defaultStream =
      'https://archive.org/download/Damas_BB_28F8B535_D_406/DaMaS.mp4';
  String stream2 = 'https://archive.org/download/cCloud_20151126/cCloud.mp4';
  String stream3 = 'https://archive.org/download/mblbhs/mblbhs.mp4';

  @override
  void initState() {
    _controller = VideoPlayerController.network(defaultStream);
    _controller.addListener(() {
      setState(() {
        _playBackTime = _controller.value.position.inSeconds;
      });
    });
    _initializeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _initializeVideoPlayerFuture = null;
    _controller.pause().then((_) {
      _controller.dispose();
    });
    super.dispose();
  }

  Future<bool> _clearPrevious() async {
    await _controller.pause();
    return true;
  }

  Future<void> _initializePlay(String videoPath) async {
    _controller = VideoPlayerController.network(videoPath);
    _controller.addListener(() {
      setState(() {
        _playBackTime = _controller.value.position.inSeconds;
      });
    });
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      _controller.seekTo(newCurrentPosition);
      _controller.play();
    });
  }

  void _getValuesAndPlay(String videoPath) {
    newCurrentPosition = _controller.value.position;
    _startPlay(videoPath);
    print(newCurrentPosition.toString());
  }

  Future<void> _startPlay(String videoPath) async {
    setState(() {
      _initializeVideoPlayerFuture = null;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      _clearPrevious().then((_) {
        _initializePlay(videoPath);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: <Widget>[
                Center(
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    // Use the VideoPlayer widget to display the video.
                    child: VideoPlayer(_controller),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.black54,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FloatingActionButton(
                              onPressed: () {
                                // Wrap the play or pause in a call to `setState`. This ensures the
                                // correct icon is shown.
                                setState(() {
                                  // If the video is playing, pause it.
                                  if (_controller.value.isPlaying) {
                                    _controller.pause();
                                  } else {
                                    // If the video is paused, play it.
                                    _controller.play();
                                  }
                                });
                              },
                              // Display the correct icon depending on the state of the player.
                              child: Icon(
                                _controller.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                              ),
                            ),
                            Text(
                              _controller.value.position
                                  .toString()
                                  .split('.')
                                  .first
                                  .padLeft(8, "0"),
                            ),

                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _getValuesAndPlay(defaultStream);
                          },
                          child: const Text('Default Stream'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _getValuesAndPlay(stream2);
                          },
                          child: const Text('Video Stream 2'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _getValuesAndPlay(stream3);

                            print('Green Button');
                          },
                          child: const Text('Video Stream 3'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}