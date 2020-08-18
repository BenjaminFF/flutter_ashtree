import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart'; // Import the Counter

class Input extends StatefulWidget {
  const Input({this.decoration});

  final InputDecoration decoration;

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 16.0, color: Colors.blue),//输入文本的样式
      decoration: InputDecoration(
         border: OutlineInputBorder(),
      ),
    );
  }
}
