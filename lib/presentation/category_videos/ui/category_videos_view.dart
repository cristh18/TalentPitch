import 'package:flutter/material.dart';

class CategoryVideosView extends StatelessWidget {
  const CategoryVideosView({Key? key, required this.categoryVideosUrl})
      : super(key: key);

  final String categoryVideosUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryVideosUrl),
      ),
      body: const Center(
        child: Text('Category Videos View'),
      ),
    );
  }
}
