import 'dart:async';
import 'package:flutter/material.dart';
import 'package:student_app/model/subjectmodel.dart';
import 'package:student_app/network/httpservice.dart';

class ViewDetailScreen extends StatefulWidget {
  final int? age;
  final String? email;
  final int? id;
  final String? name;
  const ViewDetailScreen({Key? key, this.age, this.email, this.id, this.name})
      : super(key: key);

  @override
  _ViewDetailScreenState createState() => _ViewDetailScreenState();
}

class _ViewDetailScreenState extends State<ViewDetailScreen> {
  Subjects? _selectedSubject;
  List<Subjects> subjectList = [];
  final HttpService httpService = HttpService();

  getSubjectList() async {
    SubjectModel subjectModel =
        await httpService.getSubjecttList("subjects/?api_key=D5baB");
    subjectList = subjectModel.subjects;
    setState(() {});
  }

  saveData() async {
    if (_selectedSubject != null) {
      bool save = await httpService.saveRegis(
          "registration/?api_key=D5baB", widget.id!, _selectedSubject!.id);
      if (save) {
        showSnackBar(context, "Sucess");
      } else {
        showSnackBar(context, "failed");
      }
    }
  }

  @override
  void initState() {
    getSubjectList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
            padding: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: SizedBox(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Name :${widget.name}",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        " Age:${widget.age}",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Emailid :${widget.email}",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Center(
                        child: DropdownButton(
                          hint: Text(
                              'Please choose a Subject'), // Not necessary for Option 1
                          value: _selectedSubject,
                          onChanged: (Subjects? newValue) {
                            setState(() {
                              _selectedSubject = newValue;
                            });
                          },

                          items: subjectList.map((location) {
                            return DropdownMenuItem(
                              child: new Text(location.name),
                              value: location,
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(25),
                        child: FlatButton(
                          child: Text(
                            'submit',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: () {
                            saveData();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

    );
  }

  void showSnackBar(BuildContext context, String msg) {
    final scaffold = Scaffold.of(context);
    final snackBarContent = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
          label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    );
    scaffold.showSnackBar(snackBarContent);
  }
}
