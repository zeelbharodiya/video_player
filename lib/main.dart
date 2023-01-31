import 'package:flutter/material.dart';
import 'package:mb_videoplayer/views/screens/openpage.dart';

import 'homepage.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => HomePage(),
        'OpenPage' : (contret) => OpenPage(),
      },
    ),
  );
}