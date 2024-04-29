import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../model/hot_skills_model.dart';
import '../repository/hot_skills_repository.dart';

part 'hot_skills_event.dart';
part 'hot_skills_state.dart';

class HotSkillsBloc extends Bloc<HotSkillsEvent, HotSkillsState> {
  final HotSkillsRepository _hotSkillsRepository;

  HotSkillsBloc(this._hotSkillsRepository) : super(HotSkillsInitial()) {
    on<FetchHotSkills>(_onFetchHotSkills);
  }

  Future<void> _onFetchHotSkills(
      FetchHotSkills event,
      Emitter<HotSkillsState> emit,
      ) async {
    try {
      emit(HotSkillsLoading());
      final hotSkills = await _hotSkillsRepository.fetchHotSkills();
      emit(HotSkillsLoaded(hotSkills));
    } catch (e) {
      emit(HotSkillsError(e.toString()));
    }
  }
}