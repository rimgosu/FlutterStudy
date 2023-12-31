import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Upload Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;

  Future<void> _uploadImage() async {
    if (_image == null) {
      // 이미지가 선택되지 않은 경우
      return;
    }

    // 서버 엔드포인트 URL을 여러분의 서버 주소로 바꿔주세요.
    var url = Uri.parse('http://127.0.0.1:5000/');

    // 파일을 바이트로 읽어와 base64로 인코딩합니다.
    List<int> imageBytes = await _image!.readAsBytes();
    String base64Image = base64Encode(imageBytes);

    // 서버에 이미지를 업로드합니다.
    try {
      var response = await http.post(
        url,
        body: {'image': base64Image},
      );

      if (response.statusCode == 200) {
        // 업로드 성공
        print('Image uploaded successfully');
      } else {
        // 업로드 실패
        print('Image upload failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    //final pickedFile = await picker.getImage(source: ImageSource.gallery);
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Upload Example'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image!),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _getImage,
            tooltip: 'Pick Image',
            child: Icon(Icons.image),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _uploadImage,
            tooltip: 'Upload Image',
            child: Icon(Icons.cloud_upload),
          ),
        ],
      ),
    );
  }
}