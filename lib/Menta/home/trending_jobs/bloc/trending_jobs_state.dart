part of 'trending_jobs_bloc.dart';

sealed class TrendingJobsState extends Equatable {
  const TrendingJobsState();
  @override
  List<Object> get props => [];
}

final class TrendingJobsInitial extends TrendingJobsState {}

final class TrendingJobsLoadingState extends TrendingJobsState{}

final class TrendingJobsLoadedState extends TrendingJobsState{
  final List<TrendingJobsModel> trendingJobs;

 const TrendingJobsLoadedState({required this.trendingJobs});

 @override
  List<Object> get props => [trendingJobs];
}


final class TrendingJobsErrorState extends TrendingJobsState{
  final String error;

  const TrendingJobsErrorState({required this.error});

  @override
  List<Object> get props => [error];
}