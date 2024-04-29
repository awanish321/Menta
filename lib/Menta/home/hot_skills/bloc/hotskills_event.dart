part of 'hotskills_bloc.dart';

sealed class HotskillsEvent extends Equatable {
  const HotskillsEvent();

  @override
  List<Object?> get props => [];
}


class FetchHotSkills extends HotskillsEvent{}
