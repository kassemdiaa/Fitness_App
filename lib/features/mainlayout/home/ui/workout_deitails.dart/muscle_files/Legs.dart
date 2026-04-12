import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/core/fonts_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../PlayerScreen/PlayerScreen.dart';

class LegsWorkout extends StatefulWidget {
  const LegsWorkout({super.key, required this.appbar});
  final String appbar;
  @override
  State<LegsWorkout> createState() => _LegsWorkoutState();
}

class _LegsWorkoutState extends State<LegsWorkout> {
  final videoUrls = [
    'https://youtube.com/shorts/MLoZuAkIyZI?si=mXzs9lj19xaS7X8N',
    'https://www.youtube.com/shorts/uODWo4YqbT8',
    'https://www.youtube.com/watch?v=IZxyjW7MPJQ',
    'https://www.youtube.com/watch?v=QOVaHwm-Q6U',
    "https://www.youtube.com/shorts/1BUL0N0sDWc"
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new,color: ColorsManager.white,size: 18,)),
        title: Text(widget.appbar,style: FontsStyles.AppBar.copyWith(color: ColorsManager.white,fontSize: 20.sp),),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView.separated(
        itemCount: videoUrls.length,
        itemBuilder: (context, index) {
          final videoID = YoutubePlayer.convertUrlToId(videoUrls[index]);
          return InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PLayerScreen(videoId: videoID)));
              },
              child:
              Image.network(YoutubePlayer.getThumbnail(videoId: videoID!)));
        }, separatorBuilder: (BuildContext context, int index)=> SizedBox(height: 10.h,),
      ),
    );
  }
}