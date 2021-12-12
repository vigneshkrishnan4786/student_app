import 'package:flutter/material.dart';
import 'package:student_app/model/subjectmodel.dart';
import 'package:student_app/network/httpservice.dart';
import 'package:student_app/ui/viewdetail_subject.dart';

class SubjectPage extends StatefulWidget {
  const SubjectPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SubjectPage> {
  List<Subjects> subjectList = [];
  final HttpService httpService = HttpService();

  getSubjectList() async {
    SubjectModel subjectModel =
        await httpService.getSubjecttList("subjects/?api_key=D5baB");
    subjectList = subjectModel.subjects;
    setState(() {});
  }

  @override
  void initState() {
    getSubjectList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Subject details"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 20),
          child: ListView.builder(
            itemCount: subjectList.length,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ViewDetailSubject(
                            credits: subjectList[i].credits,
                            teacher: subjectList[i].teacher,
                            id: subjectList[i].id,
                            name: subjectList[i].name,
                          )));
                },
                child: Card(
                  child: ListTile(
                    title: Text(" ${subjectList[i].name}"),
                  ),
                  elevation: 8,
                  shadowColor: Colors.green,
                  margin: EdgeInsets.all(8),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Colors.white,
                      )),
                ),
              );
            },
          ),
        ));
  }
}
