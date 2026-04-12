import 'package:fitness_app/core/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class PLayerScreen extends StatefulWidget {
  const PLayerScreen({super.key, required this.videoId});
  final String videoId;
  @override
  State<PLayerScreen> createState() => _PLayerScreenState();
}

class _PLayerScreenState extends State<PLayerScreen> {
  late final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: widget.videoId,
    flags:  YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
    ),
  );
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorsManager.lightPurple,
          title: Text("Player")),
      body: SizedBox(
          height: double.infinity,
          child: YoutubePlayer(controller: _controller)),
    );
  }
}