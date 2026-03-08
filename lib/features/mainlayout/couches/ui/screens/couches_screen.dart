import 'package:fitness_app/core/RoutesManager.dart';
import 'package:fitness_app/core/SharedWidgets/CustomTextFormField.dart';
import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/data/models/couches_models/couch_model.dart';
import 'package:fitness_app/features/mainlayout/couches/logic/providers/selected_couch_provider.dart';
import 'package:fitness_app/features/mainlayout/couches/ui/widgets/couch_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CouchesScreen extends StatelessWidget {
  const CouchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.Purple,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Custometextforemfield(
              hint: 'Search',
              label: 'Search',
              color: ColorsManager.white,
              prefixIcon: CupertinoIcons.search,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    context.read<SelectedCouchProvider>().selectCouch(
                      CouchModel.couches[index],
                    );
                    Navigator.pushNamed(context, RoutesManager.couchDeitailsScreen);
                  },
                  child: CouchItem(
                    name: CouchModel.couches[index].name,
                    imagePath: CouchModel.couches[index].imagePath,
                    experience: CouchModel.couches[index].experience,
                    startPudget:
                        CouchModel.couches[index].budgets['1 Month'] ?? 1000,
                    rate: CouchModel.couches[index].rate,
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(height: 14.h),
                itemCount: CouchModel.couches.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
