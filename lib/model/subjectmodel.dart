class SubjectModel {
  SubjectModel({
    required this.subjects,
  });
  late final List<Subjects> subjects;

  SubjectModel.fromJson(Map<String, dynamic> json){
    subjects = List.from(json['subjects']).map((e)=>Subjects.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['subjects'] = subjects.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Subjects {
  Subjects({
    required this.credits,
    required this.id,
    required this.name,
    required this.teacher,
  });
  late final int credits;
  late final int id;
  late final String name;
  late final String teacher;

  Subjects.fromJson(Map<String, dynamic> json){
    credits = json['credits'];
    id = json['id'];
    name = json['name'];
    teacher = json['teacher'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['credits'] = credits;
    _data['id'] = id;
    _data['name'] = name;
    _data['teacher'] = teacher;
    return _data;
  }
}