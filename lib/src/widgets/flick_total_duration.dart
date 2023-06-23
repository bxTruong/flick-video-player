import 'package:flick_video_player_custom/flick_video_player_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Returns a text widget with total duration of the video.
class FlickTotalDuration extends StatelessWidget {
  const FlickTotalDuration({
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
          position: !videoManager.isNotChangeQuality
              ? videoManager.totalDurationVideoQuality
              :  videoManager.videoPlayerValue?.duration,
          durationDefault: videoManager.videoPlayerValue?.duration),
      style: TextStyle(
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
