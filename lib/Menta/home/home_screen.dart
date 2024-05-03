// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'hot_skills/hot_skills_widget.dart';
// import 'industry/industry_widget.dart';
// import 'mentors/mentors_widget.dart';
// import 'components/search_field_widget.dart';
// import 'trending_jobs/trending_jobs_widget.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SearchField(onChanged: (String ) {  },),
//               Gap(16),
//               IndustryScreen(),
//               Gap(16),
//               MentorsScreen(mentors: [],),
//               Gap(16),
//               HotSkillsWidget(),
//               Gap(16),
//               TrendingJobsScreen()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//




import 'package:courses/Menta/home/mentors/model/mentors_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'hot_skills/hot_skills_widget.dart';
import 'industry/industry_widget.dart';
import 'mentors/mentors_widget.dart';
import 'components/search_field_widget.dart';
import 'mentors/repository/mentors_repository.dart';
import 'trending_jobs/trending_jobs_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Mentor> mentors = [];

  @override
  void initState() {
    super.initState();
    _fetchMentors();
  }

  Future<void> _fetchMentors() async {
    try {
      final mentorRepository = MentorRepository();
      final fetchedMentors = await mentorRepository.fetchMentors();
      setState(() {
        mentors = fetchedMentors;
      });
    } catch (e) {
      debugPrint('Error fetching mentors: $e');
      // Handle error gracefully, show snackbar, retry, etc.
    }
  }

  void filterMentors(String query) {
    // Implement your filtering logic here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchField(),
              const Gap(16),
              const IndustryScreen(),
              const Gap(16),
              MentorsScreen(mentors: mentors),
              const Gap(16),
              const HotSkillsWidget(),
              const Gap(16),
              const TrendingJobsScreen()
            ],
          ),
        ),
      ),
    );
  }
}
