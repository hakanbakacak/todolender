import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/views/home/view/home_view.dart';
import 'package:todo_app/views/home/viewmodel/task_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryTextTheme: TextTheme(
          bodyText1: GoogleFonts.montserrat(fontWeight: FontWeight.w300, fontStyle: FontStyle.italic),
          headline4: GoogleFonts.montserrat(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        primaryColor: Color(0xffc8dbfa),
        accentColor: Color(0xffc8fae7),
        focusColor: Color(0xfffacec8),
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => TaskViewModel(),
        child: HomeView()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}