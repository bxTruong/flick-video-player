import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class SpeedSheet extends StatefulWidget {
  final double speedSelected;
  final VideoPlayerController? videoPlayerController;

  const SpeedSheet({Key? key, required this.speedSelected, this.videoPlayerController}) : super(key: key);

  @override
  State<SpeedSheet> createState() => _SpeedSheetState();
}

class _SpeedSheetState extends State<SpeedSheet> {
  List<double> speedList = [0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      child: SafeArea(
        child: ListView.separated(
            padding: EdgeInsets.only(bottom: 8),
            shrinkWrap: true,
            itemBuilder: _itemBuilder,
            separatorBuilder: (_, __) => const SizedBox(height: 0),
            itemCount: speedList.length),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return InkWell(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Visibility(
                visible: widget.speedSelected == speedList[index],
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(Icons.done, color: Colors.black),
                ),
              ),
              Expanded(
                  child: Text(speedList[index].toString(),
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: Colors.black, fontWeight: widget.speedSelected == speedList[index] ? FontWeight.bold : FontWeight.normal)))
            ],
          ),
        ),
        onTap: () => _onPressItemQuality(speedList[index]));
  }

  void _onPressItemQuality(double value) async {
    await widget.videoPlayerController?.setPlaybackSpeed(value);
    Navigator.pop(context);
  }
}
