import 'package:courses/Menta/home/trending_jobs/repository/trending_jobs_repository.dart';
import 'package:courses/menta/home/components/trending_job_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/trending_jobs_bloc.dart';

class TrendingJobsScreen extends StatefulWidget {
  const TrendingJobsScreen({super.key});

  @override
  State<TrendingJobsScreen> createState() => _TrendingJobsScreenState();
}

class _TrendingJobsScreenState extends State<TrendingJobsScreen> {
  bool showAllItems = false;
  final TrendingJobsBloc _trendingJobBloc = TrendingJobsBloc(TrendingJobsRepository());

  @override
  void initState() {
    super.initState();
    _trendingJobBloc.add(FetchTrendingJobsEvent());
  }

  @override
  void dispose() {
    _trendingJobBloc.close();
    super.dispose();
  }

  double _calculateAspectRatio(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      if (screenWidth < 600) {
        return 1.2; // Portrait aspect ratio
      } else {
        return 1.9; // Landscape aspect ratio
      }
    } else {
      return 1.5; // Landscape aspect ratio
    }
  }


  double _calculateHeight(BuildContext context, double aspectRatio) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return 270; // Height for portrait mode
    } else {
      return 170; // Height for landscape mode
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingJobsBloc, TrendingJobsState>(
      bloc: _trendingJobBloc,
      builder: (context, state) {
        if (state is TrendingJobsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TrendingJobsLoadedState) {
          return Material(
            elevation: 1.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    "Trending Jobs",
                    style: TextStyle(fontSize: 18),
                  ),
                ),

                OrientationBuilder(
                  builder: (context, orientation){
                    double aspectRatio = _calculateAspectRatio(context);
                    double height = _calculateHeight(context, aspectRatio);
                    return SizedBox(
                      height: height,
                      width: double.infinity,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(12),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: _crossAxisCount(context),
                          mainAxisExtent: 120,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 11,
                        ),
                        itemCount:state.trendingJobs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: TrendingJobsTile(
                              title: state.trendingJobs[index].name,
                              imageUrl: state.trendingJobs[index].image,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}

int _crossAxisCount(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return (screenWidth / 100).round();
}

class TrendingJobsTile extends StatelessWidget {
  final String title;
  final String imageUrl;

  const TrendingJobsTile({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const TrendingJobsWidget()));
          },
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            title,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
