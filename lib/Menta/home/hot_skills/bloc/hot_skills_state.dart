part of 'hot_skills_bloc.dart';

abstract class HotSkillsState extends Equatable {
  const HotSkillsState();

  @override
  List<Object> get props => [];
}

class HotSkillsInitial extends HotSkillsState {}

class HotSkillsLoading extends HotSkillsState {}

class HotSkillsLoaded extends HotSkillsState {
  final List<HotSkill> hotSkills;

  const HotSkillsLoaded(this.hotSkills);

  @override
  List<Object> get props => [hotSkills];
}

class HotSkillsError extends HotSkillsState {
  final String message;

  const HotSkillsError(this.message);

  @override
  List<Object> get props => [message];
}