import 'package:fitness_app/core/RoutesManager.dart';
import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/core/fonts_manager.dart';
import 'package:fitness_app/features/mainlayout/home/ui/workout_deitails.dart/muscle_files/BackWorkout.dart';
import 'package:fitness_app/features/mainlayout/home/ui/workout_deitails.dart/muscle_files/Chest.dart';
import 'package:fitness_app/features/mainlayout/home/ui/workout_deitails.dart/muscle_files/Legs.dart';
import 'package:fitness_app/features/mainlayout/home/ui/workout_deitails.dart/tranning_Choises/trainng_choices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class WorkoutDeitailsScreen extends StatefulWidget {
  WorkoutDeitailsScreen({super.key,});

  @override
  State<WorkoutDeitailsScreen> createState() => _WorkoutDeitailsScreenState();
}

class _WorkoutDeitailsScreenState extends State<WorkoutDeitailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: ColorsManager.white,)),
        title: Text("Daily Goals",style: FontsStyles.AppBar.copyWith(
          color: ColorsManager.white,
        ),),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:  REdgeInsets.all(18.0),
                child: TrainngChoices(ontap: (){
                  Navigator.push(context,CupertinoPageRoute(builder: (_)=> LegsWorkout(appbar: "LegsWorkout")));
                }, item: "Legs Workouts", time: '00:00',),
              ),
              Padding(
                padding:  REdgeInsets.all(18.0),
                child: TrainngChoices(ontap: (){
                  Navigator.push(context,CupertinoPageRoute(builder: (_)=> ChestWorkout(appbar:'ChestWorkout',)));
                }, item: " ChestWorkouts", time: '00:00',),
              ),
              Padding(
                padding:  REdgeInsets.all(18.0),
                child: TrainngChoices(ontap: (){
                  Navigator.push(context,CupertinoPageRoute(builder: (_)=> Backworkout(appbar:'BackWorkouts',)));
                }, item: " BackWorkouts", time: '00:00',),
              ),
              Padding(
                padding:  REdgeInsets.all(18.0),
                child: TrainngChoices(ontap: (){
                  // Navigator.push(context,CupertinoPageRoute(builder: (_)=> PracticeItem(target_muscle:'Biceps Workouts',)));
                }, item: " Biceps Workouts", time: '00:00',),
              ),
              Padding(
                padding:  REdgeInsets.all(18.0),
                child: TrainngChoices(ontap: (){
                  // Navigator.push(context,CupertinoPageRoute(builder: (_)=> PracticeItem(target_muscle:'Triceps Workouts',)));
                }, item: " Triceps Workouts", time: '00:00',),
              ),
              Padding(
                padding:  REdgeInsets.all(18.0),
                child: TrainngChoices(ontap: (){
                  // Navigator.push(context,CupertinoPageRoute(builder: (_)=> PracticeItem(target_muscle:'Triceps Workouts',)));
                }, item: " Shoulder Workouts", time: '00:00',),
              ),
            ],
          ),
        ),
      ),
    );
  }
}