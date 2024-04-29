part of 'mentors_bloc.dart';

abstract class MentorsState extends Equatable {
  const MentorsState();

  @override
  List<Object> get props => [];
}

class MentorsInitial extends MentorsState {}

class MentorsLoading extends MentorsState {}

class MentorsLoaded extends MentorsState {
  final List<Mentor> mentors;

  const MentorsLoaded({required this.mentors});

  @override
  List<Object> get props => [mentors];
}

class MentorsError extends MentorsState {
  final String message;

  const MentorsError(this.message);

  @override
  List<Object> get props => [message];
}