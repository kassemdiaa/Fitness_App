import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/data/models/couches_models/couch_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransformationItem extends StatelessWidget {
  const TransformationItem({super.key, required this.couch});
  final CouchModel couch;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: ColorsManager.lightPurple,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Column(children: [Row(children: [],)],),
    );
  }
}
