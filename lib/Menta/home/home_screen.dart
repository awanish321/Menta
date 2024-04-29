import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'hot_skills/hot_skills_widget.dart';
import 'industry/industry_widget.dart';
import 'mentors/mentors_widget.dart';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchField(),
            Gap(16),
            IndustryScreen(),
            Gap(16),
            MentorsScreen(),
            Gap(16),
            HotSkillsScreen(),
            Gap(16),
            TrendingJobsScreen()
          ],
        ),
      ),
    );
  }
}
