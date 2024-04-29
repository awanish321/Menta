part of 'industry_bloc.dart';

abstract class IndustryEvent extends Equatable {
  const IndustryEvent();

  @override
  List<Object> get props => [];
}

class FetchIndustries extends IndustryEvent {}