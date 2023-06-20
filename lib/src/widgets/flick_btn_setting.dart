import 'package:flick_video_player_custom/flick_video_player_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlickBtnSetting extends StatelessWidget {
  /// Size for the default icons.
  final double? size;

  /// Color for the default icons.
  final Color? color;

  /// Padding around the visible child.
  final EdgeInsetsGeometry? padding;

  /// Decoration around the visible child.
  final Decoration? decoration;

  const FlickBtnSetting({Key? key, this.size, this.color, this.decoration, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlickVideoManager flickVideoManager = Provider.of<FlickVideoManager>(context);
    return GestureDetector(
      onTap: () => onPressSetting(context, flickVideoManager),
      child: Container(
        padding: padding,
        decoration: decoration,
        child: Icon(
          Icons.more_horiz,
          size: size ?? 30,
          color: color ?? Colors.white,
        ),
      ),
    );
  }

  void onPressSetting(BuildContext context, FlickVideoManager flickVideoManager) => showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SettingSheet(featureList: flickVideoManager.optionList));
}
