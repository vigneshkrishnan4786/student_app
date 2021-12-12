class ClassRoomModel {
  ClassRoomModel({
    required this.classrooms,
  });
  late final List<Classrooms> classrooms;

  ClassRoomModel.fromJson(Map<String, dynamic> json) {
    classrooms = List.from(json['classrooms'])
        .map((e) => Classrooms.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['classrooms'] = classrooms.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Classrooms {
  Classrooms({
    required this.id,
    required this.layout,
    required this.name,
    required this.size,
  });
  late final int id;
  late final String layout;
  late final String name;
  late final int size;

  Classrooms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    layout = json['layout'];
    name = json['name'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['layout'] = layout;
    _data['name'] = name;
    _data['size'] = size;
    return _data;
  }
}
