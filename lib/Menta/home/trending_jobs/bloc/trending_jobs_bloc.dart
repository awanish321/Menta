import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/trending_jobs_model.dart';
import '../repository/trending_jobs_repository.dart';

part 'trending_jobs_event.dart';
part 'trending_jobs_state.dart';

class TrendingJobsBloc extends Bloc<TrendingJobsEvent, TrendingJobsState> {
  final TrendingJobsRepository trendingJobsRepository;

  TrendingJobsBloc(this.trendingJobsRepository) : super(TrendingJobsInitial()) {
    on<FetchTrendingJobsEvent>(_fetchTrendingJobs);
  }


  Future<void> _fetchTrendingJobs(FetchTrendingJobsEvent event, Emitter<TrendingJobsState> emit) async {
    emit(TrendingJobsLoadingState());
    try {
      final trendingJobs = await trendingJobsRepository.fetchTrendingJobs();
      emit(TrendingJobsLoadedState(trendingJobs: trendingJobs));
    } catch (e) {
      emit(TrendingJobsErrorState(error: e.toString()));
    }
  }

}
