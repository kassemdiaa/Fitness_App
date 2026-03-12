import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness_app/features/mainlayout/articles/Articlerecommendation.dart';
import 'package:fitness_app/features/mainlayout/articles/Logic/Data/UserRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/RoutesManager.dart';
import '../../../../core/colors_manager.dart';
import '../../../../core/fonts_manager.dart';
import '../Logic/Data/Cubit/news_cubit.dart';
import '../articlesSlider.dart';

class ArticleItem extends StatefulWidget {
  const ArticleItem({super.key});

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  int currentIndex = 0;
  final Userrepo repo = Userrepo();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (context) => NewsCubit(repo: repo)..getNews(),
      child: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              if (state is NewsLoading) {
                return SizedBox(
                  height: 400.h,
                  child: Center(child: CircularProgressIndicator(color: ColorsManager.Lemon)),
                );
              }
              if (state is NewsError) {
                return Center(
                  child: Text("Error in fetching Data",
                      style: FontsStyles.hookNewsDetailes.copyWith(color: ColorsManager.red)),
                );
              }
              if (state is NewsLoaded) {
                final articles = state.repo?.articles ?? [];
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
                        viewportFraction: 0.7,
                        enlargeCenterPage: true,
                        onPageChanged: (index, _) => setState(() => currentIndex = index),
                      ),
                    ),
                    Padding(
                      padding: REdgeInsets.all(16.0),
                      child: Text("Recommendation", style: FontsStyles.HomeWelcome.copyWith(color: ColorsManager.white),
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics:  NeverScrollableScrollPhysics(),
                      itemCount: articles.length,
                      separatorBuilder: (context, index) => SizedBox(height: 15.h),
                      itemBuilder: (context, index) {
                        final item = articles[index];
                        return Articlerecommendation(item: item);
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