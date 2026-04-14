import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/features/mainlayout/home/ui/workout_deitails.dart/PlayerScreen/PlayerScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../../core/fonts_manager.dart';

class ForarmWorkout extends StatefulWidget {
  const ForarmWorkout({super.key,required this.appbar});
  final String appbar;

  @override
  State<ForarmWorkout> createState() => _ForarmWorkoutState();
}

class _ForarmWorkoutState extends State<ForarmWorkout> {
  final videourls=[
    "https://www.youtube.com/shorts/sKXqNO2KQp8",
    "https://www.youtube.com/shorts/U9pVNnMSUmI",
    "https://www.youtube.com/shorts/8x51r4C4Odc",
    "https://www.youtube.com/shorts/d5YiFNoiCa0",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new,color: ColorsManager.white,)),
        centerTitle: true,
        title: Text(widget.appbar,style: FontsStyles.AppBar.copyWith(
          color: ColorsManager.white,
        ),),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView.separated(itemBuilder: (context,index){
        final videoId= YoutubePlayer.convertUrlToId(videourls[index]);
        return InkWell(
          onTap: (){
          Navigator.push(context, CupertinoPageRoute(builder: (_)=> PLayerScreen(videoId: videoId!)));
          },child: Image.network(YoutubePlayer.getThumbnail(videoId: videoId!)),
        );
      }, separatorBuilder: (context,index)=> SizedBox(height: 10.h,), itemCount: videourls.length),
    );
  }
}
