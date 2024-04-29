// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import '../components/book_now_widget.dart';
// import '../components/mentors_details_page.dart';
//
// class MentorsScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> mentors = [
//     {
//       'name': 'John K.',
//       'role': 'Finance Analyst | Gldobqs | Consultant |IIT Ahmedabad | Accounting | Projects',
//       'domain': 'Finance',
//       'years': '2 Years',
//       'image':
//       'https://t3.ftcdn.net/jpg/03/02/88/46/360_F_302884605_actpipOdPOQHDTnFtp4zg4RtlWzhOASp.jpg',
//     },
//     {
//       'name': 'Priya Rai',
//       'role': 'Software Engineer | TCS Mumbai | Devops |Expert | IT Graduate',
//       'domain': 'IT',
//       'years': '8 Years',
//       'image':
//       'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg',
//     },
//     {
//       'name': 'Rajesh Kumar',
//       'role':
//       'American Express | IIM Indore | Ex Tata | Project | INTUR Kakinada',
//       'domain': 'Finance',
//       'years': '5 Years',
//       'image':
//       'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?cs=srgb&dl=pexels-stefan-stefancik-91227.jpg&fm=jpg',
//     },
//     {
//       'name': 'Susane Iyer',
//       'role': 'Software Engineer | TCS Mumbai | Devops |Expert | IIT Graduate',
//       'domain': 'IT',
//       'years': '15 Years',
//       'image':
//       'https://www.verywellmind.com/thmb/pwEmuUJ6KO9OF8jeiQCDyKnaVQI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-1187609003-73c8baf32a6a46a6b84fe931e0c51e7e.jpg',
//     },
//   ];
//
//   MentorsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 1.5,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//             child: Text("Recently Active Mentors", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
//           ),
//           OrientationBuilder(
//             builder: (context, orientation) {
//               final screenWidth = MediaQuery.of(context).size.width;
//               int crossAxisCount = (orientation == Orientation.portrait && screenWidth < 600)
//                   ? 2
//                   : 4;
//               return GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: crossAxisCount,
//                   mainAxisSpacing: 15,
//                   childAspectRatio: 0.7,
//                 ),
//                 itemCount: mentors.length,
//                 itemBuilder: (context, index) {
//                   return InkWell(
//                     focusColor: Colors.transparent,
//                     borderRadius: BorderRadius.circular(20),
//                     onTap: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => const MentorsDetailsPage()));
//                     },
//                     child: Card(
//                       color: Colors.white,
//                       elevation: 4,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       margin: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             // flex: 2,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: const BorderRadius.vertical(
//                                   top: Radius.circular(10),
//                                 ),
//                                 image: DecorationImage(
//                                   image: NetworkImage(mentors[index]['image']),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             // flex: 1,
//                             child: Padding(
//                               padding: const EdgeInsets.all(5.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     mentors[index]['name'],
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                                   Text(
//                                     mentors[index]['role'],
//                                     maxLines: 2,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: const TextStyle(fontSize: 12),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                   const Gap(4),
//                                   const Divider(),
//                                   const Gap(4),
//                                   Expanded(
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Expanded(
//                                           child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               Row(
//                                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                                 children: [
//                                                   const Icon(Icons.domain, size: 15,),
//                                                   const Gap(5),
//                                                   Text(mentors[index]['domain'], style: const TextStyle(fontSize: 12),),
//                                                 ],
//                                               ),
//                                               Row(
//                                                 children: [
//                                                   const Icon(Icons.work_history_outlined, size: 15,),
//                                                   const Gap(5),
//                                                   Text(mentors[index]['years'], style: const TextStyle(fontSize: 12),),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Expanded(
//                                           child: InkWell(
//                                             borderRadius: BorderRadius.circular(10),
//                                             onTap: (){
//                                               Navigator.push(context, MaterialPageRoute(builder: (context) => const BookNowWidget()));
//                                             },
//                                             child: Container(
//                                               height: 45,
//                                               width: 85,
//                                               decoration: BoxDecoration(
//                                                   color: Colors.blue.withOpacity(0.2),
//                                                   borderRadius: BorderRadius.circular(10)
//                                               ),
//                                               child: const Center(child: Text("Book Now", style: TextStyle(fontSize: 13, color: Colors.blue),)),
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//           const Gap(20)
//         ],
//       ),
//     );
//   }
// }



import 'package:courses/Menta/home/mentors/repository/mentors_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../components/book_now_widget.dart';
import '../components/mentors_details_page.dart';
import 'bloc/mentors_bloc.dart';
import 'model/mentors_model.dart';

class MentorsScreen extends StatefulWidget {
  const MentorsScreen({super.key});

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
                                  Text(
                                    mentor.role,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 13),
                                    textAlign: TextAlign.center,
                                  ),
                                  const Gap(4),
                                  const Divider(),
                                  const Gap(4),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                                      overflow: TextOverflow.ellipsis,
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
                                                  Text(
                                                    mentor.years,
                                                    style: const TextStyle(
                                                        fontSize: 13),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                const BookNowWidget(),
                                              ),
                                            );
                                          },
                                          child: Expanded(
                                            child: Container(
                                              height: 40,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                color: Colors.blue.withOpacity(0.2),
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "Book Now",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
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