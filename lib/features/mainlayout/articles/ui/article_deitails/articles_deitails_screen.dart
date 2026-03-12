import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/core/fonts_manager.dart'; // Fixed import position
import 'package:fitness_app/features/mainlayout/articles/Logic/Data/News_Responses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlesDeitailsScreen extends StatefulWidget {
  final Articles articles;
  const ArticlesDeitailsScreen({super.key, required this.articles});

  @override
  State<ArticlesDeitailsScreen> createState() => _ArticlesDeitailsScreenState();
}

class _ArticlesDeitailsScreenState extends State<ArticlesDeitailsScreen> {
  Future<void> _launchUrl() async {
    final String urlString = widget.articles.url ?? "";
    if (urlString.isEmpty) return;
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Could not launch article link")),
        );
      }
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
                  child: CircleAvatar(
                    backgroundColor: ColorsManager.black.withOpacity(0.3),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios_new, color: ColorsManager.white, size: 20),
                    ),
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
                  Divider(color: ColorsManager.lightBlue.withOpacity(0.5), height: 30.h),
                  Text(
                    widget.articles.description ?? "", style: FontsStyles.newsDetailes.copyWith(
                    color: ColorsManager.white
                  )
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    widget.articles.content ?? " ",
                    style: FontsStyles.newsDetailes.copyWith(
                      color: ColorsManager.white,
                      height: 1.6,
                    ),
                  ),
                  if (widget.articles.url != null && widget.articles.url!.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsManager.Lemon,
                            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                          ),
                          onPressed: _launchUrl,
                          child: Text(
                            "Read Full Article",
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