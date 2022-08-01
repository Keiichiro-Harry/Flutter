import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // 左側のアイコン
        leading: Icon(Icons.arrow_back),
        // タイトルテキスト
        title: Text('Hello'),
        // 右側のアイコン一覧
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Card(
          child: ListTile(
            leading: Image.network('https://placehold.jp/50x50.png'),
            title: Text('Card and ListTile'),
            subtitle: Text('subtitle'),
            trailing: Icon(Icons.more_vert),
          ),
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          /*children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            // 太さを指定
            Text('Bold', style: TextStyle(fontWeight: FontWeight.bold)),
            // スタイルを指定
            Text('Italic', style: TextStyle(fontStyle: FontStyle.italic)),
            // サイズを指定
            Text('fontSize = 36', style: TextStyle(fontSize: 36)),
            // 色を指定
            Text('Red', style: TextStyle(color: Colors.red)),
            // 表示位置を指定
            Text('TextAlign.right', textAlign: TextAlign.right),
            Container(
              // 背景色
              color: Colors.blue,
              child: Text('blue'),
            ),
            Container(
              // 横幅
              width: 200,
              // 縦幅
              height: 50,
              color: Colors.blue,
              child: Text('200x50'),
            ),
            Container(
              // 内側の余白（パディング）
              padding: EdgeInsets.all(8),
              // 外側の余白（マージン）
              margin: EdgeInsets.all(8),
              color: Colors.blue,
              child: Text('padding / margin'),
            ),
            Container(
              decoration: BoxDecoration(
                // 枠線
                border: Border.all(color: Colors.blue, width: 2),
                // 角丸
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('border'),
            ),
            Container(
                decoration: BoxDecoration(
                  // 背景画像
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://play-lh.googleusercontent.com/5e7z5YCt7fplN4qndpYzpJjYmuzM2WSrfs35KxnEw-Ku1sClHRWHoIDSw3a3YS5WpGcI'),
                  ),
                ),
                child: Text('image'),
                width: 50,
                height: 50),
            TextButton(
              onPressed: () {/* ボタンが押せる時 */},
              style: TextButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text('押せるよ'),
            ),
            OutlinedButton(
              onPressed: () {/* ボタンが押せる時 */},
              style: OutlinedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text('押せるよ'),
            ),
            ElevatedButton.icon(
              onPressed: () {/* ボタンが押せる時 */},
              icon: Icon(Icons.thumb_up),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                elevation: 5,
              ),
              label: Text('押せるよ'),
            ),
            IconButton(
              onPressed: () {},
              // 表示アイコン
              icon: Icon(Icons.thumb_up),
              // アイコン色
              color: Colors.pink,
              // サイズ
              iconSize: 64,
            ),
          ],*/
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
