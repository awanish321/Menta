
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../firebase_options.dart';
// import 'home/home_screen.dart';
// import 'home/industry/bloc/industry_bloc.dart';
//
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<IndustryBloc>(
//           create: (BuildContext context) => IndustryBloc(),
//         ),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           textTheme: GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme),
//           // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           // useMaterial3: true,
//         ),
//         home: const HomeScreen(),
//       ),
//     );
//   }
// }




import 'package:courses/Menta/home/hot_skills/bloc/hotskills_bloc.dart';
import 'package:courses/Menta/home/hot_skills/repository/hot_skills_repository.dart';
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
        BlocProvider<HotskillsBloc>(
            create:(BuildContext context) => HotskillsBloc(HotSkillsRepository())
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}