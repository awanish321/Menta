import 'package:courses/Menta/home/hot_skills/repository/hot_skills_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/hot_skills_bloc.dart';
import 'model/hot_skills_model.dart';

class HotSkillsWidget extends StatelessWidget {
  const HotSkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HotSkillsBloc(HotSkillsRepository())..add(FetchHotSkills()),
      child: BlocBuilder<HotSkillsBloc, HotSkillsState>(
        builder: (context, state) {
          if (state is HotSkillsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HotSkillsLoaded) {
            return _buildHotSkillsWidget(state.hotSkills);
          } else if (state is HotSkillsError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildHotSkillsWidget(List<HotSkill> hotSkills) {
    return Material(
      elevation: 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("Hot Skills", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final double availableWidth = constraints.maxWidth;
                  final double itemWidth = (availableWidth / 3);
                  final double itemSpacing = (availableWidth - (itemWidth * 4)) / 20 + 22;
                  final int itemCount = hotSkills.length;

                  return Wrap(
                    spacing: itemSpacing,
                    runSpacing: itemSpacing,
                    alignment: WrapAlignment.center,
                    children: List.generate(
                      itemCount,
                          (index) => buildSkillCapsule(hotSkills[index]),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }



  Widget buildSkillCapsule(HotSkill hotSkill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            hotSkill.imagePath,
            width: 20,
            height: 20,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 8),
          Text(
            hotSkill.name,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}