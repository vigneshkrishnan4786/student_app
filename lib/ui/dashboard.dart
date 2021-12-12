import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_app/screens/classroom_page.dart';
import 'package:student_app/screens/subject_page.dart';
import 'package:student_app/ui/home_page.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  get items => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DashBoard"),
          backgroundColor: Colors.white,
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueAccent[200]),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "STUDENT",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  )),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SubjectPage()));
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueAccent[200]),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.book,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "SUBJECT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    ],
                  )),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ClassPage()));
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueAccent[200]),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text(
                        "CLASS",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  )),
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueAccent[200]),
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_box_outlined,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text(
                      "Empty",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                )),
          ],
        ));
  }
}
