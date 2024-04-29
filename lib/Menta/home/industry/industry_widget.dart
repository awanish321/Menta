// import 'package:flutter/material.dart';
//
// import 'industry_details_page.dart';
//
// class IndustryScreen extends StatefulWidget {
//   const IndustryScreen({super.key});
//
//
//   @override
//   State<IndustryScreen> createState() => _IndustryScreenState();
// }
//
// class _IndustryScreenState extends State<IndustryScreen> {
//   bool showAllItems = false;
//
//   final List<Map<String, String>> industries = [
//     {
//       'title': 'Software Development',
//       'iconUrl':
//       // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQciUlqa59iO8fgewrf7rmozP0B8OLBi61U4g&s',
//       'https://r2.erweima.ai/imgcompressed/compressed_f1dc1a0dbd1f6efccf70f08edb01452e.webp'
//     },
//     {
//       'title': 'Machine Learning',
//       'iconUrl':
//       'https://imageio.forbes.com/specials-images/dam/imageserve/966248982/960x0.jpg?height=456&width=711&fit=bounds',
//     },
//     {
//       'title': 'Devops',
//       'iconUrl':
//       // 'https://www.mindinventory.com/blog/wp-content/uploads/2023/01/devops-trends-future-scope.webp',
//       'https://media.licdn.com/dms/image/D4D12AQGA7PPlEWoTMw/article-cover_image-shrink_600_2000/0/1687248687745?e=2147483647&v=beta&t=WK5pHtMq1_MsAdmfiW9clH_rSGfGrlrjL16OJ9REVMw'
//     },
//     {
//       'title': 'IT Security',
//       'iconUrl':
//       // 'https://t4.ftcdn.net/jpg/05/28/94/17/360_F_528941757_r6pWkIJcv88HKXGU3TGs74yIEhQnTwa0.jpg',
//       'https://c8.alamy.com/comp/2DE4KNH/cyber-security-vector-logo-with-shield-and-check-mark-security-shield-concept-internet-security-vector-illustration-2DE4KNH.jpg'
//     },
//     {
//       'title': 'Aviation',
//       'iconUrl':
//       'https://cdn.pixabay.com/photo/2023/07/16/20/47/ai-generated-8131428_1280.png',
//     },
//     {
//       'title': 'Engineering',
//       'iconUrl': 'https://cdn.dribbble.com/users/8022433/screenshots/16916154/eng3-01.jpg',
//     },
//     {
//       'title': 'Finance',
//       'iconUrl':
//       'https://media.istockphoto.com/id/1139202624/vector/isometric-target-with-arrow-hit-the-center-on-laptop-with-business-data-analysis.jpg?s=612x612&w=0&k=20&c=BJ7kv8KjG4tL10A-1jjCGVCYfsAdMaG02ASmAT9MEwk=',
//     },
//     {
//       'title': 'Graphics & Design',
//       'iconUrl':
//       'https://okcredit-blog-images-prod.storage.googleapis.com/2020/12/graphicdesign2.jpg',
//     },
//   ];
//
//   int _crossAxisCount(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     return (screenWidth / 100).round();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 1.5,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//             child: Text(
//               "Career Mentors by Industry",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//             ),
//           ),
//           LayoutBuilder(
//             builder: (context, constraints) {
//               return SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     GridView.builder(
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       padding: const EdgeInsets.all(12),
//                       gridDelegate:
//                       SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: _crossAxisCount(context),
//                         mainAxisExtent: 120,
//                         mainAxisSpacing: 10,
//                         crossAxisSpacing: 15
//                       ),
//                       itemCount:
//                       showAllItems ? industries.length : 4,
//                       itemBuilder: (context, index) {
//                         return IndustryTile(
//                           title: industries[index]['title']!,
//                           imageUrl: industries[index]['iconUrl']!,
//                         );
//                       },
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 20),
//                       child: Align(
//                         alignment: Alignment.bottomRight,
//                         child: TextButton(
//                           onPressed: () {
//                             setState(() {
//                               showAllItems = !showAllItems;
//                             });
//                           },
//                           child: Text(
//                             showAllItems ? "See Less" : "See More",
//                             style: TextStyle(
//                               fontSize: constraints.maxWidth < 400 ? 12 : 14,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class IndustryTile extends StatelessWidget {
//   final String title;
//   final String imageUrl;
//
//   const IndustryTile({
//     super.key,
//     required this.title,
//     required this.imageUrl,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         InkWell(
//           hoverColor: Colors.black,
//           borderRadius: BorderRadius.circular(30),
//           onTap: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context) => const IndustryDetailsPage()));
//           },
//           child: Container(
//             height: 70,
//             width: 70,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               image: DecorationImage(
//                 image: NetworkImage(imageUrl),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 8.0),
//         Expanded(
//           child: Text(
//             title,
//             style: const TextStyle(fontSize: 12),
//             textAlign: TextAlign.center,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),
//       ],
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'bloc/industry_bloc.dart';
// import 'industry_details_page.dart';
//
//
// class IndustryScreen extends StatefulWidget {
//   const IndustryScreen({super.key});
//
//   @override
//   State<IndustryScreen> createState() => _IndustryScreenState();
// }
//
// class _IndustryScreenState extends State<IndustryScreen> {
//   bool showAllItems = false;
//   final _industryBloc = IndustryBloc();
//
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<IndustryBloc>(context).add(FetchIndustries());
//   }
//
//   @override
//   void dispose() {
//     _industryBloc.close();
//     super.dispose();
//   }
//
//   int _crossAxisCount(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     return (screenWidth / 100).round();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 1.5,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//             child: Text(
//               "Career Mentors by Industry",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//             ),
//           ),
//           BlocBuilder<IndustryBloc, IndustryState>(
//             bloc: _industryBloc,
//             builder: (context, state) {
//               if (state is IndustryLoading) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (state is IndustryLoaded) {
//                 return LayoutBuilder(
//                   builder: (context, constraints) {
//                     return SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           GridView.builder(
//                             physics: const NeverScrollableScrollPhysics(),
//                             shrinkWrap: true,
//                             padding: const EdgeInsets.all(12),
//                             gridDelegate:
//                             SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: _crossAxisCount(context),
//                               mainAxisExtent: 120,
//                               mainAxisSpacing: 10,
//                               crossAxisSpacing: 15,
//                             ),
//                             itemCount:
//                             showAllItems ? state.industries.length : 4,
//                             itemBuilder: (context, index) {
//                               return IndustryTile(
//                                 title: state.industries[index]['title']!,
//                                 imageUrl: state.industries[index]['iconUrl']!,
//                               );
//                             },
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(right: 20),
//                             child: Align(
//                               alignment: Alignment.bottomRight,
//                               child: TextButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     showAllItems = !showAllItems;
//                                   });
//                                 },
//                                 child: Text(
//                                   showAllItems ? "See Less" : "See More",
//                                   style: TextStyle(
//                                     fontSize:
//                                     constraints.maxWidth < 400 ? 12 : 14,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               } else if (state is IndustryError) {
//                 return Center(child: Text(state.error));
//               } else {
//                 return const SizedBox.shrink();
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class IndustryTile extends StatelessWidget {
//   final String title;
//   final String imageUrl;
//
//   const IndustryTile({
//     super.key,
//     required this.title,
//     required this.imageUrl,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         InkWell(
//           hoverColor: Colors.black,
//           borderRadius: BorderRadius.circular(30),
//           onTap: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const IndustryDetailsPage()));
//           },
//           child: Container(
//             height: 70,
//             width: 70,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               image: DecorationImage(
//                 image: NetworkImage(imageUrl),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 8.0),
//         Expanded(
//           child: Text(
//             title,
//             style: const TextStyle(fontSize: 12),
//             textAlign: TextAlign.center,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),
//       ],
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/industry_bloc.dart';
import 'industry_details_page.dart';
import 'industry_tile_widget.dart';


class IndustryScreen extends StatefulWidget {
  const IndustryScreen({super.key});

  @override
  State<IndustryScreen> createState() => _IndustryScreenState();
}

class _IndustryScreenState extends State<IndustryScreen> {
  bool showAllItems = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<IndustryBloc>(context).add(FetchIndustries());
  }

  int _crossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return (screenWidth / 100).round();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              "Career Mentors by Industry",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          BlocBuilder<IndustryBloc, IndustryState>(
            builder: (context, state) {
              if (state is IndustryLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is IndustryLoaded) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(12),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: _crossAxisCount(context),
                              mainAxisExtent: 120,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 15,
                            ),
                            itemCount: showAllItems ? state.industries.length : 4,
                            itemBuilder: (context, index) {
                              return IndustryTileWidget(
                                title: state.industries[index]['title']!,
                                imageUrl: state.industries[index]['iconUrl']!,
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    showAllItems = !showAllItems;
                                  });
                                },
                                child: Text(
                                  showAllItems ? "See Less" : "See More",
                                  style: TextStyle(
                                    fontSize:
                                    constraints.maxWidth < 400 ? 12 : 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (state is IndustryError) {
                return Center(child: Text(state.error));
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}

// class IndustryTile extends StatelessWidget {
//   final String title;
//   final String imageUrl;
//   final GlobalKey _globalKey = GlobalKey();
//
//    IndustryTile({
//     super.key,
//     required this.title,
//     required this.imageUrl,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       key: _globalKey,
//       children: [
//         InkWell(
//           hoverColor: Colors.black,
//           borderRadius: BorderRadius.circular(30),
//           onTap: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const IndustryDetailsPage()));
//           },
//           child: Container(
//             height: 70,
//             width: 70,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               image: DecorationImage(
//                 image: NetworkImage(imageUrl),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 8.0),
//         Expanded(
//           child: Text(
//             title,
//             style: const TextStyle(fontSize: 12),
//             textAlign: TextAlign.center,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),
//       ],
//     );
//   }
// }
