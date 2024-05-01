class Mentor {
  final String name;
  final List<String> roles;
  final String domain;
  final String years;
  final String image;

  Mentor({
    required this.name,
    required this.roles,
    required this.domain,
    required this.years,
    required this.image,
  });

  factory Mentor.fromJson(Map<String, dynamic> json) {
    List<String> roles = [];
    if (json['roles'] != null) {
      roles = List<String>.from(json['roles'] as List<dynamic>);
    }
    return Mentor(
      name: json['name'] ?? '',
      roles: roles,
      domain: json['domain'] ?? '',
      years: json['years'] ?? '',
      image: json['image'] ?? '',
    );
  }




}


