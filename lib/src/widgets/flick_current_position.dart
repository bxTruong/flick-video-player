import 'package:flick_video_player_custom/flick_video_player_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Returns a text widget with current position of the video.
class FlickCurrentPosition extends StatelessWidget {
  const FlickCurrentPosition({
    Key? key,
    this.fontSize,
    this.color,
  }) : super(key: key);

  final double? fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    FlickVideoManager videoManager = Provider.of<FlickVideoManager>(context);

    return Text(
      videoManager.getDurationConvert(
          position: videoManager.isKeepValueVideo
              ? videoManager.nextVideoAutoPlayDuration
              : null,
          durationDefault: videoManager.videoPlayerValue?.position),
      style: TextStyle(
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
