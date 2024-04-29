class TrendingJobsModel{
  final String name;
  final String image;


  TrendingJobsModel({
    required this.name,
    required this.image
});

  factory TrendingJobsModel.fromJson(Map<String, dynamic> data) {
    return TrendingJobsModel(
      name: data['name'] ?? '',
      image: data['image'] ?? '',
    );
  }
}