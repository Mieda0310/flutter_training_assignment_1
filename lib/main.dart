import 'package:flutter/material.dart';
import 'package:training_assignment_1/page_a.dart';
import 'package:training_assignment_1/page_b.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // TODO アプリを起動して最初だけAppBarのタイトルを変更する
  // final title = "課題1 ~UI編~";
  final title = "HOME";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ↓はcrossAxisAlignment: CrossAxisAlignment.startでも可能だが、1つのWidgetに対してならAlign
            Align(
              alignment: Alignment.centerLeft,
              child: const Text('ここはHOMEです。'),
            ),
            // CenterでGridViewを囲むだけでは中央添えにならないので、Expandedをで余白を均等に取り、上下中央に押し込む
            Expanded(
              child: Center(
                child: GridView.count(
                  primary: false,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  padding: const EdgeInsets.all(8.0),
                  // shrinkWrap、physicsはListViewでもあるもの
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  //  List.generate(9, (index) は for (int i = 0; i < 9; i++)と同じ
                  children: List.generate(9, (index) {
                    return Container(
                      alignment: Alignment.center,
                      // decorationがあると、Containerの中にcolorは定義できない。
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(index.toString()),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
      // SafeAreaは、自動でUIを安全な位置に置いてくれる仕組み
      // SafeAreaがあるおかげでフッターのボタンが見切れる事象を解決できる
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: SafeArea(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageA(title: "HomeからページA"),
                      ),
                    );
                  },
                  child: Text("ページAへ"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageB(title: "HomeからページB"),
                      ),
                    );
                  },
                  child: Text("ページBへ"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
