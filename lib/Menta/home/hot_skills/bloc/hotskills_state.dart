part of 'hotskills_bloc.dart';

sealed class HotskillsState extends Equatable {
  const HotskillsState();

  @override
  List<Object> get props => [];
}

final class HotskillsInitial extends HotskillsState {}

final class HotSkillsLoading extends HotskillsState{}

final class HotSkillsLoaded extends HotskillsState{
  final List<HotSkillsModel> hotSkillsModel;

  const HotSkillsLoaded({required this.hotSkillsModel});

  @override
  List<Object> get props => [hotSkillsModel];
}


final class HotSkillsError extends HotskillsState{
  final String error;

  const HotSkillsError({required this.error});

  @override
  List<Object> get props => [error];
}
