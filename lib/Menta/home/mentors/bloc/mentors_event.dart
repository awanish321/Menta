part of 'mentors_bloc.dart';

abstract class MentorsEvent extends Equatable {
  const MentorsEvent();

  @override
  List<Object> get props => [];
}

class FetchMentors extends MentorsEvent {}
