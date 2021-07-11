import 'package:audiobooks/BooksProfile.dart';
import 'package:audiobooks/book_details.dart';
import 'package:audiobooks/book_home.dart';
import 'package:audiobooks/book_read.dart';
import 'package:audiobooks/books_splash.dart';
import 'package:audiobooks/infinity_list.dart';
import 'package:audiobooks/myweb.dart';
import 'package:flutter/material.dart';

import 'SelectextWebView.dart';

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
          primarySwatch: Colors.brown,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'SourceSansPro'),
      home:InfinitiList(),
    );
  }
}
