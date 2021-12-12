import 'package:flutter/material.dart';
import 'package:student_app/model/classroommodel.dart';
import 'package:student_app/network/httpservice.dart';
import 'package:student_app/ui/viewdetail_classroom.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ClassPage> {
  List<Classrooms> classList = [];
  final HttpService httpService = HttpService();

  getClassList() async {
    ClassRoomModel classroomModel =
        await httpService.getClassList("classrooms/?api_key=D5baB");
    classList = classroomModel.classrooms;
    setState(() {});
  }

  @override
  void initState() {
    getClassList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Classroom details"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 20),
          child: ListView.builder(
            itemCount: classList.length,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ViewDetailClass(
                            layout: classList[i].layout,
                            size: classList[i].size,
                            id: classList[i].id,
                            name: classList[i].name,
                          )));
                },
                child: Card(
                  child: ListTile(
                    title: Text(" ${classList[i].name}"),
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
