import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:training_assignment_1/main.dart';
import 'package:training_assignment_1/page_b.dart';

class PageA extends StatelessWidget {
  final String title;
  // ユーザーデータ関連
  final List<Map<String, String>> userObj = [
    {"name": "太郎", "handle": "@tarou"},
    {"name": "花子", "handle": "@hanako"},
    {"name": "平八郎", "handle": "@heihachiro"},
  ];
  // タイトル関連データ
  final List<Map<String, String>> postObj = [
    {"title": "Flutterで課題アプリ作成中。", "createdAt": "1"},
    {"title": "正円を作った。", "createdAt": "5"},
    {"title": "むむむむむ。", "createdAt": "12"},
  ];
  // オプション関連
  final List<Map<String, int>> optionObj = [
    {"commentCount": 12, "retweetCount": 5, "likeCount": 41},
    {"commentCount": 12, "retweetCount": 5, "likeCount": 41},
    {"commentCount": 12, "retweetCount": 5, "likeCount": 41},
  ];

  PageA({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("ページA"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: userObj.length + 1,
        itemBuilder: (context, index) {
          // 先頭の状態だけ特殊にする
          if (index == 0) {
            return _buildTopCard(context, title);
          }

          final user = userObj[index - 1];
          final post = postObj[index - 1];
          final option = optionObj[index - 1];

          return Column(
            children: [
              // 分割線はDivider使用
              Divider(color: Colors.grey, thickness: 1),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.account_circle,
                    color: Colors.blueAccent,
                    size: 42,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            user["name"] ?? "",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                          Text(user["handle"] ?? ""),
                          Text("・${post["createdAt"]}分" ?? ""),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(post["title"] ?? ""),
                      SizedBox(height: 8),
                      SizedBox(
                        // width: MediaQuery.of(context).size.width * 0.7で今の画面の大きさを取得
                        // *0.75で画面幅の75%にする
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.chat_bubble_outline),
                                SizedBox(width: 4),
                                Text(option["commentCount"].toString() ?? ""),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.repeat),
                                SizedBox(width: 4),
                                Text(option["retweetCount"].toString() ?? ""),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.favorite_border),
                                SizedBox(width: 4),
                                Text(option["likeCount"].toString() ?? ""),
                              ],
                            ),
                            Icon(Icons.share),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

Widget _buildTopCard(BuildContext context, String title) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(Icons.account_circle, color: Colors.blueAccent, size: 42),
      SizedBox(width: 16),
      Expanded(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Align(alignment: Alignment.topLeft, child: Text(title)),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(title: "Home"),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                        ),
                        child: Text(
                          "Homeへ",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PageB(title: "ページAからページB"),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                        ),
                        child: Text(
                          "ページBへ",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
