class Mentor {
  final String name;
  final String role;
  final String domain;
  final String years;
  final String image;

  Mentor({
    required this.name,
    required this.role,
    required this.domain,
    required this.years,
    required this.image,
  });

  factory Mentor.fromJson(Map<String, dynamic> json) {
    return Mentor(
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      domain: json['domain'] ?? '',
      years: json['years'] ?? '',
      image: json['image'] ?? '',
    );
  }
}