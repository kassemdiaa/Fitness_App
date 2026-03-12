import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/features/mainlayout/articles/Logic/Data/News_Responses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart'; // Import this

import '../../../../../core/fonts_manager.dart';

class ArticlesDeitailsScreen extends StatefulWidget {
  final Articles articles;
  const ArticlesDeitailsScreen({super.key, required this.articles});

  @override
  State<ArticlesDeitailsScreen> createState() => _ArticlesDeitailsScreenState();
}

class _ArticlesDeitailsScreenState extends State<ArticlesDeitailsScreen> {
  Future<void> _launchUrl() async
  {
    final Uri url = Uri.parse(widget.articles.content ?? "");
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not launch article link")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  widget.articles.urlToImage ?? "https://via.placeholder.com/150",
                  width: double.infinity,
                  height: 300.h,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40.h,
                  left: 10.w,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios, color: ColorsManager.white),
                  ),
                ),
              ],
            ),
            Padding(
              padding: REdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.articles.title ?? " ",
                    style: FontsStyles.Entermail.copyWith(color: ColorsManager.white),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "By ${widget.articles.author ?? "Unknown"}",
                    style: FontsStyles.homeChoicesandDetailes.copyWith(
                      color: ColorsManager.lightBlue,
                      fontSize: 16.sp,
                    ),
                  ),
                  Divider(color: ColorsManager.lightBlue, height: 30),
                  Text(
                    widget.articles.description ?? "",
                    style: TextStyle(color: ColorsManager.white, fontSize: 14.sp, fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    widget.articles.content ?? " ",
                    style: FontsStyles.newsDetailes.copyWith(
                      color: ColorsManager.white,
                      height: 1.6,
                    ),
                  ),
                  if (widget.articles.url != null)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsManager.Lemon,
                            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
                          ),
                          onPressed: _launchUrl,
                          child: Text("Read Full Article",
                            style: TextStyle(color: ColorsManager.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}