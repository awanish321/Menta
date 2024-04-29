import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/mentors_model.dart';

class MentorRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Mentor>> fetchMentors() async {
    try {
      final mentorsSnapshot = await _firestore.collection('Mentors').get();
      final mentors = mentorsSnapshot.docs
          .map((doc) => Mentor.fromJson(doc.data()))
          .toList();
      return mentors;
    } catch (e) {
      throw Exception('Failed to fetch mentors: $e');
    }
  }
}