import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'components/hot_skills_widget.dart';
import 'components/industry_widget.dart';
import 'components/mentors_widget.dart';
import 'components/search_field_widget.dart';
import 'components/trending_jobs_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchField(),
              const Gap(16),
              const IndustryScreen(),
              const Gap(16),
              MentorsScreen(),
              const Gap(16),
              const HotSkillsScreen(),
              const Gap(16),
              const TrendingJobsScreen()
            ],
          ),
        ),
      ),
    );
  }
}
