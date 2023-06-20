import 'package:flick_video_player_custom/flick_video_player_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'play_toggle.dart';

class LandscapePlayerControls extends StatelessWidget {
  const LandscapePlayerControls({Key? key, this.iconSize = 24, this.fontSize = 14}) : super(key: key);
  final double iconSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return FlickShowControlsAction(
      child: FlickAutoHideChild(
        child: Stack(
          children: <Widget>[
            FlickSeekVideoAction(
              child: Center(
                child: FlickVideoBuffer(
                  child: FlickAutoHideChild(isTransparent: true, showIfVideoNotInitialized: false, child: LandscapePlayToggle()),
                ),
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              FlickCurrentPosition(
                                fontSize: fontSize,
                              ),
                              Text(
                                ' / ',
                                style: TextStyle(color: Colors.white, fontSize: fontSize),
                              ),
                              FlickTotalDuration(
                                fontSize: fontSize,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: iconSize / 2,
                          ),
                          FlickSoundToggle(
                            size: iconSize,
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          FlickSubtitleToggle(
                            size: iconSize,
                          ),
                          SizedBox(
                            width: iconSize / 2,
                          ),
                          FlickFullScreenToggle(
                            size: iconSize,
                          ),
                        ],
                      ),
                    ),
                    FlickVideoProgressBar(
                      flickProgressBarSettings: FlickProgressBarSettings(
                        height: 10,
                        handleRadius: 8,
                        padding: const EdgeInsets.all(8),
                        backgroundColor: Colors.white24,
                        bufferedColor: Colors.white38,
                        getPlayedPaint: ({double? handleRadius, double? height, double? playedPart, double? width}) {
                          return Paint()
                            ..shader = LinearGradient(colors: [Color.fromRGBO(108, 165, 242, 1), Color.fromRGBO(97, 104, 236, 1)], stops: [0.0, 0.5])
                                .createShader(
                              Rect.fromPoints(
                                Offset(0, 0),
                                Offset(width!, 0),
                              ),
                            );
                        },
                        getHandlePaint: ({double? handleRadius, double? height, double? playedPart, double? width}) {
                          return Paint()
                            ..shader = RadialGradient(
                              colors: [
                                Color.fromRGBO(97, 104, 236, 1),
                                Color.fromRGBO(97, 104, 236, 1),
                                Colors.white,
                              ],
                              stops: [0.0, 0.4, 0.5],
                              radius: 0.4,
                            ).createShader(
                              Rect.fromCircle(
                                center: Offset(playedPart!, height! / 2),
                                radius: handleRadius!,
                              ),
                            );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 16,
              top: 10,
              child: const FlickBtnSetting(),
            ),
          ],
        ),
      ),
    );
  }
}
