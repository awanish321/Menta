import 'package:flutter/material.dart';

class BookNowWidget extends StatefulWidget {
  const BookNowWidget({super.key});

  @override
  State<BookNowWidget> createState() => _BookNowWidgetState();
}

class _BookNowWidgetState extends State<BookNowWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Now"),
      ),
    );
  }
}
