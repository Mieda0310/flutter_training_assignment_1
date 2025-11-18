import 'package:flutter/material.dart';

class PageA extends StatelessWidget {
  final String title;
  PageA({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("ページA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [Text(title)]),
      ),
    );
  }
}
