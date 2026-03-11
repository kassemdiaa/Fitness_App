part of 'news_cubit.dart';

@immutable
sealed class NewsState {}
final class NewsInitial extends NewsState {}
final class NewsLoading extends NewsState {}
final class NewsLoaded extends NewsState {
  final NewsResponses? repo;
  NewsLoaded({required this.repo});
}
final class NewsError extends NewsState {
  final String error;
  NewsError({required this.error});
}
