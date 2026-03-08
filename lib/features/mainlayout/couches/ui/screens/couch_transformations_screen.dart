import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/data/models/couches_models/couch_model.dart';
import 'package:fitness_app/features/mainlayout/couches/logic/providers/selected_couch_provider.dart';
import 'package:fitness_app/features/mainlayout/couches/ui/widgets/transformation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CouchTransformationsScreen extends StatelessWidget {
  const CouchTransformationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CouchModel couch = context.read<SelectedCouchProvider>().selectedCouch;
    return Scaffold(
      backgroundColor: ColorsManager.Purple,
      body: Expanded(
        child: ListView.separated(
          itemBuilder: (context, index) => TransformationItem(couch: couch,),
          separatorBuilder: (context, index) => SizedBox(height: 14.h,),
          itemCount: couch.transformations.length,
        ),
      ),
    );
  }
}
