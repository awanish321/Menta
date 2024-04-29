class HotSkillsModel {
  final String label;
  final String image;

  HotSkillsModel({
    required this.label,
    required this.image,
  });

  factory HotSkillsModel.fromJson(Map<String, dynamic> json) {
    return HotSkillsModel(
      label: json['label'] ?? '',
      image: json['image'] ?? '',
    );
  }
}