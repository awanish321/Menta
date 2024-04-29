import 'package:bloc/bloc.dart';
import 'package:courses/Menta/constants/strings.dart';
import 'package:equatable/equatable.dart';

import '../model/hot_skills_model.dart';
import '../repository/hot_skills_repository.dart';

part 'hotskills_event.dart';
part 'hotskills_state.dart';

class HotskillsBloc extends Bloc<HotskillsEvent, HotskillsState> {
  final HotSkillsRepository hotSkillsRepository;

  HotskillsBloc(this.hotSkillsRepository) : super(HotskillsInitial()) {
    on<FetchHotSkills>(_fetchHotSkills);
  }

  Future<void> _fetchHotSkills(FetchHotSkills event, Emitter<HotskillsState> emit) async {
    emit(HotSkillsLoading());
    try {
      final hotSkills = await hotSkillsRepository.fetchHotSkills();
      emit(HotSkillsLoaded(hotSkillsModel: hotSkills));
    } catch (e) {
      emit(HotSkillsError(error: e.toString()));
    }
  }

}
