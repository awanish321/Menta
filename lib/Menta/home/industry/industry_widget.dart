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
                return SizedBox(
                  height: 270,
                  width: double.infinity,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(12),
                        itemCount: state.industries.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 30,
                          childAspectRatio: 1.2, //
                        ),
                        itemBuilder: (context, index) {
                          return IndustryTileWidget(
                            title: state.industries[index]['title']!,
                            imageUrl: state.industries[index]['iconUrl']!,
                          );
                        },
                      );
                    },
                  ),
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



