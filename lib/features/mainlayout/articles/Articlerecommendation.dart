import 'package:fitness_app/features/mainlayout/articles/Logic/Data/News_Responses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/RoutesManager.dart';
import '../../../core/colors_manager.dart';

class Articlerecommendation extends StatefulWidget {
   Articlerecommendation({super.key, required this.item});
  final Articles item;
  @override
  State<Articlerecommendation> createState() => _ArticlerecommendationState();
}

class _ArticlerecommendationState extends State<Articlerecommendation> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Image.network(widget.item.urlToImage ?? "https://via.placeholder.com/150",
          width: 70.w,
          height: 90.w,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(widget.item.title ?? "", maxLines: 2,
        style: TextStyle(color: ColorsManager.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(widget.item.source?.name ?? "",
        style: TextStyle(color: ColorsManager.Lemon),
      ),
      onTap: () {
        Navigator.pushNamed(context, RoutesManager.articlesdetailes, arguments: widget.item,);
      },
    );
  }
}
