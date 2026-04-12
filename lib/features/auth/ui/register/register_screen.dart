import 'package:fitness_app/core/SharedWidgets/CustomTextFormField.dart';
import 'package:fitness_app/core/SharedWidgets/CustomeTextButton.dart';
import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/core/fonts_manager.dart';
import 'package:fitness_app/core/images_manager.dart';
import 'package:fitness_app/features/auth/ui/register/RegisterItemsUi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Padding(
          padding:  REdgeInsets.all(8.0),
          child: Icon(CupertinoIcons.arrow_left,color: ColorsManager.white,
            weight: 20.w,
          ),
        )),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Registeritemsui(),
    );
  }
}