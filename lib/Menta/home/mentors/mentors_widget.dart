import 'package:courses/Menta/home/mentors/repository/mentors_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../components/mentors_details_page.dart';
import 'bloc/mentors_bloc.dart';
import 'model/mentors_model.dart';

class MentorsScreen extends StatefulWidget {
  const MentorsScreen({super.key, required List<dynamic> mentors});

  @override
  State<MentorsScreen> createState() => _MentorsScreenState();
}

class _MentorsScreenState extends State<MentorsScreen> {
  late MentorsBloc _mentorsBloc;
  final MentorRepository _mentorRepository = MentorRepository();

  @override
  void initState() {
    super.initState();
    _mentorsBloc = MentorsBloc(_mentorRepository)..add(FetchMentors());
  }

  @override
  void dispose() {
    _mentorsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MentorsBloc, MentorsState>(
      bloc: _mentorsBloc,
      builder: (context, state) {
        if (state is MentorsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MentorsLoaded) {
          return _buildMentorsList(state.mentors);
        } else if (state is MentorsError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }

  Widget _buildMentorsList(List<Mentor> mentors) {
    return Material(
      elevation: 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Text(
              "Recently Active Mentors",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          OrientationBuilder(
            builder: (context, orientation) {
              final screenWidth = MediaQuery.of(context).size.width;
              int crossAxisCount =
              (orientation == Orientation.portrait && screenWidth < 600)
                  ? 2
                  : 4;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.7,
                ),
                itemCount: mentors.length,
                itemBuilder: (context, index) {
                  final mentor = mentors[index];
                  return InkWell(
                    focusColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MentorsDetailsPage(),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(mentor.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            mentor.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  // Text(
                                  //   mentor.roles.toString(),
                                  //   maxLines: 2,
                                  //   overflow: TextOverflow.ellipsis,
                                  //   style: const TextStyle(fontSize: 14),
                                  //   textAlign: TextAlign.center,
                                  // ),

                                  Text(
                                    mentor.roles.isNotEmpty ? mentor.roles.join(' | ') : 'No roles available',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 14),
                                    textAlign: TextAlign.center,
                                  ),


                                  // const Gap(4),
                                  const Divider(),
                                  // const Gap(4),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.domain,
                                                    size: 15,
                                                  ),
                                                  const Gap(5),
                                                  Expanded(
                                                    child: Text(
                                                      mentor.domain,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style: const TextStyle(
                                                          fontSize: 13),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.work_history_outlined,
                                                    size: 15,
                                                  ),
                                                  const Gap(5),
                                                  Expanded(
                                                    child: Text(
                                                      mentor.years,
                                                      style: const TextStyle(
                                                          fontSize: 13),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const Gap(20)
        ],
      ),
    );
  }
}




