import 'package:flutter/material.dart';
import 'package:student_app/model/studentmodel.dart';
import 'package:student_app/network/httpservice.dart';
import 'package:student_app/ui/viewdetail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Students> studentList = [];
  final HttpService httpService = HttpService();

  getStudentList() async {
    StudentModel studentModel =
        await httpService.getStudentList("students/?api_key=D5baB");
    studentList = studentModel.students;
    setState(() {});
  }

  @override
  void initState() {
    getStudentList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 20),
        child: ListView.builder(
          itemCount: studentList.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ViewDetailScreen(
                          age: studentList[i].age,
                          email: studentList[i].email,
                          id: studentList[i].id,
                          name: studentList[i].name,
                        )));
              },
              child: Card(
                child: ListTile(
                  title: Text(" ${studentList[i].name}"),
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
      ),
    );
  }
}
