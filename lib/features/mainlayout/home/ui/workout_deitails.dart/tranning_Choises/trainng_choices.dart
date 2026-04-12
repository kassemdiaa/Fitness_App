import 'package:fitness_app/core/RoutesManager.dart';
import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/core/fonts_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrainngChoices extends StatefulWidget {
  const TrainngChoices({super.key, required this.ontap, required this.item, required this.time});
  final VoidCallback ontap;
  final String item;
  final String time;

  @override
  State<TrainngChoices> createState() => _TrainngChoicesState();
}
class _TrainngChoicesState extends State<TrainngChoices> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          color: ColorsManager.Iceblue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:  REdgeInsets.all(7.0),
              child: Text(widget.time, style: FontsStyles.HomeWelcome),
            ),
            Text(" |", style: TextStyle(color: ColorsManager.grey,fontSize: 28.sp)),
            SizedBox(width: 10.w),
            Text(widget.item, style: FontsStyles.HomeWelcome),
            Spacer(),
            IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.check_mark_circled_solid, color: ColorsManager.green, size: 22.sp,), ),
            SizedBox(width: 10.w),
          ],
        ),
      ),
    );
  }
}