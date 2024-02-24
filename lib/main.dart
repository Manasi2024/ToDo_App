
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:flutter/material.dart';

import 'package:todolist/screens/home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (BuildContext context) => const load(),
        '/Home': (BuildContext context) => const Home(),
      },
    ),
  );
}

// ignore: camel_case_types
class load extends StatefulWidget {
  const load({super.key});

  @override
  State<load> createState() {
    return _loadState();
  }
}

// ignore: camel_case_types
class _loadState extends State<load> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home())));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Demo_App",
        home: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 150.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 110,
                      height: 110,
                      child: const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/td.png"),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      height: 10,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: SizedBox(

                          child:Text("  Do With My_ToDo ",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),),
                          width: 150,
                          height: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      height: 20,
                    ),
                    SizedBox(
                      width: 109,
                      height: 1.5,
                      child: const LinearProgressIndicator(
                        backgroundColor: Colors.lightBlue,
                        valueColor: AlwaysStoppedAnimation(Colors.black),
                        minHeight: 5,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ]),
            ),
          ),
        ));
  }
}





//------------------------------------------------------------------------------------------------------------------------------------------//
// import 'package:flutter/material.dart';
// import 'package:todolist/screens/home.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'To Do List',
//       home: Home(),
//     );
//   }
// }
//
//
// // Remaining task --->>        1. Edit option  2.sidebar(drawer)  3.profile details
