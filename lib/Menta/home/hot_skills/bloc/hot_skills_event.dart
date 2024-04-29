part of 'hot_skills_bloc.dart';

abstract class HotSkillsEvent extends Equatable {
  const HotSkillsEvent();
}

class FetchHotSkills extends HotSkillsEvent {
  @override
  List<Object> get props => [];
}