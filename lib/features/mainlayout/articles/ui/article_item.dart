import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness_app/features/mainlayout/articles/Logic/Data/UserRepo.dart';
import 'package:fitness_app/features/mainlayout/articles/ui/article_deitails/articles_deitails_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/RoutesManager.dart';
import '../../../../core/colors_manager.dart';
import '../../../../core/fonts_manager.dart';
import '../Logic/Data/Cubit/news_cubit.dart';
import '../Logic/Data/News_Responses.dart';
import 'article_deitails/articlesSlider.dart';
class ArticleItem extends StatefulWidget {
  const ArticleItem({super.key});

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  int currentIndex = 0;
  final Userrepo repo = Userrepo();
  final NewsResponses newsResponses = NewsResponses();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (context) => NewsCubit(repo: repo)..getNews(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                if (state is NewsLoading) {
                  return SizedBox(child: Center(child: CircularProgressIndicator(color: ColorsManager.Lemon)),);
                }
                if (state is NewsError) {
                  return Center(
                    child: Text("Error in fetching Data",
                        style: FontsStyles.hookNewsDetailes.copyWith(color: ColorsManager.red)),
                  );
                }
                if (state is NewsLoaded) {
                  final articles = state.repo?.articles?? [];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider.builder(
                        itemCount: articles.length > 9 ? 9 : articles.length,
                        itemBuilder: (context, index, realIndex) {
                          return Articlesslider(
                            article: articles[index],
                            heighty: 351.h,
                            widthy: 220.w,
                          );
                        },
                        options: CarouselOptions(
                          height: 351.h,
                          viewportFraction: 0.6,
                          enlargeCenterPage: true,
                          onPageChanged: (index, _) => setState(() => currentIndex = index),
                        ),
                      ),
                      Padding(
                        padding: REdgeInsets.all(16.0),
                        child: Text("Recommendation",
                          style: FontsStyles.HomeWelcome.copyWith(color: ColorsManager.white),
                        ),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: articles.length,
                        separatorBuilder: (context, index) => SizedBox(height: 15.h),
                        itemBuilder: (context, index) {
                          final item = articles[index];
                          return ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: Image.network(
                                item.urlToImage ?? "https://via.placeholder.com/150",
                                width: 60.w,
                                height: 60.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(item.title ?? "", maxLines: 4,
                              style: const TextStyle(color: ColorsManager.white),
                            ),
                            subtitle: Text(item.source?.name ?? "",
                              style: TextStyle(color: ColorsManager.Lemon),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, RoutesManager.articlesdetailes,
                                arguments: item,
                              );
                            },
                          );
                        },
                      ),
                    ],
                  );
                }
                return  SizedBox();
              },
            ),
          ),
        ),
    );
  }
}