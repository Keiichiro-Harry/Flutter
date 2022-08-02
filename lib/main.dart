import 'package:flutter/material.dart';

void main() {
  // 最初に表示するWidget
  runApp(MyApp());
}

//不変の初期設定部分
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 右上に表示される"debug"ラベルを消す
      debugShowCheckedModeBanner: false,
      // アプリ名
      title: 'My Todo App',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // リスト一覧画面を表示
      home: TodoListPage(),
    );
  }
}

// リスト一覧画面用Widget
//TodoListPageというWidgetを使う準備をするゾ
class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

//いざTodoListPage(1ページ目)
class _TodoListPageState extends State<TodoListPage> {
  // Todoリストのデータを入れる文字配列を準備するゾ
  final todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar(1番上)を表示し、タイトルも設定
      appBar: AppBar(
        title: Text('リスト一覧'),
      ),
      // データを元にListViewを作成
      body: ListView.builder(
        //todoList(さっき作った文字配列)の中身の数だけカードを作るゾ
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            title: Text(todoList[index]),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  todoList.removeAt(index);
                });
              },
              // 表示アイコン
              icon: Icon(Icons.thumb_up),
              // アイコン色
              color: Colors.blue,
              // サイズ
              iconSize: 40,
            ),
          ));
        },
      ),
      //右下のボタンを作るぞ
      floatingActionButton: FloatingActionButton(
        //押した時の処理だゾ、asyncとawaitはセット
        //ボタンの処理(todoListに新しいことを追加するまで)が終わる前に次の動作に移れるゾ
        onPressed: () async {
          // "push"で新規画面に遷移
          // リスト追加画面から渡される値を受け取る
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 遷移先の画面としてリスト追加画面を指定
              return TodoAddPage();
            }),
          );
          if (newListText != null) {
            // キャンセルした場合は newListText が null となるので注意
            setState(() {
              // リスト追加
              todoList.add(newListText);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

//TodoAddPageというWidgetを使う準備をするゾ
class TodoAddPage extends StatefulWidget {
  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}

//いざTodoAddPage(2ページ目)
class _TodoAddPageState extends State<TodoAddPage> {
  // 入力されたテキストをデータとして持つ文字変数の準備だゾ
  String _text = '';

  // データを元に表示するWidget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //1番上の表示設定だゾ
      appBar: AppBar(
        title: Text('リスト追加'),
      ),
      body: Container(
        // 余白を付ける
        padding: EdgeInsets.all(64),
        child: Column(
          //中央に並べてるゾ
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 入力されたテキストを入力ボックスの上に表示するゾ
            Text(_text, style: TextStyle(color: Colors.blue)),
            const SizedBox(height: 8),
            // テキスト入力
            TextField(
              // 入力されたテキストの値を受け取る（valueが入力されたテキスト）
              onChanged: (String value) {
                // データが変更したことを知らせる（画面を更新する）
                setState(() {
                  // データを作った箱に入れるゾ
                  _text = value;
                });
              },
            ),
            const SizedBox(height: 8),
            Container(
              // 横幅いっぱいに広げる
              width: double.infinity,
              // リスト追加ボタン
              child: ElevatedButton(
                onPressed: () {
                  // "pop"で前の画面に戻る
                  // "pop"の引数を前の画面にデータを渡すというか、
                  // 前の画面に戻るついでにデータをつれて帰る感じだゾ
                  Navigator.of(context).pop(_text);
                },
                child: Text('リスト追加', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              // 横幅いっぱいに広げる
              width: double.infinity,
              // キャンセルボタン
              child: TextButton(
                // ボタンをクリックした時の処理
                onPressed: () {
                  // "pop"で前の画面に戻る、引数はnullだゾ
                  Navigator.of(context).pop();
                },
                child: Text('キャンセル'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
