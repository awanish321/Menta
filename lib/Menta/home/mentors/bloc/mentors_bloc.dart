import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../model/mentors_model.dart';
import '../repository/mentors_repository.dart';
part 'mentors_event.dart';
part 'mentors_state.dart';

class MentorsBloc extends Bloc<MentorsEvent, MentorsState> {
  final MentorRepository _mentorRepository;

  MentorsBloc(this._mentorRepository) : super(MentorsInitial()) {
    on<FetchMentors>(_fetchMentors);
  }

  Future<void> _fetchMentors(FetchMentors event, Emitter<MentorsState> emit) async {
    emit(MentorsLoading());
    try {
      final mentors = await _mentorRepository.fetchMentors();
      emit(MentorsLoaded(mentors: mentors));
    } catch (e) {
      emit(MentorsError(e.toString()));
    }
  }

}