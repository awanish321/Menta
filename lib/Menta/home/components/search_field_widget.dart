// import 'package:flutter/material.dart';
//
// class SearchField extends StatelessWidget {
//   const SearchField({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 1.5,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//         child: TextFormField(
//           decoration: InputDecoration(
//             hintStyle: const TextStyle(fontSize: 14),
//             hintText: 'Search mentors by name, title, company',
//             border: OutlineInputBorder(
//               borderSide: const BorderSide(color: Colors.cyanAccent),
//               borderRadius: BorderRadius.circular(25),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: const BorderSide(color: Colors.cyanAccent, width: 2),
//               borderRadius: BorderRadius.circular(30),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: const BorderSide(color: Colors.cyanAccent, width: 2),
//               borderRadius: BorderRadius.circular(30),
//             ),
//             prefixIcon: const Icon(Icons.search_sharp),
//             contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//           ),
//         ),
//       ),
//     );
//   }
// }
//



import 'package:flutter/material.dart';

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

class SearchField extends StatefulWidget {
  final List<Mentor> mentors;

  const SearchField({Key? key, required this.mentors}) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController _searchController = TextEditingController();
  List<Mentor> filteredMentors = [];

  @override
  void initState() {
    filteredMentors = widget.mentors;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
          elevation: 1.5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextFormField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  filteredMentors = widget.mentors
                      .where((mentor) => mentor.name.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
              decoration: InputDecoration(
                hintStyle: const TextStyle(fontSize: 14),
                hintText: 'Search mentors by name, title, company',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.cyanAccent),
                  borderRadius: BorderRadius.circular(25),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.cyanAccent, width: 2),
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.cyanAccent, width: 2),
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon: const Icon(Icons.search_sharp),
                contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: filteredMentors.length,
          itemBuilder: (context, index) {
            final mentor = filteredMentors[index];
            return ListTile(
              title: Text(mentor.name),
              subtitle: Text(mentor.role),
            );
          },
        ),
      ],
    );
  }
}
