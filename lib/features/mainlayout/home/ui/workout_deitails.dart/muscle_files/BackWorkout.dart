import 'package:fitness_app/features/mainlayout/home/ui/workout_deitails.dart/PlayerScreen/PlayerScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../../core/colors_manager.dart';
import '../../../../../../core/fonts_manager.dart';
class Backworkout extends StatefulWidget {
  const Backworkout({super.key, required this.appbar});
  final String appbar;
  @override
  State<Backworkout> createState() => _BackworkoutState();
}

class _BackworkoutState extends State<Backworkout> {
  final videourls=[
    "https://www.youtube.com/shorts/z-lxcsIN4T4",
    "https://www.youtube.com/shorts/vfKwjT5-86k",
    "https://www.youtube.com/shorts/bcaNXuEKPCI",
    "https://www.youtube.com/shorts/FeERX9UwspY",
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
        final videoId = YoutubePlayer.convertUrlToId(videourls[index]) ?? "";
        return InkWell(
          onTap: (){
            Navigator.push(context, CupertinoPageRoute(builder: (_)=> PLayerScreen(videoId: videoId!)));
          },
          child: Image.network(YoutubePlayer.getThumbnail(videoId: videoId)),
        );
      }, separatorBuilder: (context,index)=> SizedBox(height: 10.h,), itemCount: videourls.length),
    );
  }
}
