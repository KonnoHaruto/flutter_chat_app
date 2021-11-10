import 'package:flutter/material.dart';

const messageDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightGreenAccent, width: 2.0),
  ),
);

const textFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'ここにメッセージを入力',
  border: InputBorder.none,
);

const sendButtonTextStyle = TextStyle(
  color: Colors.lightGreenAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);
