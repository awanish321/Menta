import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/trending_jobs_model.dart';

class TrendingJobsRepository{
  final FirebaseFirestore firestore = FirebaseFirestore.instance;


  Future<List<TrendingJobsModel>> fetchTrendingJobs() async {
    try {
      final trendingJobsSnapshot = await firestore.collection('TrendingJobs').get();
      final trendingJobs = trendingJobsSnapshot.docs
          .map((doc) => TrendingJobsModel.fromJson(doc.data()))
          .toList();
      return trendingJobs;
    } catch (e) {
      throw Exception('Failed to fetch Trending Jobs: $e');
    }
  }
}