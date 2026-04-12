import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../../core/colors_manager.dart';
import '../../../../../../core/fonts_manager.dart';
import '../PlayerScreen/PlayerScreen.dart';

class ChestWorkout extends StatefulWidget {
  const ChestWorkout({super.key, required this.appbar});
  final String appbar;
  @override
  State<ChestWorkout> createState() => _ChestState();
}

class _ChestState extends State<ChestWorkout> {
  final videoUrls = [
  'https://www.youtube.com/shorts/ou6s32mJgjU',
  'https://www.youtube.com/shorts/uu_Fcp-KN-0',
  "https://www.youtube.com/shorts/g3T7LsEeDWQ",
  "https://www.youtube.com/shorts/x4JX_T5QAMM",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
        final videoID=  YoutubePlayer.convertUrlToId(videoUrls[index]);
        return InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PLayerScreen(videoId: videoID)));
            },
            child: Image.network(YoutubePlayer.getThumbnail(videoId: videoID!)));
      }, separatorBuilder: (context,index)=> SizedBox(height: 10.h,), itemCount: videoUrls.length),
    );
  }
}
