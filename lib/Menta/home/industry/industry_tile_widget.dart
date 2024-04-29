import 'package:flutter/material.dart';

import 'industry_details_page.dart';

class IndustryTileWidget extends StatefulWidget {
  final String title;
  final String imageUrl;

  const IndustryTileWidget({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  State<IndustryTileWidget> createState() => _IndustryTileWidgetState();
}

class _IndustryTileWidgetState extends State<IndustryTileWidget> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      key: _globalKey,
      children: [
        InkWell(
          hoverColor: Colors.black,
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const IndustryDetailsPage()));
          },
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(widget.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}