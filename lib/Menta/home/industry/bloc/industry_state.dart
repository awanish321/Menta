part of 'industry_bloc.dart';

abstract class IndustryState extends Equatable {
  const IndustryState();

  @override
  List<Object> get props => [];
}

class IndustryInitial extends IndustryState {}

class IndustryLoading extends IndustryState {}

class IndustryLoaded extends IndustryState {
  final List<Map<String, String>> industries;

  const IndustryLoaded({required this.industries});

  @override
  List<Object> get props => [industries];
}

class IndustryError extends IndustryState {
  final String error;

  const IndustryError({required this.error});

  @override
  List<Object> get props => [error];
}