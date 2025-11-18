import 'package:flutter/material.dart';
import 'package:training_assignment_1/main.dart';
import 'package:training_assignment_1/page_a.dart';

class PageB extends StatelessWidget {
  // ページ遷移で引数を取得
  final String title;
  PageB({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("ページB"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Align(alignment: Alignment.centerRight, child: Text(title)),
            Expanded(
              child: Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(color: Colors.black, width: 10),
                    // shape: BoxShape.circleで円を作れる
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text("正円", style: TextStyle(fontSize: 24)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                  child: Text("HOMEへ"),
                ),
                Text("~~間~~"),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageA(title: "ページBからページA"),
                      ),
                    );
                  },
                  child: Text("ページAへ"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
