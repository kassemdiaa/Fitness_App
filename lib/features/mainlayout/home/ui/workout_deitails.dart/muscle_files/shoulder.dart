import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/features/mainlayout/home/ui/workout_deitails.dart/PlayerScreen/PlayerScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../../core/fonts_manager.dart';

class ShoulderWorkout extends StatefulWidget {
  const ShoulderWorkout({super.key,required this.appbar});
  final String appbar;

  @override
  State<ShoulderWorkout> createState() => _ShoulderWorkoutState();
}

class _ShoulderWorkoutState extends State<ShoulderWorkout> {
  final videourls=[
    "https://www.youtube.com/shorts/xDt3VzkSsl8",
    "https://www.youtube.com/shorts/0ey9IwaXy_M",
    "https://www.youtube.com/shorts/k6tzKisR3NY",
    "https://www.youtube.com/shorts/lYH24HZr0zU",
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
