import 'package:flutter/material.dart';

// パターン1 モデル化

class Block {
  Color blockColor;
  Color textColor;
  bool colorChanged;

  Block({
    this.blockColor = Colors.black12,
    this.textColor = Colors.black,
    this.colorChanged = false,
  });

  // 色を初期値に戻す場合のクラスメソッド
  Block colorReset() => Block();
}

class ColorModel extends ChangeNotifier {
  // 初期値をモデルで定義した初期値にする
  List<Block> blocks = List.generate(9, (_) {
    return Block();
  });

  void changeColor(int index, Color newBlockColor, Color newTextColor) {
    // すでに色を変更済みの場合はデフォルトの色に戻す
    final block = blocks[index];

    // 色を変更していたら初期値に戻す
    if (block.colorChanged) {
      blocks[index] = Block();
    } else {
      // 新しく色を変更する場合は引数で渡ってきた値を代入
      block.blockColor = newBlockColor;
      block.textColor = newTextColor;
      block.colorChanged = true;
    }

    // notifyListenersでモデルに保存する
    notifyListeners();
  }
}

// パターン2、これでもできるけどパターン1の方が良い
// class ColorModel extends ChangeNotifier {
//   // まずは初期値としてデフォルトの色を設定しておく
//
//   // ブロックは9個あるので9個分のデータを作成
//   List<Map<String, dynamic>> blocks = List.generate(9, (_) {
//     return {
//       "blockColor": Colors.black12,
//       "textColor": Colors.black,
//       "colorChanged": false,
//     };
//   });
//
//   void changeColor(int index, Color newBlockColor, Color newTextColor) {
//     // すでに色を変更済みの場合はデフォルトの色に戻す
//     if (blocks[index]["colorChanged"] == true) {
//       blocks[index] = {
//         "blockColor": Colors.black12,
//         "textColor": Colors.black,
//         "colorChanged": false,
//       };
//     } else {
//       // 新しく色を変更する場合
//       blocks[index]["blockColor"] = newBlockColor;
//       blocks[index]["textColor"] = newTextColor;
//       blocks[index]["colorChanged"] = true;
//     }
//
//     // notifyListenersでモデルに保存する
//     notifyListeners();
//   }
// }
