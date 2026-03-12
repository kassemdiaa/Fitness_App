import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/mainlayout/articles/Logic/Data/News_Responses.dart';
import 'package:fitness_app/features/mainlayout/articles/Logic/Data/UserRepo.dart';
import 'package:meta/meta.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final Userrepo repo;
  NewsCubit({required this.repo}) : super(NewsInitial());

  Future<void> getNews() async {
    emit(NewsLoading());
    try {
      final response = await repo.fetchData();
      if (response != null) {
        emit(NewsLoaded(repo: response));
      } else {
        emit(NewsError(error: "Empty data received"));
      }
    } catch (e) {
      emit(NewsError(error: e.toString()));
    }
  }
}