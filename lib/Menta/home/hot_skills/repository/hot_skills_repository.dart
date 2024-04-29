import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses/Menta/home/hot_skills/model/hot_skills_model.dart';

class HotSkillsRepository{
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<HotSkillsModel>> fetchHotSkills() async {
    try{
      final hotSkillsSnapshot = await firestore.collection("HotSkills").get();
      final hotSkills = hotSkillsSnapshot.docs.map((doc) => HotSkillsModel.fromJson(doc.data())).toList();

      return hotSkills;
    }catch (e) {
      throw Exception("Failed to fetch HotSkills : $e");
    }

  }
}