import 'package:courses/Menta/home/components/bottom_navigation_bar.dart';
import 'package:courses/Menta/home/hot_skills/bloc/hot_skills_bloc.dart';
import 'package:courses/Menta/home/hot_skills/repository/hot_skills_repository.dart';
import 'package:courses/Menta/home/trending_jobs/bloc/trending_jobs_bloc.dart';
import 'package:courses/Menta/home/trending_jobs/repository/trending_jobs_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../firebase_options.dart';
import 'home/home_screen.dart';
import 'home/industry/bloc/industry_bloc.dart';
import 'home/mentors/bloc/mentors_bloc.dart';
import 'home/mentors/repository/mentors_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<IndustryBloc>(
          create: (BuildContext context) => IndustryBloc(),
        ),
        BlocProvider<MentorsBloc>(
          create: (BuildContext context) => MentorsBloc(MentorRepository()),
        ),
        BlocProvider<HotSkillsBloc>(
            create:(BuildContext context) => HotSkillsBloc(HotSkillsRepository())
        ),
        BlocProvider<TrendingJobsBloc>(
            create: (BuildContext context) => TrendingJobsBloc(TrendingJobsRepository()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme),
        ),
        home: const BottomNavBar(
        ),
      ),
    );
  }
}