class HotSkill {
  final String name;
  final String imagePath;

  HotSkill({required this.name, required this.imagePath});

  factory HotSkill.fromMap(Map<String, dynamic> data) {
    return HotSkill(
      name: data['name'] ?? '',
      imagePath: data['imagePath'] ?? '',
    );
  }
}