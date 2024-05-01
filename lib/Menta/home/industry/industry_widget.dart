import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/industry_bloc.dart';
import 'industry_tile_widget.dart';

class IndustryScreen extends StatefulWidget {
  const IndustryScreen({super.key});

  @override
  State<IndustryScreen> createState() => _IndustryScreenState();
}

class _IndustryScreenState extends State<IndustryScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<IndustryBloc>(context).add(FetchIndustries());
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
                return OrientationBuilder(
                  builder: (context, orientation) {
                    double aspectRatio = _calculateAspectRatio(context);
                    double height = _calculateHeight(context, aspectRatio);
                    return SizedBox(
                      height: height,
                      width: double.infinity,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(12),
                        itemCount: state.industries.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: _crossAxisCount(context),
                          crossAxisSpacing: 26,
                          childAspectRatio: aspectRatio,
                        ),
                        itemBuilder: (context, index) {
                          return IndustryTileWidget(
                            title: state.industries[index]['title']!,
                            imageUrl: state.industries[index]['iconUrl']!,
                          );
                        },
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

  int _crossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      if (screenWidth < 600) {
        return 2;
      } else {
        return 1;
      }
    } else {
      return 1;
    }
  }
}
