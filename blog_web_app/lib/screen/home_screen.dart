import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // ➊ 앱바 위젯 추가
        // ➋ 배경색 지정
        backgroundColor: Colors.orange,
        // ➌ 앱 타이틀 설정
        title: Text('Code Factory'),
        // ➍ 가운데 정렬
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: 'https://www.skttechacademy.com/',
        javascriptMode: JavascriptMode.unrestricted,
      ),

    );
  }
}