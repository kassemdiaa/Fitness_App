import 'package:fitness_app/core/RoutesManager.dart';
import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/core/fonts_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Logic/Data/News_Responses.dart';
class Articlesslider extends StatelessWidget {
  final double widthy;
  final double heighty;
  final Articles article;
  const Articlesslider({
    super.key,
    this.widthy = 180,
    this.heighty = 270,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesManager.articlesdetailes, arguments: article,);
      },
      child: Stack(
        children: [
          Container(
            width: widthy,
            height: heighty,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.r),
              image: DecorationImage(
                image: NetworkImage(article.urlToImage ?? "https://via.placeholder.com/150"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: widthy,
            height: heighty,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, ColorsManager.grey.withOpacity(0.7)],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Text(article.title?? " ",style: FontsStyles.hookNewsDetailes.copyWith(
              color: ColorsManager.white
            ),),
          ),
        ],
      ),
    );
  }
}