import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'industry_event.dart';
part 'industry_state.dart';

class IndustryBloc extends Bloc<IndustryEvent, IndustryState> {
  IndustryBloc() : super(IndustryInitial()) {
    on<FetchIndustries>(_onFetchIndustries);
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _onFetchIndustries(
      FetchIndustries event,
      Emitter<IndustryState> emit,
      ) async {
    emit(IndustryLoading());

    try {
      print('Fetching industries from Firestore...');
      final QuerySnapshot querySnapshot =
      await _firestore.collection('Industry').get();

      final List<Map<String, String>> industries = querySnapshot.docs
          .map((doc) => {
        'title': doc['title'].toString(),
        'iconUrl': doc['iconUrl'].toString(),
      })
          .toList();

      print('Industries fetched: $industries');
      emit(IndustryLoaded(industries: industries));
    } catch (e) {
      print('Error fetching industries: $e');
      emit(IndustryError(error: e.toString()));
    }
  }

}