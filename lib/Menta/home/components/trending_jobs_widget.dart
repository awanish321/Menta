import 'package:courses/menta/home/components/trending_job_details_widget.dart';
import 'package:flutter/material.dart';

class TrendingJobsScreen extends StatefulWidget {
  const TrendingJobsScreen({super.key});

  @override
  State<TrendingJobsScreen> createState() => _TrendingJobsScreenState();
}

class _TrendingJobsScreenState extends State<TrendingJobsScreen> {
  bool showAllItems = false;

  final List<Map<String, String>> trendingJobs = [
    {
      'title': 'Software Development',
      'iconUrl': 'https://cdn-icons-png.flaticon.com/512/7991/7991055.png',
    },
    {
      'title': 'Artificial Intelligence',
      'iconUrl': 'https://cdn-icons-png.flaticon.com/512/8055/8055576.png',
    },
    {
      'title': 'IT Security',
      'iconUrl':
          'https://www.simplilearn.com/ice9/free_resources_article_thumb/infosecurityintro1-what_is_information_security.PNG',
    },
    {
      'title': 'Database',
      'iconUrl': 'https://cdn-icons-png.flaticon.com/512/9243/9243391.png',
    },
    {
      'title': 'Devops',
      'iconUrl': 'https://cdn-icons-png.flaticon.com/512/5687/5687273.png',
    },
    {
      'title': 'Machine Learning',
      'iconUrl': 'https://cdn-icons-png.flaticon.com/512/8637/8637091.png',
    },
    {
      'title': 'Banking',
      'iconUrl':
          'https://cdn-icons-png.freepik.com/256/2830/2830284.png?semt=ais_hybrid',
    },
    {
      'title': 'Finance',
      'iconUrl':
          'https://cdn-icons-png.freepik.com/256/781/781760.png?semt=ais_hybrid',
    },
  ];

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
              "Trending Jobs",
              style: TextStyle(fontSize: 18),
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _crossAxisCount(context),
              mainAxisExtent: 120,
              mainAxisSpacing: 12,
              crossAxisSpacing: 11,
            ),
            itemCount: showAllItems ? trendingJobs.length : 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: TrendingJobsTile(
                  title: trendingJobs[index]['title']!,
                  imageUrl: trendingJobs[index]['iconUrl']!,
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    showAllItems = !showAllItems;
                  });
                },
                child: Text(
                  showAllItems ? 'See less' : 'See more',
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  int _crossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return (screenWidth / 100).round();
  }
}

class TrendingJobsTile extends StatelessWidget {
  final String title;
  final String imageUrl;

  const TrendingJobsTile({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

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
