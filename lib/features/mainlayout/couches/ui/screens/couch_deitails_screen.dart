import 'package:fitness_app/core/RoutesManager.dart';
import 'package:fitness_app/core/SharedWidgets/CustomeTextButton.dart';
import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/data/models/couches_models/couch_model.dart';
import 'package:fitness_app/features/mainlayout/couches/logic/providers/selected_couch_provider.dart';
import 'package:fitness_app/features/mainlayout/couches/ui/widgets/budget_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CouchDeitailsScreen extends StatelessWidget {
  const CouchDeitailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CouchModel couch = context.read<SelectedCouchProvider>().selectedCouch;
    return Scaffold(
      backgroundColor: ColorsManager.Purple,

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 50.w),
              Container(
                width: 200.w,
                height: 200.h,
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: ColorsManager.pink, width: 4.w),
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(100.r),
                  child: Image.asset(couch.imagePath, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                couch.name,
                style: GoogleFonts.montserratAlternates(
                  color: ColorsManager.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                '180 cm',
                style: GoogleFonts.montserratAlternates(
                  color: ColorsManager.lightGray,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '62 KG',
                style: GoogleFonts.montserratAlternates(
                  color: ColorsManager.lightGray,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12.w),
              Row(
                children: [
                  Text(
                    'Description',
                    style: GoogleFonts.montserratAlternates(
                      color: ColorsManager.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                couch.bio,
                style: GoogleFonts.montserratAlternates(
                  color: ColorsManager.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.h,),
              BudgetView(couch: couch,),
              SizedBox(height: 20.h,),
              CustomElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, RoutesManager.couchTranformationsScreen);
                },
                title: 'See Transformations',
                backgroundColor: ColorsManager.lightPurple,
                foregroundColor: ColorsManager.white,
              ),
              SizedBox(height: 8.h,),
              CustomElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, RoutesManager.paymentScreen);
                },
                title: 'Subscribe',
                backgroundColor: ColorsManager.lightPurple,
                foregroundColor: ColorsManager.white,
              ),
              SizedBox(height: 40.h,)
            ],
          ),
        ),
      ),
    );
  }
}
