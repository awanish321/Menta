import 'package:courses/Menta/home/hot_skills/repository/hot_skills_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'bloc/hotskills_bloc.dart';

class HotSkillsScreen extends StatefulWidget {
  const HotSkillsScreen({super.key});

  @override
  State<HotSkillsScreen> createState() => _HotSkillsScreenState();
}


class _HotSkillsScreenState extends State<HotSkillsScreen> {
  bool showAllItems = false;

  late HotskillsBloc _hotskillsBloc;
  final HotSkillsRepository _hotSkillsRepository = HotSkillsRepository();

  @override
  void initState() {
    super.initState();
    _hotskillsBloc = HotskillsBloc(_hotSkillsRepository)..add(FetchHotSkills());
  }

  // @override
  // void dispose() {
  //   _hotskillsBloc.close();
  //   super.dispose();
  // }


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
              'Hot Skills',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: BlocBuilder<HotskillsBloc, HotskillsState>(
              builder: (context, state) {
                if (state is HotSkillsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is HotSkillsLoaded) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.hotSkillsModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      final skill = state.hotSkillsModel[index];
                      return SkillItem(
                        imageUrl: skill.image,
                        label: skill.label,
                        color: Colors.grey.withOpacity(0.2),
                      );
                    },
                  );
                } else if (state is HotSkillsError) {
                  return Center(child: Text(state.error));
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
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
                  showAllItems ? 'See Less' : 'See More',
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

// Widget build(BuildContext context) {
  //   return Material(
  //     elevation: 1.5,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  //           child: Text(
  //             'Hot Skills',
  //             style: TextStyle(
  //               fontSize: 18.0,
  //               fontWeight: FontWeight.w500,
  //             ),
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  //           child: BlocBuilder<HotskillsBloc, HotskillsState>(
  //             builder: (context, state) {
  //               if (state is HotSkillsLoading) {
  //                 return const Center(child: CircularProgressIndicator());
  //               } else if (state is HotSkillsLoaded) {
  //                 return Padding(
  //                   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  //                   child: Wrap(
  //                     spacing: 12.0,
  //                     runSpacing: 16.0,
  //                     children: state.hotSkillsModel.map((skill) {
  //                       return SkillItem(
  //                         imageUrl: skill.image,
  //                         label: skill.label,
  //                         color: Colors.grey.withOpacity(0.2),
  //                       );
  //                     }).toList(),
  //                   ),
  //                 );
  //               } else if (state is HotSkillsError) {
  //                 return Center(child: Text(state.error));
  //               } else {
  //                 return const SizedBox.shrink();
  //               }
  //             },
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(right: 20),
  //           child: Align(
  //             alignment: Alignment.bottomRight,
  //             child: TextButton(
  //               onPressed: () {
  //                 setState(() {
  //                   showAllItems = !showAllItems;
  //                 });
  //               },
  //               child: Text(
  //                 showAllItems ? 'See Less' : 'See More',
  //                 style: const TextStyle(fontSize: 12),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

class SkillItem extends StatelessWidget {
  final String imageUrl;
  final String label;
  final Color color;

  const SkillItem({
    super.key,
    required this.imageUrl,
    required this.label,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              imageUrl,
              width: 40,
              height: 30,
            ),
            const Gap(3),
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
