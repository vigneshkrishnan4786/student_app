import 'dart:convert';
import 'package:http/http.dart';
import 'package:student_app/model/classroommodel.dart';
import 'package:student_app/model/studentmodel.dart';
import 'package:student_app/model/subjectmodel.dart';

class HttpService {
  final String postsURL = "https://hamon-interviewapi.herokuapp.com/";

  Future<StudentModel> getStudentList(String url) async {
    Response res = await get(Uri.parse(postsURL + url));

    if (res.statusCode == 200) {
      StudentModel student = StudentModel.fromJson(jsonDecode(res.body));
      return student;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<SubjectModel> getSubjecttList(String url) async {
    Response res = await get(Uri.parse(postsURL + url));

    if (res.statusCode == 200) {
      SubjectModel subject = SubjectModel.fromJson(jsonDecode(res.body));
      return subject;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<bool> saveRegis(String url, int studId, int subId) async {
    Response res = await post(Uri.parse(postsURL + url),
        body: {'student': "$studId", 'subject': "$subId"});
    bool save = false;

    if (res.statusCode == 200) {
      res.body;
      save = true;
      return save;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<ClassRoomModel> getClassList(String url) async {
    Response res = await get(Uri.parse(postsURL + url));

    if (res.statusCode == 200) {
      ClassRoomModel classrooms = ClassRoomModel.fromJson(jsonDecode(res.body));
      return classrooms;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
