import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/features/mainlayout/home/ui/workout_deitails.dart/PlayerScreen/PlayerScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../../core/fonts_manager.dart';

class BiscepsWorkout extends StatefulWidget {
  const BiscepsWorkout({super.key,required this.appbar});
  final String appbar;

  @override
  State<BiscepsWorkout> createState() => _BiscepsWorkoutState();
}

class _BiscepsWorkoutState extends State<BiscepsWorkout> {
  final videourls=[
    "https://www.youtube.com/shorts/N6paU6TGFWU",
    "https://www.youtube.com/shorts/nBc15ZFg1mc",
    "https://www.youtube.com/shorts/l3U4XsKrS-0",
    "https://www.youtube.com/shorts/i2theb8jGjg",
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
