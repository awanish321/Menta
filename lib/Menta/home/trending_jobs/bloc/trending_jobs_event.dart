part of 'trending_jobs_bloc.dart';

sealed class TrendingJobsEvent extends Equatable {
  const TrendingJobsEvent();


  @override
  List<Object?> get props => [];
}

final class FetchTrendingJobsEvent extends TrendingJobsEvent{}
