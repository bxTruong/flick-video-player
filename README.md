# [**Based on Flick Video Player**](https://pub.dev/packages/flick_video_player)


# Flick Video Player Custom

Flick Video Player Custom is a video player for flutter.
The [video_player](https://pub.dev/packages/video_player) plugin gives low level access for the video playback. Flick Player wraps `video_player` under the hood and provides base architecture for developers to create their own set of UI and functionalities.

# Features Custom

* Overlay opens when touching video
* Change video speed
* More custom menu options
* Edit the slide bar interface

# Demo Mobile

![img](assets/1.jpg)

![img](assets/2.jpg)

![img](assets/3.jpg)

### Installation
Add the following dependencies in your pubspec.yaml file of your flutter project.
```dart
    flick_video_player_custom: <latest_version>
    video_player: <latest_version>
```

### How to use
Create a `FlickManager` and pass the manager to `FlickVideoPlayer`, make sure to dispose `FlickManager` after use. 
```dart 
import 'package:flutter/material.dart';
import 'package:flick_video_player_custom/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class SamplePlayer extends StatefulWidget {
  SamplePlayer({Key key}) : super(key: key);

  @override
  _SamplePlayerState createState() => _SamplePlayerState();
}

class _SamplePlayerState extends State<SamplePlayer> {
  FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
          VideoPlayerController.network("url"),
      additionalFeature: [
          OptionModel(
            icon: Icons.hd, onPressFeature: () {}, name: 'Quality')
      ]
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlickVideoPlayer(
        flickManager: flickManager
      ),
    );
  }
}
```
