import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/hot_skills_model.dart';

class HotSkillsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<HotSkill>> fetchHotSkills() async {
    final snapshot = await _firestore.collection('HotSkills').limit(8).get();
    return snapshot.docs.map((doc) => HotSkill.fromMap(doc.data())).toList();
  }
}